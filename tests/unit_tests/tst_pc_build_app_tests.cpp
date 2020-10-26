#include <QtTest>

// add necessary includes here
#include <headers/main_class.h>

class pc_build_app_tests : public QObject
{
    Q_OBJECT

public:
    pc_build_app_tests();
    ~pc_build_app_tests();

private slots:
    void test_socket_str_to_int();
    void test_chipset_str_to_int();
    void test_ram_type_str_to_int();
    void test_ram_speed_str_to_int();


    void test_apply_computer_case_list_filters();
    void test_computer_case_list_name_filter();
    void test_computer_case_motherboard_type_filter();


    void test_apply_motherboard_list_filters();
    void test_motherboard_list_type_filter();
    void test_motherboard_list_name_filter();
    void test_motherboard_list_chipset_filter();
    void test_motherboard_list_socket_filter();
    void test_motherboard_list_ram_filter();


    void test_apply_cpu_list_filters();
    void test_cpu_list_name_filter();
    void test_cpu_list_chipset_filter();
    void test_cpu_list_socket_filter();
    void test_cpu_list_ram_filter();


    void test_apply_cooling_list_filters();
    void test_cooling_list_name_filter();
    void test_cooling_list_fan_size_filter();

};

pc_build_app_tests::pc_build_app_tests()
{

}

pc_build_app_tests::~pc_build_app_tests()
{

}

void pc_build_app_tests::test_socket_str_to_int()
{
    main_class class_to_test;
    QVERIFY(class_to_test.socket_str_to_int("AMD_AM2") == 0);
    QVERIFY(class_to_test.socket_str_to_int("AMD_AM2_plus") == 1);
    QVERIFY(class_to_test.socket_str_to_int("AMD_AM3") == 2);
    QVERIFY(class_to_test.socket_str_to_int("AMD_AM3_plus") == 3);
    QVERIFY(class_to_test.socket_str_to_int("AMD_AM4") == 4);
    QVERIFY(class_to_test.socket_str_to_int("AMD_SP3") == 5);
    QVERIFY(class_to_test.socket_str_to_int("AMD_sTR4") == 6);
    QVERIFY(class_to_test.socket_str_to_int("AMD_sTRx4") == 7);
    QVERIFY(class_to_test.socket_str_to_int("LGA_1150") == 8);
    QVERIFY(class_to_test.socket_str_to_int("LGA_1151") == 9);
    QVERIFY(class_to_test.socket_str_to_int("LGA_1155") == 10);
    QVERIFY(class_to_test.socket_str_to_int("LGA_1156") == 11);
    QVERIFY(class_to_test.socket_str_to_int("LGA_1366") == 12);
    QVERIFY(class_to_test.socket_str_to_int("LGA_2011") == 13);
    QVERIFY(class_to_test.socket_str_to_int("LGA_2011_v3") == 14);
    QVERIFY(class_to_test.socket_str_to_int("LGA_2066") == 15);
    QVERIFY(class_to_test.socket_str_to_int("TOTO") == 16);
    QVERIFY(class_to_test.socket_str_to_int("AMD AMD INTEL INTEL") == 16);

}

void pc_build_app_tests::test_chipset_str_to_int()
{
    main_class class_to_test;
    QVERIFY(class_to_test.chipset_str_to_int("AMD_A68H") == 0);
    QVERIFY(class_to_test.chipset_str_to_int("AMD_760G") == 1);
    QVERIFY(class_to_test.chipset_str_to_int("AMD_B350") == 2);
    QVERIFY(class_to_test.chipset_str_to_int("AMD_B450") == 3);
    QVERIFY(class_to_test.chipset_str_to_int("AMD_X399") == 4);
    QVERIFY(class_to_test.chipset_str_to_int("Intel_H110") == 5);
    QVERIFY(class_to_test.chipset_str_to_int("Intel_H270") == 6);
    QVERIFY(class_to_test.chipset_str_to_int("Intel_H310") == 7);
    QVERIFY(class_to_test.chipset_str_to_int("Intel_H370") == 8);
    QVERIFY(class_to_test.chipset_str_to_int("Intel_B150") == 9);
    QVERIFY(class_to_test.chipset_str_to_int("Intel_B250") == 10);
    QVERIFY(class_to_test.chipset_str_to_int("Intel_B360") == 11);
    QVERIFY(class_to_test.chipset_str_to_int("Intel_B365") == 12);
    QVERIFY(class_to_test.chipset_str_to_int("Intel_Z170") == 13);
    QVERIFY(class_to_test.chipset_str_to_int("Intel_Z270") == 14);
    QVERIFY(class_to_test.chipset_str_to_int("Intel_Z370") == 15);
    QVERIFY(class_to_test.chipset_str_to_int("Intel_Z390") == 16);
    QVERIFY(class_to_test.chipset_str_to_int("Intel_X99") == 17);
    QVERIFY(class_to_test.chipset_str_to_int("Intel_X299") == 18);
    QVERIFY(class_to_test.chipset_str_to_int("TOTO") == 19);
    QVERIFY(class_to_test.chipset_str_to_int("AMD AMD INTEL INTEL") == 19);
}

