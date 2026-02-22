#!/usr/bin/perl
use strict;
use warnings;
use IO::Socket::INET;
use Getopt::Long;

package NetworkRouter;

sub new {
    my ($class, %args) = @_;
    my $self = {
        host => $args{host} || 'localhost',
        port => $args{port} || 8080,
        timeout => $args{timeout} || 30,
        routes => {},
        _socket => undef,
    };
    return bless $self, $class;
}

sub add_route {
    my ($self, $path, $callback) = @_;
    $self->{routes}->{$path} = $callback;
}

sub remove_route {
    my ($self, $path) = @_;
    delete $self->{routes}->{$path};
}

sub match_route {
    my ($self, $path) = @_;
    return $self->{routes}->{$path} if exists $self->{routes}->{$path};
    return undef;
}

sub list_routes {
    my ($self) = @_;
    return keys %{$self->{routes}};
}

sub start {
    my ($self) = @_;
    
    $self->{_socket} = IO::Socket::INET->new(
        LocalHost => $self->{host},
        LocalPort => $self->{port},
        Listen => 5,
        Reuse => 1,
    ) or die "Could not create socket: $!";
    
    print "Router listening on $self->{host}:$self->{port}\n";
    
    while (my $client = $self->{_socket}->accept()) {
        $self->_handle_request($client);
        $client->close();
    }
}

sub _handle_request {
    my ($self, $client) = @_;
    my $request = <$client>;
    return unless $request;
    
    my ($method, $path) = split /\s+/, $request;
    
    if (my $handler = $self->match_route($path)) {
        $handler->($method, $path);
    } else {
        print $client "HTTP/1.1 404 Not Found\r\n\r\n";
    }
}

1;