#ifndef STORAGE_H
#define STORAGE_H

#include <QObject>
#include <headers/enum_headers.h>

class storage
{
public:
    storage();
    //VARIABLES
    QString name;
    DD_type type;
    int capacity_GO;
    int RPM;
    int write_speed;
    int read_speed;
    QString image_link;
    double price;
    QString buy_link;
    //DONE
};

#endif // STORAGE_H
