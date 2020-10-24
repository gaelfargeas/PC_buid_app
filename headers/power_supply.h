#ifndef POWER_SUPPLY_H
#define POWER_SUPPLY_H

#include <QObject>
#include <headers/enum_headers.h>

class power_supply
{
public:
    power_supply();
    //VARIABLES
    QString name;
    POWER_SUPPLY_STANDARD standard;
    POWER_SUPPLY_W power_W;
    int sata_power_cable;
    int pcie6_2_power_cable;
    int ATX_24_power_cable;
    int ATX_4_power_cable;
    int molex4_power_cable;
    QString image_link;
    double price;
    QString buy_link;
};

#endif // POWER_SUPPLY_H