void pc_build_app_tests::test_ram_type_str_to_int()
{
    main_class class_to_test;
    QVERIFY(class_to_test.ram_type_str_to_int("DDR3") == 0);
    QVERIFY(class_to_test.ram_type_str_to_int("DDR4") == 1);
    QVERIFY(class_to_test.ram_type_str_to_int("GDDR5") == 2);
    QVERIFY(class_to_test.ram_type_str_to_int("GDDR5X") == 3);
    QVERIFY(class_to_test.ram_type_str_to_int("GDDR6") == 4);
    QVERIFY(class_to_test.ram_type_str_to_int("TOTO") == 5);
    QVERIFY(class_to_test.ram_type_str_to_int("AMD AMD INTEL INTEL") == 5);

}

void pc_build_app_tests::test_ram_speed_str_to_int()
{

    main_class class_to_test;
    QVERIFY(class_to_test.ram_speed_str_to_int("1066Mhz") == 0);
    QVERIFY(class_to_test.ram_speed_str_to_int("1333Mhz") == 1);
    QVERIFY(class_to_test.ram_speed_str_to_int("1600Mhz") == 2);
    QVERIFY(class_to_test.ram_speed_str_to_int("1866Mhz") == 3);
    QVERIFY(class_to_test.ram_speed_str_to_int("2133Mhz") == 4);
    QVERIFY(class_to_test.ram_speed_str_to_int("2400Mhz") == 5);
    QVERIFY(class_to_test.ram_speed_str_to_int("2666Mhz") == 6);
    QVERIFY(class_to_test.ram_speed_str_to_int("2800Mhz") == 7);
    QVERIFY(class_to_test.ram_speed_str_to_int("2933Mhz") == 8);
    QVERIFY(class_to_test.ram_speed_str_to_int("3000Mhz") == 9);
    QVERIFY(class_to_test.ram_speed_str_to_int("3200Mhz") == 10);
    QVERIFY(class_to_test.ram_speed_str_to_int("3300Mhz") == 11);
    QVERIFY(class_to_test.ram_speed_str_to_int("3333Mhz") == 12);
    QVERIFY(class_to_test.ram_speed_str_to_int("3400Mhz") == 13);
    QVERIFY(class_to_test.ram_speed_str_to_int("3466Mhz") == 14);
    QVERIFY(class_to_test.ram_speed_str_to_int("3600Mhz") == 15);
    QVERIFY(class_to_test.ram_speed_str_to_int("3666Mhz") == 16);
    QVERIFY(class_to_test.ram_speed_str_to_int("3733Mhz") == 17);
    QVERIFY(class_to_test.ram_speed_str_to_int("3800Mhz") == 18);
    QVERIFY(class_to_test.ram_speed_str_to_int("3866Mhz") == 19);
    QVERIFY(class_to_test.ram_speed_str_to_int("4000Mhz") == 20);
    QVERIFY(class_to_test.ram_speed_str_to_int("4133Mhz") == 21);
    QVERIFY(class_to_test.ram_speed_str_to_int("4200Mhz") == 22);
    QVERIFY(class_to_test.ram_speed_str_to_int("4266Mhz") == 23);
    QVERIFY(class_to_test.ram_speed_str_to_int("4300Mhz") == 24);
    QVERIFY(class_to_test.ram_speed_str_to_int("4333Mhz") == 25);
    QVERIFY(class_to_test.ram_speed_str_to_int("4400Mhz") == 26);
    QVERIFY(class_to_test.ram_speed_str_to_int("4500Mhz") == 27);
    QVERIFY(class_to_test.ram_speed_str_to_int("4600Mhz") == 28);
    QVERIFY(class_to_test.ram_speed_str_to_int("4700Mhz") == 29);
    QVERIFY(class_to_test.ram_speed_str_to_int("4800Mhz") == 30);
    QVERIFY(class_to_test.ram_speed_str_to_int("TOTO") == 31);
    QVERIFY(class_to_test.ram_speed_str_to_int("AMD AMD INTEL INTEL") == 31);
}


