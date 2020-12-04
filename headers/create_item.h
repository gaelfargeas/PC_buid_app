#ifndef CREATE_ITEM_H
#define CREATE_ITEM_H

#include <QObject>
#include <QDebug>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>
#include <QDir>
#include <QFile>
#include <headers/enum_headers.h>


class Create_item : public QObject
{
Q_OBJECT
public:
    explicit Create_item(QObject *parent = nullptr);
    Q_INVOKABLE void create_case(QString name, QString supported_motherboard_type, double price, QString buy_link, QString image_link);
    Q_INVOKABLE void create_motherboard(QString name, int MB_type, int CPU_socket, int CPU_chipset, int RAM_type,
                                        QString RAM_speed_supported, int RAM_slot_number, int RAM_max_capacity, int RAM_max_per_slot,
                                        int GPU_PCIE20_16x_number, int GPU_PCIE20_8x_number, int GPU_PCIE20_4x_number, int GPU_PCIE20_1x_number,
                                        int GPU_PCIE30_16x_number, int GPU_PCIE30_8x_number, int GPU_PCIE30_4x_number, int GPU_PCIE30_1x_number,
                                        int SATA_slot_number, int M_2_slot_number,int power_pin, QString image_link, double price, QString buy_link);

    Q_INVOKABLE void create_CPU(QString name, int socket, QString supported_chipset, int clock_speed, int boosted_speed, int cache_L3_Mo,
                                int core_number, int thread_number, int TDP, int supported_RAM_type, int max_RAM_speed_MHZ, QString image_link,
                                double price, QString buy_link);

    Q_INVOKABLE void create_cooling(QString name, QString supported_socket, int cooling_size, double cooling_min_sound_dB,
                                    double cooling_max_sound_dB, int cooling_min_speed, int cooling_max_speed, double air_flow_CFM,
                                    QString image_link, double price, QString buy_link);

    Q_INVOKABLE void create_RAM(QString name, int TYPE, int memory_size, int memory_speed, QString image_link, int cas_latency, int module_number, double price, QString buy_link);

    Q_INVOKABLE void create_GPU(QString name, int clock, int boost_clock, int GPU_core_number, int GPU_bus, int GPU_ram_type,
                                int GPU_ram_size, int GPU_ram_frequency_MHZ, int GPU_flux, int power_consumption, int power_clable_pin,
                                QString image_link, double price, QString buy_link);

    Q_INVOKABLE void create_storage(QString name, int read_speed, int write_speed, int type, int capacity, int RPM, QString image_link, double price, QString buy_link);

    Q_INVOKABLE void create_power_supply(QString name, int standard, int power_W, int sata_power_cable, int pcie6_2_power_cable,
                                         int ATX_24_power_cable, int ATX_4_power_cable, int molex4_power_cable, QString image_link, double price,
                                         QString buy_link);

};

#endif // CREATE_ITEM_H
