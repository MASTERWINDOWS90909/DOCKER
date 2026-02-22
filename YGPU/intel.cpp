#include <iostream>
#include <string>
#include <vector>

class IntelGPU {
private:
    std::string deviceName;
    int computeUnits;
    int maxClockSpeed;

public:
    IntelGPU(const std::string& name, int units, int clockSpeed)
        : deviceName(name), computeUnits(units), maxClockSpeed(clockSpeed) {}

    void printInfo() const {
        std::cout << "Intel GPU Device: " << deviceName << std::endl;
        std::cout << "Compute Units: " << computeUnits << std::endl;
        std::cout << "Max Clock Speed: " << maxClockSpeed << " MHz" << std::endl;
    }

    std::string getDeviceName() const { return deviceName; }
    int getComputeUnits() const { return computeUnits; }
    int getMaxClockSpeed() const { return maxClockSpeed; }
};

int main() {
    IntelGPU gpu("Intel Iris Xe", 96, 2400);
    gpu.printInfo();
    return 0;
}