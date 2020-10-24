#include "headers/image_qml.h"
#include <QDebug>
image_qml::image_qml(QObject *parent) : QObject(parent)
{

}

QString image_qml::get_image_link(QString img_name)
{
    QDir directory;
    directory.mkpath(".");
    return ( "file:/" +directory.absolutePath()+ "/images/"  + img_name );
}
