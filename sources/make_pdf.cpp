#include "headers/make_pdf.h"

class PrintBorder : public PagePrepare {
public:
    virtual void preparePage(QPainter *painter);
    static int pageNumber;
};

int PrintBorder::pageNumber = 0;

void PrintBorder::preparePage(QPainter *painter) { // print a border on each page
    QRect rec = painter->viewport();
    painter->setPen(QPen(QColor(0, 0, 0), 1));
    painter->drawRect(rec);
    painter->translate(10, painter->viewport().height() - 10);
    painter->drawText(0, 0, QString("Page %1").arg(pageNumber));
    pageNumber += 1;
}

make_pdf::make_pdf()
{

    //test
    check_pdf_dir();


}

bool make_pdf::init_globase_list(QList<computer_case> g_case_list, QList<cooling> g_cooling_list,
                                 QList<CPU> g_CPU_list, QList<GPU> g_GPU_list, QList<motherboard> g_motherboard_list,
                                 QList<RAM> g_RAM_list, QList<storage> g_storage_list, QList<power_supply> g_power_supply_list)
{
    try {

        global_case_list = g_case_list;
        global_motherboard_list =g_motherboard_list;
        global_CPU_list = g_CPU_list;
        global_cooling_list = g_cooling_list;
        global_RAM_list = g_RAM_list;
        global_GPU_list = g_GPU_list;
        global_storage_list = g_storage_list;
        global_power_supply_list = g_power_supply_list;
        return true;

    }  catch (...) {
        return false;
    }
}

int make_pdf::create_pdf(QVariantMap component_list)
{
    // ERROR CODE :
    // 1 : error in check pdf directory
    // 2:
    // ============================

    if (check_pdf_dir() == false)
    {
        return 1;
    }

    // set printer

    QPrinter printer(QPrinter::HighResolution);
    printer.setOutputFileName("./pdf/out.pdf");
    printer.setOutputFormat(QPrinter::PdfFormat);

    // set painter

    QPainter painter;
    painter.begin(&printer);

    // set model

    QStandardItemModel *model = new QStandardItemModel(1, 3);

    set_model_items(component_list, model);

    //


    // set tableprinter

    TablePrinter tablePrinter(&painter, &printer);

    tablePrinter.setPen(QPen(QColor(0, 0, 0), 3, Qt::DotLine)); // pen for borders
    tablePrinter.setHeaderColor(Qt::black);
    tablePrinter.setContentColor(Qt::black);
    tablePrinter.setCellMargin(10, 5, 5, 5);
    tablePrinter.setPageMargin(100, 40, 40, 40);





    QVector<int> columnStretch = QVector<int>() << 1 << 1 << 1;

    // set table header

    QVector<QString> headers = QVector<QString>() << "" << "name" << "cost";



    // set border

    PrintBorder *printB = new PrintBorder;
    printB->pageNumber = 1;
    tablePrinter.setPagePrepare(printB);



    // make the pdf

    if(!tablePrinter.printTable(model, columnStretch, headers)) {
        qInfo() << tablePrinter.lastError();
        return false;
    }

    painter.end();

    return true;
}

bool make_pdf::check_pdf_dir()
{
    try {

        QDir directory(".");
        if (!directory.exists("./pdf"))
        {
            //create directory
            qInfo()<<"create pdf directory";
            directory.mkdir("./pdf");
        }
        return true;

    }
    catch (...) {
        return false;
    }

}

