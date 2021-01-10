#ifndef MOTHERBOARD_H
#define MOTHERBOARD_H

#include <QObject>
#include <headers/enum_headers.h>

class motherboard
{
public:
    motherboard();
    //VARIABLES
    QString name;
    MOTHERBOARD_TYPE MB_type;
    CPU_SOCKET CPU_socket;
    CPU_SHIPSET CPU_chipset;
    RAM_TYPE RAM_type;
    MOTHERBOARD_POWER_PIN power_pin;
    QList<int> RAM_speed_supported;
    int RAM_slot_number;
    int RAM_max_capacity;
    int RAM_max_per_slot;
    int GPU_PCIE_16x_number;
    int GPU_PCIE_8x_number;
    int GPU_PCIE_4x_number;
    int GPU_PCIE_1x_number;
    int SATA_slot_number;
    int M_2_slot_number;
    QString image_link;
    double price;
    QString buy_link;

    //OPERATORS
    bool operator==(motherboard mb);
};

#endif // MOTHERBOARD_H