// COMPUTER CASE
void pc_build_app_tests::test_apply_computer_case_list_filters()
{
    main_class class_to_test;
    QList<computer_case> computer_case_list;
    QList<computer_case> empty_list;

    computer_case c_case;
    c_case.name = "test";
    c_case.price = 100.1;
    c_case.image_link = "images";
    c_case.buy_link = "buy";

    c_case.supported_motherboard_size.append((MOTHERBOARD_TYPE) 1);
    c_case.supported_motherboard_size.append((MOTHERBOARD_TYPE) 2);

    computer_case_list.append(c_case);

    //apply_computer_case_list_filters( name, int : 0 = "" = no filter ; 1 = "ATX" ; 2 = "E_ATX" ; 3 = "Micro_ATX" ; 4 = "Mini_ATX" )
    //MOTHERBOARD_TYPE : 0 = "ATX" ; 1 = "E_ATX" ; 2 = "Micro_ATX" ; 3 = "Mini_ATX"

    QVERIFY(class_to_test.apply_computer_case_list_filters(computer_case_list, "", 0) == computer_case_list);
    QVERIFY(class_to_test.apply_computer_case_list_filters(computer_case_list, "test", 0) == computer_case_list);
    QVERIFY(class_to_test.apply_computer_case_list_filters(computer_case_list, "test", 5) == empty_list);
    QVERIFY(class_to_test.apply_computer_case_list_filters(computer_case_list, "", 2) == computer_case_list);
    QVERIFY(class_to_test.apply_computer_case_list_filters(computer_case_list, "", 3) == computer_case_list);
    QVERIFY(class_to_test.apply_computer_case_list_filters(computer_case_list, "", 4) == empty_list);
    QVERIFY(class_to_test.apply_computer_case_list_filters(computer_case_list, "no", 6) == empty_list);
}

void pc_build_app_tests::test_computer_case_list_name_filter()
{
    main_class class_to_test;
    QList<computer_case> computer_case_list;
    QList<computer_case> empty_list;

    computer_case c_case;
    c_case.name = "test";
    c_case.price = 100.1;
    c_case.image_link = "images";
    c_case.buy_link = "buy";

    c_case.supported_motherboard_size.append((MOTHERBOARD_TYPE) 1);
    c_case.supported_motherboard_size.append((MOTHERBOARD_TYPE) 2);

    computer_case_list.append(c_case);

    QVERIFY(class_to_test.computer_case_list_name_filter(computer_case_list, "") == computer_case_list);
    QVERIFY(class_to_test.computer_case_list_name_filter(computer_case_list, "toto") == empty_list);
    QVERIFY(class_to_test.computer_case_list_name_filter(computer_case_list, "test") == computer_case_list);
    QVERIFY(class_to_test.computer_case_list_name_filter(computer_case_list, "te") == computer_case_list);
}

void pc_build_app_tests::test_computer_case_motherboard_type_filter()
{
    main_class class_to_test;
    QList<computer_case> computer_case_list;
    QList<computer_case> empty_list;

    computer_case c_case;
    c_case.name = "test";
    c_case.price = 100.1;
    c_case.image_link = "images";
    c_case.buy_link = "buy";

    c_case.supported_motherboard_size.append((MOTHERBOARD_TYPE) 1);
    c_case.supported_motherboard_size.append((MOTHERBOARD_TYPE) 2);

    computer_case_list.append(c_case);

    QVERIFY(class_to_test.computer_case_motherboard_type_filter(computer_case_list, 0) == empty_list);
    QVERIFY(class_to_test.computer_case_motherboard_type_filter(computer_case_list, 3) == empty_list);
    QVERIFY(class_to_test.computer_case_motherboard_type_filter(computer_case_list, 100) == empty_list);
    QVERIFY(class_to_test.computer_case_motherboard_type_filter(computer_case_list, 1) == computer_case_list);
    QVERIFY(class_to_test.computer_case_motherboard_type_filter(computer_case_list, 2) == computer_case_list);
}


