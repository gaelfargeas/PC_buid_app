#ifndef COOLING_H
#define COOLING_H

#include <QObject>
#include <headers/enum_headers.h>

class cooling
{
public:
    cooling();
    //VARIABLES
    QString name;
    QList<CPU_SOCKET> supported_socket;
    COOLING_SIZE cooling_size;
    double cooling_min_sound_dB;
    double cooling_max_sound_dB;
    int cooling_min_speed;
    int cooling_max_speed;
    double air_flow_CFM;
    QString image_link;
    double price;
    QString buy_link;

    //OPERATORS
    bool operator==(cooling cl);

};

#endif // COOLING_H