bool make_pdf::set_model_items(QVariantMap component_list, QStandardItemModel *model)
{

    try {

        int total_cost = 0;

        // case
        if (component_list["case"] != "")
        {
            QString case_name = component_list["case"].toString();
            qInfo() << "case name :" << case_name;

            for(computer_case ccase : global_case_list)
            {
                if (ccase.name == case_name )
                {
                    // get case icon
                    QString case_icon = ccase.image_link;

                    // get case price
                    float case_price = ccase.price ;

                    // add item
                    add_item(model, case_icon, case_name, case_price);
                    total_cost += case_price;

                }
            }
        }

        // motherboard
        if (component_list["motherboard"] != "")
        {
            QString motherboard_name = component_list["motherboard"].toString();
            qInfo() << "motherboard name :" << motherboard_name;

            for(motherboard mmotherboard : global_motherboard_list)
            {
                if (mmotherboard.name == motherboard_name )
                {
                    // get motherboard icon
                    QString motherboard_icon = mmotherboard.image_link;

                    // get motherboard price
                    float motherboard_price = mmotherboard.price ;

                    // add item
                    add_item(model, motherboard_icon, motherboard_name, motherboard_price);
                    total_cost += motherboard_price;

                }
            }
        }

        // CPU
        if (component_list["CPU"] != "")
        {
            QString CPU_name = component_list["CPU"].toString();
            qInfo() << "CPU name :" << CPU_name;

            for(CPU cCPU : global_CPU_list)
            {
                if (cCPU.name == CPU_name )
                {
                    // get CPU icon
                    QString CPU_icon = cCPU.image_link;

                    // get CPU price
                    float CPU_price = cCPU.price ;

                    // add item
                    add_item(model, CPU_icon, CPU_name, CPU_price);
                    total_cost += CPU_price;

                }
            }
        }

        // cooling
        if (component_list["cooling"] != "")
        {
            QString cooling_name = component_list["cooling"].toString();
            qInfo() << "cooling name :" << cooling_name;

            for(cooling ccooling : global_cooling_list)
            {
                if (ccooling.name == cooling_name )
                {
                    // get cooling icon
                    QString cooling_icon = ccooling.image_link;

                    // get cooling price
                    float cooling_price = ccooling.price ;

                    // add item
                    add_item(model, cooling_icon, cooling_name, cooling_price);
                    total_cost += cooling_price;

                }
            }
        }

        // RAM
        if (component_list["RAM"] != NULL)
        {
            for (QVariant RAM_name : component_list["RAM"].toList() )
            {
                for(RAM rRAM : global_RAM_list)
                {
                    if (rRAM.name == RAM_name )
                    {
                        // get RAM icon
                        QString RAM_icon = rRAM.image_link;

                        // get RAM price
                        float RAM_price = rRAM.price ;

                        // add item
                        add_item(model, RAM_icon, RAM_name.toString(), RAM_price);
                        total_cost += RAM_price;

                    }
                }
            }
        }

        // GPU
        if (component_list["GPU"] != NULL)
        {
            for (QVariant GPU_name : component_list["GPU"].toList() )
            {
                for(GPU gGPU : global_GPU_list)
                {
                    if (gGPU.name == GPU_name )
                    {
                        // get GPU icon
                        QString GPU_icon = gGPU.image_link;

                        // get GPU price
                        float GPU_price = gGPU.price ;

                        // add item
                        add_item(model, GPU_icon, GPU_name.toString(), GPU_price);
                        total_cost += GPU_price;

                    }
                }
            }
        }

        // storage
        if (component_list["storage"] != NULL)
        {
            for (QVariant storage_name : component_list["storage"].toList() )
            {
                for(storage sstorage : global_storage_list)
                {
                    if (sstorage.name == storage_name )
                    {
                        // get storage icon
                        QString storage_icon = sstorage.image_link;

                        // get storage price
                        float storage_price = sstorage.price ;

                        // add item
                        add_item(model, storage_icon, storage_name.toString(), storage_price);
                        total_cost += storage_price;

                    }
                }
            }
        }

        // power supply
        if (component_list["power_supply"] != "")
        {
            QString power_supply_name = component_list["power_supply"].toString();
            qInfo() << "power supply name :" << power_supply_name;


            for(power_supply ppower_supply : global_power_supply_list)
            {
                if (ppower_supply.name == power_supply_name )
                {
                    // get power_supply icon
                    QString power_supply_icon = ppower_supply.image_link;

                    // get power_supply price
                    float power_supply_price = ppower_supply.price ;

                    // add item
                    add_item(model, power_supply_icon, power_supply_name, power_supply_price);
                    total_cost += power_supply_price;

                }
            }
        }

        add_item(model, "", "TOTAL PRICE :", total_cost);

        return true;

    }  catch (...) {
        return false;

    }
}

void make_pdf::add_item(QStandardItemModel *model, QString image_link, QString name, float price)
{

    QList<QStandardItem *> items_to_add;

    // image
    QStandardItem *item_image = new QStandardItem();
    QImage image(image_qml().get_image_link(image_link));
    item_image->setData(QVariant(QPixmap::fromImage(image)), Qt::DecorationRole);

    items_to_add.append(item_image);

    // name
    QStandardItem *item_name = new QStandardItem(QString(name));
    items_to_add.append(item_name);

    //price
    QStandardItem *item_price = new QStandardItem(QString(QString::number(price)));
    items_to_add.append(item_price);

    // append row
    model->appendRow(items_to_add);
}