// MOTHERBOARD
void pc_build_app_tests::test_apply_motherboard_list_filters()
{
    main_class class_to_test;
    QList<motherboard> motherboard_list;
    QList<motherboard> empty_list;

    motherboard mb;
    mb.CPU_chipset = (CPU_SHIPSET) 5; // Intel_H110
    mb.CPU_socket = (CPU_SOCKET) 8; // LGA_1150
    mb.GPU_PCIE20_16x_number = 1;
    mb.GPU_PCIE30_16x_number = 1;
    mb.GPU_PCIE20_8x_number = 1;
    mb.GPU_PCIE30_8x_number = 1;
    mb.GPU_PCIE20_4x_number = 1;
    mb.GPU_PCIE30_4x_number = 1;
    mb.GPU_PCIE20_1x_number = 1;
    mb.GPU_PCIE30_1x_number = 1;
    mb.MB_type = (MOTHERBOARD_TYPE) 0; // ATX
    mb.M_2_slot_number = 1;
    mb.RAM_max_capacity = 64;
    mb.RAM_max_per_slot = 16;
    mb.RAM_slot_number = 4 ;
    mb.RAM_speed_supported.append((RAM_speed) 0); // _1066Mhz
    mb.RAM_speed_supported.append((RAM_speed) 1); // _1333Mhz
    mb.RAM_speed_supported.append((RAM_speed) 2); // _1600Mhz
    mb.RAM_type = (RAM_TYPE) 1; // DDR4
    mb.SATA_slot_number = 6 ;
    mb.buy_link = "buy";
    mb.image_link = "image";
    mb.name = "test";
    mb.power_pin = (MOTHERBOARD_POWER_PIN) 0; // ATX_4_pin
    mb.price  = 100.1;

    motherboard_list.append(mb);

    QVERIFY(class_to_test.apply_motherboard_list_filters(motherboard_list, {}, "", 0, 0, 0) == motherboard_list);
    QVERIFY(class_to_test.apply_motherboard_list_filters(motherboard_list, {}, "test", 0, 0, 0) == motherboard_list);
    QVERIFY(class_to_test.apply_motherboard_list_filters(motherboard_list, {}, "no", 0, 0, 0) == empty_list);
    QVERIFY(class_to_test.apply_motherboard_list_filters(motherboard_list, {0}, "", 0, 0, 0) == motherboard_list);
    QVERIFY(class_to_test.apply_motherboard_list_filters(motherboard_list, {1}, "", 0, 0, 0) == empty_list);
    QVERIFY(class_to_test.apply_motherboard_list_filters(motherboard_list, {}, "", 6, 0, 0) == motherboard_list);
    QVERIFY(class_to_test.apply_motherboard_list_filters(motherboard_list, {}, "", 2, 0, 0) == empty_list);
    QVERIFY(class_to_test.apply_motherboard_list_filters(motherboard_list, {}, "", 0, 9, 0) == motherboard_list);
    QVERIFY(class_to_test.apply_motherboard_list_filters(motherboard_list, {}, "", 0, 5, 0) == empty_list);
    QVERIFY(class_to_test.apply_motherboard_list_filters(motherboard_list, {}, "", 0, 0, 2) == motherboard_list);
    QVERIFY(class_to_test.apply_motherboard_list_filters(motherboard_list, {}, "", 0, 0, 4) == empty_list);
    QVERIFY(class_to_test.apply_motherboard_list_filters(motherboard_list, {0}, "test", 6, 9, 2) == motherboard_list);
    QVERIFY(class_to_test.apply_motherboard_list_filters(motherboard_list, {0}, "test", 6, 9, 4) == empty_list);
}

void pc_build_app_tests::test_motherboard_list_type_filter()
{
    main_class class_to_test;
    QList<motherboard> motherboard_list;
    QList<motherboard> empty_list;

    motherboard mb;
    mb.CPU_chipset = (CPU_SHIPSET) 5; // Intel_H110
    mb.CPU_socket = (CPU_SOCKET) 8; // LGA_1150
    mb.GPU_PCIE20_16x_number = 1;
    mb.GPU_PCIE30_16x_number = 1;
    mb.GPU_PCIE20_8x_number = 1;
    mb.GPU_PCIE30_8x_number = 1;
    mb.GPU_PCIE20_4x_number = 1;
    mb.GPU_PCIE30_4x_number = 1;
    mb.GPU_PCIE20_1x_number = 1;
    mb.GPU_PCIE30_1x_number = 1;
    mb.MB_type = (MOTHERBOARD_TYPE) 0; // ATX
    mb.M_2_slot_number = 1;
    mb.RAM_max_capacity = 64;
    mb.RAM_max_per_slot = 16;
    mb.RAM_slot_number = 4 ;
    mb.RAM_speed_supported.append((RAM_speed) 0); // _1066Mhz
    mb.RAM_speed_supported.append((RAM_speed) 1); // _1333Mhz
    mb.RAM_speed_supported.append((RAM_speed) 2); // _1600Mhz
    mb.RAM_type = (RAM_TYPE) 1; // DDR4
    mb.SATA_slot_number = 6 ;
    mb.buy_link = "buy";
    mb.image_link = "image";
    mb.name = "test";
    mb.power_pin = (MOTHERBOARD_POWER_PIN) 0; // ATX_4_pin
    mb.price  = 100.1;

    motherboard_list.append(mb);

    QVERIFY(class_to_test.motherboard_list_type_filter(motherboard_list, {0}) == motherboard_list);
    QVERIFY(class_to_test.motherboard_list_type_filter(motherboard_list, {1}) == empty_list);
    QVERIFY(class_to_test.motherboard_list_type_filter(motherboard_list, {2}) == empty_list);
    QVERIFY(class_to_test.motherboard_list_type_filter(motherboard_list, {0, 4}) == motherboard_list);
    QVERIFY(class_to_test.motherboard_list_type_filter(motherboard_list, {5,3}) == empty_list);
}

