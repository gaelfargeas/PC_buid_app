#ifndef CPU_H
#define CPU_H

#include <QObject>
#include <headers/enum_headers.h>

class CPU
{
public:
    CPU();
    // VARIABLES
    QString name;
    CPU_SOCKET socket;
    QList<CPU_SHIPSET> supported_chipset;
    int clock_speed;
    int boosted_speed;
    int cache_L3_Mo;
    int core_number;
    int thread_number;
    int TDP;
    RAM_TYPE supported_RAM_type;
    RAM_speed max_RAM_speed_MHZ;
    QString image_link;
    double price;
    QString buy_link;

    //OPERATORS
    bool operator==(CPU cpu);

};

#endif // CPU_H
