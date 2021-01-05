#ifndef MAIN_CLASS_H
#define MAIN_CLASS_H

#include <QObject>
#include <QFile>
#include <QDir>
#include <QDirIterator>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJSValue>
#include <QJSEngine>

#include <QDebug>
#include <QQuickView>
#include <QUrl>
#include <QMetaObject>

#include <headers/make_pdf.h>

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



class main_class: public QObject
{
Q_OBJECT
private:

    make_pdf pdf_maker_class;


public:
    main_class(QObject *parent = nullptr);

    //VARIABLES
    QList<computer_case> global_case_list;
    QList<cooling> global_cooling_list;
    QList<CPU> global_CPU_list;
    QList<GPU> global_GPU_list;
    QList<motherboard> global_motherboard_list;
    QList<RAM> global_RAM_list;
    QList<storage> global_storage_list;
    QList<power_supply> global_power_supply_list;

    //FONCTION
    void init_list();

    Q_INVOKABLE void refresh_list();

    int socket_str_to_int(QString socket);
    int chipset_str_to_int(QString chipset);
    int ram_type_str_to_int(QString ram_type);
    int ram_speed_str_to_int(QString ram_speed);

    QList<computer_case> apply_computer_case_list_filters(QList<computer_case> list, QString name_filter, int mb_size_filter);
    QList<computer_case> computer_case_list_name_filter(QList<computer_case> list, QString name_filter);
    QList<computer_case> computer_case_motherboard_type_filter(QList<computer_case> list, int mb_size_filter);


    QList<motherboard> apply_motherboard_list_filters(QList<motherboard> list, QList<int> type, QString name_filter, int chipset, int socket, int ram);
    QList<motherboard> motherboard_list_type_filter(QList<motherboard> list, QList<int> type);
    QList<motherboard> motherboard_list_name_filter(QList<motherboard> list, QString name_filter);
    QList<motherboard> motherboard_list_chipset_filter(QList<motherboard> list, int chipset);
    QList<motherboard> motherboard_list_socket_filter(QList<motherboard> list, int socket);
    QList<motherboard> motherboard_list_ram_filter(QList<motherboard> list, int ram);


    QList<CPU> apply_cpu_list_filters(QList<CPU> list, QString name_filter, QString socket, QString chipset, QString ram_type);
    QList<CPU> cpu_list_name_filter(QList<CPU> list, QString name_filter);
    QList<CPU> cpu_list_chipset_filter(QList<CPU> list, int chipset);
    QList<CPU> cpu_list_socket_filter(QList<CPU> list, int socket);
    QList<CPU> cpu_list_ram_filter(QList<CPU> list, int ram_type);


    QList<cooling> apply_cooling_list_filters(QList<cooling> list, QString name_filter, int fan_size);
    QList<cooling> cooling_list_name_filter(QList<cooling> list, QString name_filter);
    QList<cooling> cooling_list_fan_size_filter(QList<cooling> list, COOLING_SIZE fan_size);

    QList<RAM> apply_ram_list_filters(QList<RAM> list, QList<int> ram_speed, QString name_filter, int ram_size_filter, QString ram_type,
                                      int size_slot, int max_module);
    QList<RAM> ram_list_name_filter(QList<RAM> list, QString name_filter);
    QList<RAM> ram_list_type_filter(QList<RAM> list, int ram_type);
    QList<RAM> ram_list_size_slot_filter(QList<RAM> list, int size_slot);
    QList<RAM> ram_list_speed_filter(QList<RAM> list, QList<int> ram_speed);
    QList<RAM> ram_list_size_filter(QList<RAM> list, int size_total);
    QList<RAM> ram_list_module_filter(QList<RAM> list, int remaining_module);