void pc_build_app_tests::test_motherboard_list_name_filter()
{
    main_class class_to_test;
    QList<motherboard> motherboard_list;
    QList<motherboard> empty_list;

    motherboard mb;
    mb.CPU_chipset = (CPU_SHIPSET) 5; // Intel_H110
    mb.CPU_socket = (CPU_SOCKET) 8; // LGA_1150
    mb.GPU_PCIE20_16x_number = 1;
    mb.GPU_PCIE30_16x_number = 1;
    mb.GPU_PCIE20_8x_number = 1;
    mb.GPU_PCIE30_8x_number = 1;
    mb.GPU_PCIE20_4x_number = 1;
    mb.GPU_PCIE30_4x_number = 1;
    mb.GPU_PCIE20_1x_number = 1;
    mb.GPU_PCIE30_1x_number = 1;
    mb.MB_type = (MOTHERBOARD_TYPE) 0; // ATX
    mb.M_2_slot_number = 1;
    mb.RAM_max_capacity = 64;
    mb.RAM_max_per_slot = 16;
    mb.RAM_slot_number = 4 ;
    mb.RAM_speed_supported.append((RAM_speed) 0); // _1066Mhz
    mb.RAM_speed_supported.append((RAM_speed) 1); // _1333Mhz
    mb.RAM_speed_supported.append((RAM_speed) 2); // _1600Mhz
    mb.RAM_type = (RAM_TYPE) 1; // DDR4
    mb.SATA_slot_number = 6 ;
    mb.buy_link = "buy";
    mb.image_link = "image";
    mb.name = "test";
    mb.power_pin = (MOTHERBOARD_POWER_PIN) 0; // ATX_4_pin
    mb.price  = 100.1;

    motherboard_list.append(mb);

    QVERIFY(class_to_test.motherboard_list_name_filter(motherboard_list, "") == motherboard_list);
    QVERIFY(class_to_test.motherboard_list_name_filter(motherboard_list, "test") == motherboard_list);
    QVERIFY(class_to_test.motherboard_list_name_filter(motherboard_list, "te") == motherboard_list);
    QVERIFY(class_to_test.motherboard_list_name_filter(motherboard_list, "no") == empty_list);
}

void pc_build_app_tests::test_motherboard_list_chipset_filter()
{
    main_class class_to_test;
    QList<motherboard> motherboard_list;
    QList<motherboard> empty_list;

    motherboard mb;
    mb.CPU_chipset = (CPU_SHIPSET) 5; // Intel_H110
    mb.CPU_socket = (CPU_SOCKET) 8; // LGA_1150
    mb.GPU_PCIE20_16x_number = 1;
    mb.GPU_PCIE30_16x_number = 1;
    mb.GPU_PCIE20_8x_number = 1;
    mb.GPU_PCIE30_8x_number = 1;
    mb.GPU_PCIE20_4x_number = 1;
    mb.GPU_PCIE30_4x_number = 1;
    mb.GPU_PCIE20_1x_number = 1;
    mb.GPU_PCIE30_1x_number = 1;
    mb.MB_type = (MOTHERBOARD_TYPE) 0; // ATX
    mb.M_2_slot_number = 1;
    mb.RAM_max_capacity = 64;
    mb.RAM_max_per_slot = 16;
    mb.RAM_slot_number = 4 ;
    mb.RAM_speed_supported.append((RAM_speed) 0); // _1066Mhz
    mb.RAM_speed_supported.append((RAM_speed) 1); // _1333Mhz
    mb.RAM_speed_supported.append((RAM_speed) 2); // _1600Mhz
    mb.RAM_type = (RAM_TYPE) 1; // DDR4
    mb.SATA_slot_number = 6 ;
    mb.buy_link = "buy";
    mb.image_link = "image";
    mb.name = "test";
    mb.power_pin = (MOTHERBOARD_POWER_PIN) 0; // ATX_4_pin
    mb.price  = 100.1;

    motherboard_list.append(mb);

    QVERIFY(class_to_test.motherboard_list_chipset_filter(motherboard_list, 0) == empty_list);
    QVERIFY(class_to_test.motherboard_list_chipset_filter(motherboard_list, 4) == empty_list);
    QVERIFY(class_to_test.motherboard_list_chipset_filter(motherboard_list, 5) == motherboard_list);
    QVERIFY(class_to_test.motherboard_list_chipset_filter(motherboard_list, 6) == empty_list);
    QVERIFY(class_to_test.motherboard_list_chipset_filter(motherboard_list, 20) == empty_list);
}

void pc_build_app_tests::test_motherboard_list_socket_filter()
{
    main_class class_to_test;
    QList<motherboard> motherboard_list;
    QList<motherboard> empty_list;

    motherboard mb;
    mb.CPU_chipset = (CPU_SHIPSET) 5; // Intel_H110
    mb.CPU_socket = (CPU_SOCKET) 8; // LGA_1150
    mb.GPU_PCIE20_16x_number = 1;
    mb.GPU_PCIE30_16x_number = 1;
    mb.GPU_PCIE20_8x_number = 1;
    mb.GPU_PCIE30_8x_number = 1;
    mb.GPU_PCIE20_4x_number = 1;
    mb.GPU_PCIE30_4x_number = 1;
    mb.GPU_PCIE20_1x_number = 1;
    mb.GPU_PCIE30_1x_number = 1;
    mb.MB_type = (MOTHERBOARD_TYPE) 0; // ATX
    mb.M_2_slot_number = 1;
    mb.RAM_max_capacity = 64;
    mb.RAM_max_per_slot = 16;
    mb.RAM_slot_number = 4 ;
    mb.RAM_speed_supported.append((RAM_speed) 0); // _1066Mhz
    mb.RAM_speed_supported.append((RAM_speed) 1); // _1333Mhz
    mb.RAM_speed_supported.append((RAM_speed) 2); // _1600Mhz
    mb.RAM_type = (RAM_TYPE) 1; // DDR4
    mb.SATA_slot_number = 6 ;
    mb.buy_link = "buy";
    mb.image_link = "image";
    mb.name = "test";
    mb.power_pin = (MOTHERBOARD_POWER_PIN) 0; // ATX_4_pin
    mb.price  = 100.1;

    motherboard_list.append(mb);

    QVERIFY(class_to_test.motherboard_list_socket_filter(motherboard_list, 0) == empty_list);
    QVERIFY(class_to_test.motherboard_list_socket_filter(motherboard_list, 7) == empty_list);
    QVERIFY(class_to_test.motherboard_list_socket_filter(motherboard_list, 8) == motherboard_list);
    QVERIFY(class_to_test.motherboard_list_socket_filter(motherboard_list, 9) == empty_list);
    QVERIFY(class_to_test.motherboard_list_socket_filter(motherboard_list, 20) == empty_list);
}

