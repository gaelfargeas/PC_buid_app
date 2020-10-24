#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <headers/main_class.h>
#include <headers/create_item.h>
#include <headers/image_qml.h>

int main(int argc, char *argv[])
{
    qmlRegisterType<Create_item>("Create_item", 1, 0, "Create_item");
    qmlRegisterType<main_class>("Main_class", 1, 0, "Main_class");
    qmlRegisterType<image_qml>("Image_qml", 1, 0, "Image_qml");

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    app.setOrganizationName("gaël fargeas");
    app.setOrganizationDomain("gaël fargeas");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
