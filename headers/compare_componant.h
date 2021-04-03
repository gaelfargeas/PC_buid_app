#ifndef COMPARE_COMPONANT_H
#define COMPARE_COMPONANT_H

#include <QObject>
#include <QFile>
#include <QDir>
#include <QDirIterator>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJSValue>
#include <QJSEngine>

#include <headers/enum_headers.h>
#include <headers/computer_case.h>
#include <headers/cooling.h>
#include <headers/cpu.h>
#include <headers/gpu.h>
#include <headers/motherboard.h>
#include <headers/ram.h>
#include <headers/storage.h>
#include <headers/power_supply.h>


class computer_case;
class motherboard;
class CPU;
class cooling;
class RAM;
class GPU;
class storage;


class compare_componant : public QObject
{
    Q_OBJECT
public:
    compare_componant(QObject *parent = nullptr);

    //VARIABLES
    QList<computer_case> global_case_list;
    QList<cooling> global_cooling_list;
    QList<CPU> global_CPU_list;
    QList<GPU> global_GPU_list;
    QList<motherboard> global_motherboard_list;
    QList<RAM> global_RAM_list;
    QList<storage> global_storage_list;
    QList<power_supply> global_power_supply_list;


    void init_list();

    Q_INVOKABLE QVariantMap get_computer_case_name_list();
    Q_INVOKABLE QVariantMap get_computer_case(QString name);

    Q_INVOKABLE QVariantMap get_cpu_name_list();
    Q_INVOKABLE QVariantMap get_cpu(QString name);

    Q_INVOKABLE QVariantMap get_motherboard_name_list();
    Q_INVOKABLE QVariantMap get_motherboard(QString name);

    Q_INVOKABLE QVariantMap get_cooling_name_list();
    Q_INVOKABLE QVariantMap get_cooling(QString name);

    Q_INVOKABLE QVariantMap get_ram_name_list();
    Q_INVOKABLE QVariantMap get_ram(QString name);

    Q_INVOKABLE QVariantMap get_gpu_name_list();
    Q_INVOKABLE QVariantMap get_gpu(QString name);

    Q_INVOKABLE QVariantMap get_storage_name_list();
    Q_INVOKABLE QVariantMap get_storage(QString name);

    Q_INVOKABLE QVariantMap get_power_supply_name_list();
    Q_INVOKABLE QVariantMap get_power_supply(QString name);


    QString motherboard_size_int_to_str(int motherboard_size_int);
    QString motherboard_power_pin_int_to_str(int motherboard_power_pin_int);

    QString cpu_chipset_int_to_str(int cpu_chiptset_int);
    QString cpu_socket_int_to_str(int cpu_socket_int);

    QString ram_type_int_to_str(int ram_type_int);
    QString ram_speed_int_to_str(int ram_speed_int);

    QString storage_type_int_to_str(int storage_type_int);
    QString storage_capacity_int_to_str(int storage_capacity_int);

    QString gpu_bus_int_to_str(int gpu_bus_int);
    QString gpu_power_cable_pin_int_to_str(int gpu_power_cable_pin_int);

    QString cooling_size_int_to_str(int cooling_size_int);

    QString power_supply_W_int_to_str(int power_supply_W_int);
    QString power_supply_standard_int_to_str(int power_supply_standard_int);

};

#endif // COMPARE_COMPONANT_H