    QList<GPU> apply_gpu_list_filters(QList<GPU> list, int no_motherboard, QString name_filter, int pcie20_16x_slot, int pcie20_8x_slot,
                                      int pcie20_4x_slot, int pcie20_1x_slot, int pcie30_16x_slot,
                                      int pcie30_8x_slot, int pcie30_4x_slot, int pcie30_1x_slot,
                                      int used_pcie_16x, int used_pcie_8x, int used_pcie_4x, int used_pcie_1x,
                                      int gpu_ram_type, int gpu_power_cable);
    QList<GPU> gpu_list_name_filter(QList<GPU> list, QString name_filter);
    QList<GPU> gpu_list_bus_filter(QList<GPU> list, int pcie20_16x_slot, int pcie20_8x_slot,
                                   int pcie20_4x_slot, int pcie20_1x_slot, int pcie30_16x_slot,
                                   int pcie30_8x_slot, int pcie30_4x_slot, int pcie30_1x_slot,
                                   int used_pcie_16x, int used_pcie_8x, int used_pcie_4x, int used_pcie_1x);
    QList<GPU> gpu_list_ram_type_filter(QList<GPU> list, int gpu_ram_type);
    QList<GPU> gpu_list_power_cable_filter(QList<GPU> list, int gpu_power_cable);


    QList<storage> apply_storage_list_filters(QList<storage> list, int no_motherboard, QString name_filter,
                                              int storage_type, int storage_capacity, int remaining_sata, int remaining_M2);
    QList<storage> storage_list_name_filter(QList<storage> list, QString name_filter);
    QList<storage> storage_list_type_filter(QList<storage> list, int storage_type);
    QList<storage> storage_list_capacity_filter(QList<storage> list, int storage_capacity);
    QList<storage> storage_list_remaining_sata_filter(QList<storage> list, int remaining_sata);
    QList<storage> storage_list_remaining_M2_filter(QList<storage> list, int remaining_M2);


    QList<power_supply> apply_power_supply_list_filters(QList<power_supply> list, QString name_filter, int standard_filter, int power_filter);
    QList<power_supply> power_supply_list_name_filter(QList<power_supply> list, QString name_filter);
    QList<power_supply> power_supply_list_standard_filter(QList<power_supply> list, int standard_filter);
    QList<power_supply> power_supply_list_power_filter(QList<power_supply> list, int power_filter);


    Q_INVOKABLE void createPDF(QString case_name, QString motherboard, QString CPU, QString cooling, QVariant RAM, QVariant GPU, QVariant DD, QString power_supply);

    Q_INVOKABLE void get_case_list(QObject* obj, QString name_filter = "", int mb_size_filter = 0);

    Q_INVOKABLE void get_motherboard_list(QObject* obj, QString types, QString name_filter = "", int chipset = 0, int socket = 0, int ram = 0);

    Q_INVOKABLE void get_cpu_list(QObject* obj, QString name_filter = "", QString socket = "", QString chipset = "", QString ram_type = "");

    Q_INVOKABLE void get_cooling_list(QObject* obj, QString name_filter = "", int fan_size = 0);

    Q_INVOKABLE void get_ram_list(QObject* obj, QString ram_speed = "", QString name_filter = "",
                                  int ram_size_filter = 0, QString ram_type = "", int size = 0,
                                  int max_module = -1);

    Q_INVOKABLE void get_gpu_list(QObject* obj, int no_motherboard,QString name_filter = "", int pcie20_16x_slot = 0, int pcie20_8x_slot = 0,
                                  int pcie20_4x_slot = 0, int pcie20_1x_slot = 0, int pcie30_16x_slot = 0,
                                  int pcie30_8x_slot = 0, int pcie30_4x_slot = 0, int pcie30_1x_slot = 0,
                                  int used_pcie_16x = -1, int used_pcie_8x = -1, int used_pcie_4x = -1, int used_pcie_1x = -1,
                                  int gpu_ram_type = 0, int gpu_power_cable = 0);

    Q_INVOKABLE void get_storage_list(QObject* obj, int no_motherboard,QString name_filter = "",
                                      int storage_type = 0, int storage_capacity = 0, int max_sata = -1, int max_M2 = -1);

    Q_INVOKABLE void get_power_supply_list(QObject* obj, QString name_filter = "", int standard_filter = 0, int power_filter = 0);

    Q_INVOKABLE void import_component(QString file_path);
    Q_INVOKABLE void export_component(QString file_path);



};

#endif // MAIN_CLASS_H
