#ifndef GPU_H
#define GPU_H

#include <QObject>
#include <headers/enum_headers.h>
class GPU
{
public:
    GPU();
    //VARIABLES
    QString name;
    int clock;
    int boost_clock;
    int GPU_core_number;
    GPU_BUS GPU_bus;
    RAM_TYPE GPU_ram_type;
    int GPU_ram_size;
    int GPU_ram_frequency_MHZ;
    int GPU_flux;
    int power_consumption;
    GPU_POWER_CABLE_PIN power_clable_pin;
    QString image_link;
    double price;
    QString buy_link;

    //OPERATORS
    bool operator==(GPU gpu);

};

#endif // GPU_H
