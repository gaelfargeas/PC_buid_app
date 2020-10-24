#ifndef IMAGE_QML_H
#define IMAGE_QML_H

#include <QObject>
#include <QDir>

class image_qml: public QObject
{
    Q_OBJECT
public:
    explicit image_qml(QObject *parent = nullptr);
    Q_INVOKABLE QString get_image_link(QString img_name);
};

#endif // IMAGE_QML_H