void pc_build_app_tests::test_motherboard_list_ram_filter()
{
    main_class class_to_test;
    QList<motherboard> motherboard_list;
    QList<motherboard> empty_list;

    motherboard mb;
    mb.CPU_chipset = (CPU_SHIPSET) 5; // Intel_H110
    mb.CPU_socket = (CPU_SOCKET) 8; // LGA_1150
    mb.GPU_PCIE20_16x_number = 1;
    mb.GPU_PCIE30_16x_number = 1;
    mb.GPU_PCIE20_8x_number = 1;
    mb.GPU_PCIE30_8x_number = 1;
    mb.GPU_PCIE20_4x_number = 1;
    mb.GPU_PCIE30_4x_number = 1;
    mb.GPU_PCIE20_1x_number = 1;
    mb.GPU_PCIE30_1x_number = 1;
    mb.MB_type = (MOTHERBOARD_TYPE) 0; // ATX
    mb.M_2_slot_number = 1;
    mb.RAM_max_capacity = 64;
    mb.RAM_max_per_slot = 16;
    mb.RAM_slot_number = 4 ;
    mb.RAM_speed_supported.append((RAM_speed) 0); // _1066Mhz
    mb.RAM_speed_supported.append((RAM_speed) 1); // _1333Mhz
    mb.RAM_speed_supported.append((RAM_speed) 2); // _1600Mhz
    mb.RAM_type = (RAM_TYPE) 1; // DDR4
    mb.SATA_slot_number = 6 ;
    mb.buy_link = "buy";
    mb.image_link = "image";
    mb.name = "test";
    mb.power_pin = (MOTHERBOARD_POWER_PIN) 0; // ATX_4_pin
    mb.price  = 100.1;

    motherboard_list.append(mb);

    QVERIFY(class_to_test.motherboard_list_ram_filter(motherboard_list, 0) == empty_list);
    QVERIFY(class_to_test.motherboard_list_ram_filter(motherboard_list, 1) == motherboard_list);
    QVERIFY(class_to_test.motherboard_list_ram_filter(motherboard_list, 6) == empty_list);
}

// CPU
void pc_build_app_tests::test_apply_cpu_list_filters()
{
    main_class class_to_test;
    QList<CPU> cpu_list;
    QList<CPU> empty_list;

    CPU cpu;
    cpu.TDP = 100;
    cpu.boosted_speed = 4500;
    cpu.buy_link = "buy";
    cpu.cache_L3_Mo = 12;
    cpu.clock_speed = 4000;
    cpu.core_number = 6;
    cpu.image_link = "image";
    cpu.max_RAM_speed_MHZ = (RAM_speed) 7; // _2800Mhz
    cpu.name = "test";
    cpu.price = 100.1;
    cpu.socket = (CPU_SOCKET) 8; // LGA_1150
    cpu.supported_RAM_type = (RAM_TYPE) 1; // DDR4
    cpu.supported_chipset.append((CPU_SHIPSET) 5);// Intel_H110
    cpu.supported_chipset.append((CPU_SHIPSET) 6);
    cpu.thread_number = 12;

    cpu_list.append(cpu);


    QVERIFY(class_to_test.apply_cpu_list_filters(cpu_list, "", "", "", "") == cpu_list);
    QVERIFY(class_to_test.apply_cpu_list_filters(cpu_list, "test", "LGA_1150", "", "") == cpu_list);
    QVERIFY(class_to_test.apply_cpu_list_filters(cpu_list, "test", "LGA_1150", "Intel_H110", "") == cpu_list);
    QVERIFY(class_to_test.apply_cpu_list_filters(cpu_list, "test", "LGA_1150", "Intel_H110", "DDR4") == cpu_list);
    QVERIFY(class_to_test.apply_cpu_list_filters(cpu_list, "test", "LGA_1150", "Intel_H110", "DDR3") == empty_list);
    QVERIFY(class_to_test.apply_cpu_list_filters(cpu_list, "no", "", "", "") == empty_list);
    QVERIFY(class_to_test.apply_cpu_list_filters(cpu_list, "test", "Intel_H110", "", "") == empty_list);
}

