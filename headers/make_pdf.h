#ifndef MAKE_PDF_H
#define MAKE_PDF_H

#include <QObject>
#include <QDebug>
#include <QDir>
#include <QTextDocument>
#include <QPainter>
#include <QPrinter>
#include <tiersparty/tableprinter/tableprinter.h>
#include <QStandardItemModel>
#include <headers/image_qml.h>

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


class make_pdf
{
public:
    explicit make_pdf();


    QList<computer_case> global_case_list;
    QList<cooling> global_cooling_list;
    QList<CPU> global_CPU_list;
    QList<GPU> global_GPU_list;
    QList<motherboard> global_motherboard_list;
    QList<RAM> global_RAM_list;
    QList<storage> global_storage_list;
    QList<power_supply> global_power_supply_list;


    bool init_globase_list(QList<computer_case> g_case_list, QList<cooling> g_cooling_list,
                           QList<CPU> g_CPU_list, QList<GPU> g_GPU_list,
                           QList<motherboard> g_motherboard_list, QList<RAM> g_RAM_list,
                           QList<storage> g_storage_list, QList<power_supply> g_power_supply_list);
    int create_pdf(QVariantMap component_list);
    bool check_pdf_dir();
    bool set_model_items(QVariantMap component_list,QStandardItemModel *model);
    void add_item(QStandardItemModel *model,QString image_link, QString name, float price);

};

#endif // MAKE_PDF_H
