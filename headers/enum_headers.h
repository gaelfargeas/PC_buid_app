#ifndef ENUM_HEADERS_H
#define ENUM_HEADERS_H

//ENUMS

enum CPU_SOCKET {AMD_AM2,
                 AMD_AM2_plus,
                 AMD_AM3,
                 AMD_AM3_plus,
                 AMD_AM4,
                 AMD_SP3,
                 AMD_sTR4,
                 AMD_sTRx4,
                 LGA_1150,
                 LGA_1151,
                 LGA_1155,
                 LGA_1156,
                 LGA_1366,
                 LGA_2011,
                 LGA_2011_v3,
                 LGA_2066,
                };

enum CPU_SHIPSET{AMD_A68H,
                 AMD_760G,
                 AMD_A520,
                 AMD_B350,
                 AMD_B450,
                 AMD_B550,
                 AMD_X370,
                 AMD_X399,
                 AMD_X470,
                 AMD_X570,
                 AMD_TRX40,
                 Intel_H110,
                 Intel_H270,
                 Intel_H310,
                 Intel_H370,
                 Intel_B150,
                 Intel_B250,
                 Intel_B360,
                 Intel_B365,
                 Intel_Z170,
                 Intel_Z270,
                 Intel_Z370,
                 Intel_Z390,
                 Intel_X99,
                 Intel_X299,
                };

enum RAM_TYPE{DDR3,DDR4, GDDR5,GDDR5X,GDDR6};
enum RAM_cas_latency {CL22, CL21, CL20, CL19, CL18, CL17, CL16, CL15, CL14, CL13, CL12, CL11, CL10};
enum RAM_speed {_1066Mhz,_1333Mhz,_1600Mhz,_1866Mhz,_2133Mhz,_2400Mhz,_2666Mhz,_2800Mhz,_2933Mhz,_3000Mhz,_3200Mhz,
                _3300Mhz,_3333Mhz,_3400Mhz,_3466Mhz,_3600Mhz,_3666Mhz,_3733Mhz,_3800Mhz,_3866Mhz,_4000Mhz,_4133Mhz,
                _4200Mhz,_4266Mhz,_4300Mhz,_4333Mhz,_4400Mhz,_4500Mhz,_4600Mhz,_4700Mhz,_4800Mhz};

enum MOTHERBOARD_TYPE{ATX,E_ATX,Micro_ATX,Mini_ATX};
enum MOTHERBOARD_POWER_PIN{ATX_4_pin,ATX_8_pin,ATX_2x8_pin};

enum GPU_BUS{PCIE_16x, PCIE_8x,PCIE_4x,PCIE_1x};
enum GPU_POWER_CABLE_PIN{PCIE_8,PCIE_8_8,NONE};

enum COOLING_SIZE{_120mm,_140mm,_240mm,_280mm,_360mm,_420mm};

enum DD_type{HDD,SSD,M_2};
enum DD_capacity{_120GB,_250GB,_500GB,_1TB, _2TB,_4TB,_8TB};

enum POWER_SUPPLY_STANDARD{plus_80,plus_80_bronze,plus_80_silver,plus_80_gold,plus_80_platinium,plus_80_titanium};
enum POWER_SUPPLY_W{W300, W350, W400, W450, W500, W550, W600, W650, W700, W750, W800, W850, W900, W950, W1000, W1100, W1200, W1300, W1400, W1500, W1600};




#endif // ENUM_HEADERS_H