void pc_build_app_tests::test_cpu_list_name_filter()
{
    main_class class_to_test;
    QList<CPU> cpu_list;
    QList<CPU> empty_list;

    CPU cpu;
    cpu.TDP = 100;
    cpu.boosted_speed = 4500;
    cpu.buy_link = "buy";
    cpu.cache_L3_Mo = 12;
    cpu.clock_speed = 4000;
    cpu.core_number = 6;
    cpu.image_link = "image";
    cpu.max_RAM_speed_MHZ = (RAM_speed) 7; // _2800Mhz
    cpu.name = "test";
    cpu.price = 100.1;
    cpu.socket = (CPU_SOCKET) 8; // LGA_1150
    cpu.supported_RAM_type = (RAM_TYPE) 1; // DDR4
    cpu.supported_chipset.append((CPU_SHIPSET) 5);// Intel_H110
    cpu.supported_chipset.append((CPU_SHIPSET) 6);
    cpu.thread_number = 12;

    cpu_list.append(cpu);

    QVERIFY(class_to_test.cpu_list_name_filter(cpu_list, "") == cpu_list);
    QVERIFY(class_to_test.cpu_list_name_filter(cpu_list, "test") == cpu_list);
    QVERIFY(class_to_test.cpu_list_name_filter(cpu_list, "te") == cpu_list);
    QVERIFY(class_to_test.cpu_list_name_filter(cpu_list, "no") == empty_list);
}

void pc_build_app_tests::test_cpu_list_chipset_filter()
{
    main_class class_to_test;
    QList<CPU> cpu_list;
    QList<CPU> empty_list;

    CPU cpu;
    cpu.TDP = 100;
    cpu.boosted_speed = 4500;
    cpu.buy_link = "buy";
    cpu.cache_L3_Mo = 12;
    cpu.clock_speed = 4000;
    cpu.core_number = 6;
    cpu.image_link = "image";
    cpu.max_RAM_speed_MHZ = (RAM_speed) 7; // _2800Mhz
    cpu.name = "test";
    cpu.price = 100.1;
    cpu.socket = (CPU_SOCKET) 8; // LGA_1150
    cpu.supported_RAM_type = (RAM_TYPE) 1; // DDR4
    cpu.supported_chipset.append((CPU_SHIPSET) 5);// Intel_H110
    cpu.supported_chipset.append((CPU_SHIPSET) 6);
    cpu.thread_number = 12;

    cpu_list.append(cpu);

    QVERIFY(class_to_test.cpu_list_chipset_filter(cpu_list, 1) == empty_list);
    QVERIFY(class_to_test.cpu_list_chipset_filter(cpu_list, 4) == empty_list);
    QVERIFY(class_to_test.cpu_list_chipset_filter(cpu_list, 5) == cpu_list);
    QVERIFY(class_to_test.cpu_list_chipset_filter(cpu_list, 6) == cpu_list);
    QVERIFY(class_to_test.cpu_list_chipset_filter(cpu_list, 7) == empty_list);
}

void pc_build_app_tests::test_cpu_list_socket_filter()
{
    main_class class_to_test;
    QList<CPU> cpu_list;
    QList<CPU> empty_list;

    CPU cpu;
    cpu.TDP = 100;
    cpu.boosted_speed = 4500;
    cpu.buy_link = "buy";
    cpu.cache_L3_Mo = 12;
    cpu.clock_speed = 4000;
    cpu.core_number = 6;
    cpu.image_link = "image";
    cpu.max_RAM_speed_MHZ = (RAM_speed) 7; // _2800Mhz
    cpu.name = "test";
    cpu.price = 100.1;
    cpu.socket = (CPU_SOCKET) 8; // LGA_1150
    cpu.supported_RAM_type = (RAM_TYPE) 1; // DDR4
    cpu.supported_chipset.append((CPU_SHIPSET) 5); // Intel_H110
    cpu.supported_chipset.append((CPU_SHIPSET) 6);
    cpu.thread_number = 12;

    cpu_list.append(cpu);

    QVERIFY(class_to_test.cpu_list_socket_filter(cpu_list, 0) == empty_list);
    QVERIFY(class_to_test.cpu_list_socket_filter(cpu_list, 7) == empty_list);
    QVERIFY(class_to_test.cpu_list_socket_filter(cpu_list, 8) == cpu_list);
    QVERIFY(class_to_test.cpu_list_socket_filter(cpu_list, 9) == empty_list);
}

