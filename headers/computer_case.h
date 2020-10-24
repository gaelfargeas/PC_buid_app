#ifndef COMPUTER_CASE_H
#define COMPUTER_CASE_H

#include <QObject>
#include <headers/enum_headers.h>

// disclaimer : need to verify for watercooling
class computer_case
{
public:
    computer_case();
    //VARIABLES
    QString name;
    QList<MOTHERBOARD_TYPE> supported_motherboard_size;
    QString image_link;
    double price;
    QString buy_link;
    //DONE

};

#endif // COMPUTER_CASE_H
