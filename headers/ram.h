#ifndef RAM_H
#define RAM_H

#include <QObject>
#include <headers/enum_headers.h>

class RAM
{
public:

    RAM();
    // VARIABLES
    QString name;
    RAM_TYPE TYPE;
    int memory_size;
    RAM_speed memory_speed;
    RAM_cas_latency CAS_latency;
    int module_number;
    QString image_link;
    double price;
    QString buy_link;

    //OPERATORS
    bool operator==(RAM ram);

};

#endif // RAM_H