void pc_build_app_tests::test_cpu_list_ram_filter()
{
    main_class class_to_test;
    QList<CPU> cpu_list;
    QList<CPU> empty_list;

    CPU cpu;
    cpu.TDP = 100;
    cpu.boosted_speed = 4500;
    cpu.buy_link = "buy";
    cpu.cache_L3_Mo = 12;
    cpu.clock_speed = 4000;
    cpu.core_number = 6;
    cpu.image_link = "image";
    cpu.max_RAM_speed_MHZ = (RAM_speed) 7; // _2800Mhz
    cpu.name = "test";
    cpu.price = 100.1;
    cpu.socket = (CPU_SOCKET) 8; // LGA_1150
    cpu.supported_RAM_type = (RAM_TYPE) 1; // DDR4
    cpu.supported_chipset.append((CPU_SHIPSET) 5);// Intel_H110
    cpu.supported_chipset.append((CPU_SHIPSET) 6);
    cpu.thread_number = 12;

    cpu_list.append(cpu);

    QVERIFY(class_to_test.cpu_list_ram_filter(cpu_list, 0) == empty_list);
    QVERIFY(class_to_test.cpu_list_ram_filter(cpu_list, 1) == cpu_list);
    QVERIFY(class_to_test.cpu_list_ram_filter(cpu_list, 2) == empty_list);
    QVERIFY(class_to_test.cpu_list_ram_filter(cpu_list, 7) == empty_list);
}


// COOLING
void pc_build_app_tests::test_apply_cooling_list_filters()
{
    main_class class_to_test;
    QList<cooling> cooling_list;
    QList<cooling> empty_list;

    cooling cl;
    cl.air_flow_CFM = 100.1;
    cl.buy_link = "buy";
    cl.cooling_max_sound_dB = 30;
    cl.cooling_max_speed = 1200;
    cl.cooling_min_sound_dB = 26;
    cl.cooling_min_speed = 1000;
    cl.cooling_size = _140mm;
    cl.image_link = "image";
    cl.name = "test";
    cl.price = 100.1;
    cl.supported_socket.append(LGA_1150);
    cl.supported_socket.append(LGA_1151);

    cooling_list.append(cl);


    QVERIFY(class_to_test.apply_cooling_list_filters(cooling_list, "",_140mm) == empty_list);
    QVERIFY(class_to_test.apply_cooling_list_filters(cooling_list, "",_120mm) == cooling_list);
    QVERIFY(class_to_test.apply_cooling_list_filters(cooling_list, "test",_120mm) == cooling_list);
    QVERIFY(class_to_test.apply_cooling_list_filters(cooling_list, "no",_140mm) == empty_list);
    QVERIFY(class_to_test.apply_cooling_list_filters(cooling_list, "te",_140mm) == empty_list);
    QVERIFY(class_to_test.apply_cooling_list_filters(cooling_list, "no",_240mm) == empty_list);
}

void pc_build_app_tests::test_cooling_list_name_filter()
{
    main_class class_to_test;
    QList<cooling> cooling_list;
    QList<cooling> empty_list;

    cooling cl;
    cl.air_flow_CFM = 100.1;
    cl.buy_link = "buy";
    cl.cooling_max_sound_dB = 30;
    cl.cooling_max_speed = 1200;
    cl.cooling_min_sound_dB = 26;
    cl.cooling_min_speed = 1000;
    cl.cooling_size = _140mm;
    cl.image_link = "image";
    cl.name = "test";
    cl.price = 100.1;
    cl.supported_socket.append(LGA_1150);
    cl.supported_socket.append(LGA_1151);

    cooling_list.append(cl);

    QVERIFY(class_to_test.cooling_list_name_filter(cooling_list, "") == cooling_list);
    QVERIFY(class_to_test.cooling_list_name_filter(cooling_list, "test") == cooling_list);
    QVERIFY(class_to_test.cooling_list_name_filter(cooling_list, "te") == cooling_list);
    QVERIFY(class_to_test.cooling_list_name_filter(cooling_list, "no") == empty_list);
}

void pc_build_app_tests::test_cooling_list_fan_size_filter()
{
    main_class class_to_test;
    QList<cooling> cooling_list;
    QList<cooling> empty_list;

    cooling cl;
    cl.air_flow_CFM = 100.1;
    cl.buy_link = "buy";
    cl.cooling_max_sound_dB = 30;
    cl.cooling_max_speed = 1200;
    cl.cooling_min_sound_dB = 26;
    cl.cooling_min_speed = 1000;
    cl.cooling_size = _140mm;
    cl.image_link = "image";
    cl.name = "test";
    cl.price = 100.1;
    cl.supported_socket.append(LGA_1150);
    cl.supported_socket.append(LGA_1151);

    cooling_list.append(cl);

    QVERIFY(class_to_test.cooling_list_fan_size_filter(cooling_list, _120mm) == empty_list);
    QVERIFY(class_to_test.cooling_list_fan_size_filter(cooling_list, _140mm) == cooling_list);
    QVERIFY(class_to_test.cooling_list_fan_size_filter(cooling_list, _240mm) == empty_list);
    QVERIFY(class_to_test.cooling_list_fan_size_filter(cooling_list, _420mm) == empty_list);
}

// RAM


QTEST_MAIN(pc_build_app_tests)

#include "tst_pc_build_app_tests.moc"


