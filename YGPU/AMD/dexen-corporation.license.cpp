/*
 * AMD GPU Dexen Corporation License
 * 
 * This source code is proprietary and confidential.
 * Unauthorized copying of this file, via any medium, is strictly prohibited.
 * 
 * Copyright (c) 2024 Dexen Corporation. All rights reserved.
 * 
 * This software is provided under the terms and conditions specified in the
 * Dexen Corporation Software License Agreement.
 * 
 * For more information, visit: https://dexen-corporation.com
 */

#ifndef DEXEN_CORPORATION_LICENSE_H
#define DEXEN_CORPORATION_LICENSE_H

namespace dexen {
namespace amd {
namespace gpu {

class License {
public:
    static const char* getVersion() {
        return "1.0.0";
    }
    
    static const char* getCopyright() {
        return "Copyright (c) 2024 Dexen Corporation. All rights reserved.";
    }
    
    static const char* getLicensee() {
        return "Dexen Corporation";
    }
};

} // namespace gpu
} // namespace amd
} // namespace dexen

#endif // DEXEN_CORPORATION_LICENSE_H