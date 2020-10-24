#include "headers/create_item.h"

Create_item::Create_item(QObject *parent) : QObject(parent)
{

}

void Create_item::create_case(QString name, QString supported_motherboard_type, double price, QString buy_link, QString image_link)
{

    QJsonObject json;
    json.insert("name", name);
    qInfo() << json["name"];

    json.insert("price", price);
    qInfo() << json["price"];

    json.insert("buy link", buy_link);
    qInfo() << json["buy link"];

    json.insert("image link", image_link);
    qInfo() << json["image link"];

    QStringList tmp_str_list = supported_motherboard_type.split(',', QString::SkipEmptyParts);
    QJsonArray Json_Array;

    for( int i=0; i<tmp_str_list.count(); ++i )
    {
        Json_Array.append(tmp_str_list[i]);
    }

    json.insert("supported motherboard size", Json_Array );
    qInfo() << json["supported motherboard size"];


    QFile save_file("case/" + name + ".json");
    if (save_file.open(QFile::WriteOnly | QIODevice::Text))
    {
        save_file.write(QJsonDocument(json).toJson());
        save_file.close();
    }

}

void Create_item::create_motherboard(QString name, int MB_type, int CPU_socket, int CPU_chipset, int RAM_type, QString RAM_speed_supported, int RAM_slot_number,
                                     int RAM_max_capacity, int RAM_max_per_slot, int GPU_PCIE20_16x_number, int GPU_PCIE20_8x_number, int GPU_PCIE20_4x_number,
                                     int GPU_PCIE20_1x_number, int GPU_PCIE30_16x_number, int GPU_PCIE30_8x_number, int GPU_PCIE30_4x_number,
                                     int GPU_PCIE30_1x_number, int SATA_slot_number, int M_2_slot_number,int power_pin, QString image_link,
                                     double price, QString buy_link)
{

    QJsonObject json;
    json.insert("name", name);
    qInfo() << json["name"];

    json.insert("price", price);
    qInfo() << json["price"];

    json.insert("buy link", buy_link);
    qInfo() << json["buy link"];

    json.insert("image link", image_link);
    qInfo() << json["image link"];

    json.insert("motherboard type", MB_type);
    qInfo() << json["motherboard type"];

    json.insert("CPU chipset", CPU_chipset);
    qInfo() << json["CPU chipset"];

    json.insert("RAM type", RAM_type);
    qInfo() << json["RAM type"];

    json.insert("RAM slot number", RAM_slot_number);
    qInfo() << json["RAM slot number"];

    json.insert("RAM max capacity", RAM_max_capacity);
    qInfo() << json["RAM max capacity"];

    json.insert("RAM max slot", RAM_max_per_slot);
    qInfo() << json["RAM max slot"];

    json.insert("GPU pcie 2.0 16x number", GPU_PCIE20_16x_number);
    qInfo() << json["GPU pcie 2.0 16x number"];

    json.insert("GPU pcie 2.0 8x number", GPU_PCIE20_8x_number);
    qInfo() << json["GPU pcie 2.0 8x number"];

    json.insert("GPU pcie 2.0 4x number", GPU_PCIE20_4x_number);
    qInfo() << json["GPU pcie 2.0 4x number"];

    json.insert("GPU pcie 2.0 1x number", GPU_PCIE20_1x_number);
    qInfo() << json["GPU pcie 2.0 1x number"];

    json.insert("GPU pcie 3.0 16x number", GPU_PCIE30_16x_number);
    qInfo() << json["GPU pcie 3.0 16x number"];

    json.insert("GPU pcie 3.0 8x number", GPU_PCIE30_8x_number);
    qInfo() << json["GPU pcie 3.0 8x number"];

    json.insert("GPU pcie 3.0 4x number", GPU_PCIE30_4x_number);
    qInfo() << json["GPU pcie 3.0 4x number"];

    json.insert("GPU pcie 3.0 1x number", GPU_PCIE30_1x_number);
    qInfo() << json["GPU pcie 3.0 1x number"];

    json.insert("SATA slot number", SATA_slot_number);
    qInfo() << json["SATA slot number"];

    json.insert("M2 slot number", M_2_slot_number);
    qInfo() << json["M2 slot number"];

    json.insert("CPU socket", CPU_socket);
    qInfo() << json["CPU socket"];

    json.insert("POWER pin", power_pin);
    qInfo() << json["POWER pin"];

    QStringList tmp_str_list = RAM_speed_supported.split(',', QString::SkipEmptyParts);
    QJsonArray Json_Array;

    for( int i=0; i<tmp_str_list.count(); ++i )
    {
        Json_Array.append(tmp_str_list[i]);
    }

    json.insert("RAM speed supported", Json_Array );
    qInfo() << json["RAM speed supported"];


    QFile save_file("motherboard/" + name + ".json");
    if (save_file.open(QFile::WriteOnly | QIODevice::Text))
    {
        save_file.write(QJsonDocument(json).toJson());
        save_file.close();
    }

}

void Create_item::create_CPU(QString name, int socket, QString supported_chipset, int clock_speed, int boosted_speed, int cache_L3_Mo, int core_number,
                             int thread_number, int TDP, int supported_RAM_type, int max_RAM_speed_MHZ, QString image_link, double price, QString buy_link)
{
    QJsonObject json;
    json.insert("name", name);
    qInfo() << json["name"];

    json.insert("CPU socket", socket);
    qInfo() << json["CPU socket"];

    json.insert("clock speed", clock_speed);
    qInfo() << json["clock speed"];

    json.insert("boosted clock speed", boosted_speed);
    qInfo() << json["boosted clock speed"];

    json.insert("cache L3", cache_L3_Mo);
    qInfo() << json["cache L3"];

    json.insert("core number", core_number);
    qInfo() << json["core number"];

    json.insert("thread number", thread_number);
    qInfo() << json["thread number"];

    json.insert("TDP", TDP);
    qInfo() << json["TDP"];

    json.insert("supported RAM type", supported_RAM_type);
    qInfo() << json["supported RAM type"];

    json.insert("max RAM speed", max_RAM_speed_MHZ);
    qInfo() << json["max RAM speed"];

    json.insert("image link", image_link);
    qInfo() << json["image link"];

    json.insert("price", price);
    qInfo() << json["price"];

    json.insert("buy link", buy_link);
    qInfo() << json["buy link"];



    QStringList tmp_str_list = supported_chipset.split(',', QString::SkipEmptyParts);
    QJsonArray Json_Array;

    for( int i=0; i<tmp_str_list.count(); ++i )
    {
        Json_Array.append(tmp_str_list[i]);
    }

    json.insert("CPU chipset", Json_Array );
    qInfo() << json["CPU chipset"];



    QFile save_file("cpu/" + name + ".json");
    if (save_file.open(QFile::WriteOnly | QIODevice::Text))
    {
        save_file.write(QJsonDocument(json).toJson());
        save_file.close();
    }
}

void Create_item::create_cooling(QString name, QString supported_socket, int cooling_size, double cooling_min_sound_dB, double cooling_max_sound_dB,
                                 int cooling_min_speed, int cooling_max_speed, double air_flow_CFM, QString image_link, double price, QString buy_link)
{
    QJsonObject json;
    json.insert("name", name);
    qInfo() << json["name"];

    json.insert("cooling size", cooling_size);
    qInfo() << json["cooling size"];

    json.insert("cooling min sound", cooling_min_sound_dB);
    qInfo() << json["cooling min sound"];

    json.insert("cooling max sound", cooling_max_sound_dB);
    qInfo() << json["cooling max sound"];

    json.insert("cooling min speed", cooling_min_speed);
    qInfo() << json["cooling min speed"];

    json.insert("cooling max speed", cooling_max_speed);
    qInfo() << json["cooling max speed"];

    json.insert("air flow", air_flow_CFM);
    qInfo() << json["air flow"];

    json.insert("image link", image_link);
    qInfo() << json["image link"];

    json.insert("price", price);
    qInfo() << json["price"];

    json.insert("buy link", buy_link);
    qInfo() << json["buy link"];


    QStringList tmp_str_list = supported_socket.split(',', QString::SkipEmptyParts);
    QJsonArray Json_Array;

    for( int i=0; i<tmp_str_list.count(); ++i )
    {
        Json_Array.append(tmp_str_list[i]);
    }

    json.insert("CPU socket", Json_Array );
    qInfo() << json["CPU socket"];



    QFile save_file("cooling/" + name + ".json");
    if (save_file.open(QFile::WriteOnly | QIODevice::Text))
    {
        save_file.write(QJsonDocument(json).toJson());
        save_file.close();
    }
}

void Create_item::create_RAM(QString name, int TYPE, int memory_size, int memory_speed, QString image_link, int cas_latency, int module_number, double price, QString buy_link)
{
    QJsonObject json;
    json.insert("name", name);
    qInfo() << json["name"];

    json.insert("RAM type", TYPE);
    qInfo() << json["RAM type"];

    json.insert("memory size", memory_size);
    qInfo() << json["memory size"];

    json.insert("memory speed", memory_speed);
    qInfo() << json["memory speed"];

    json.insert("CAS latency", cas_latency);
    qInfo() << json["CAS latency"];

    json.insert("module number", module_number);
    qInfo() << json["module number"];

    json.insert("image link", image_link);
    qInfo() << json["image link"];

    json.insert("price", price);
    qInfo() << json["price"];

    json.insert("buy link", buy_link);
    qInfo() << json["buy link"];


    QFile save_file("ram/" + name + ".json");
    if (save_file.open(QFile::WriteOnly | QIODevice::Text))
    {
        save_file.write(QJsonDocument(json).toJson());
        save_file.close();
    }
}

void Create_item::create_GPU(QString name, int clock, int boost_clock, int GPU_core_number, int GPU_bus, int GPU_ram_type, int GPU_ram_size, int GPU_ram_frequency_MHZ,
                             int GPU_flux, int power_consumption, int power_clable_pin, QString image_link, double price, QString buy_link)
{
    QJsonObject json;
    json.insert("name", name);
    qInfo() << json["name"];

    json.insert("clock speed", clock);
    qInfo() << json["clock speed"];

    json.insert("boosted clock speed", boost_clock);
    qInfo() << json["boosted clock speed"];

    json.insert("GPU core number", GPU_core_number);
    qInfo() << json["GPU core number"];

    json.insert("GPU bus", GPU_bus);
    qInfo() << json["GPU bus"];

    json.insert("GPU RAM type", GPU_ram_type);
    qInfo() << json["GPU RAM type"];

    json.insert("GPU RAM size", GPU_ram_size);
    qInfo() << json["GPU RAM size"];

    json.insert("GPU RAM frequency", GPU_ram_frequency_MHZ);
    qInfo() << json["GPU RAM frequency"];

    json.insert("GPU flux", GPU_flux);
    qInfo() << json["GPU flux"];

    json.insert("power consumption", power_consumption);
    qInfo() << json["power consumption"];

    json.insert("power cable pin", power_clable_pin);
    qInfo() << json["power cable pin"];

    json.insert("image link", image_link);
    qInfo() << json["image link"];

    json.insert("price", price);
    qInfo() << json["price"];

    json.insert("buy link", buy_link);
    qInfo() << json["buy link"];


    QFile save_file("gpu/" + name + ".json");
    if (save_file.open(QFile::WriteOnly | QIODevice::Text))
    {
        save_file.write(QJsonDocument(json).toJson());
        save_file.close();
    }
}

void Create_item::create_storage(QString name, int read_speed, int write_speed, int type, int capacity_GO, int RPM, QString image_link, double price, QString buy_link)
{
    QJsonObject json;
    json.insert("name", name);
    qInfo() << json["name"];

    json.insert("DD type", type);
    qInfo() << json["DD type"];

    json.insert("Read Speed", read_speed);
    qInfo() << json["Read Speed"];

    json.insert("Write Speed", write_speed);
    qInfo() << json["Write Speed"];

    json.insert("capacity", capacity_GO);
    qInfo() << json["capacity"];

    json.insert("RPM", RPM);
    qInfo() << json["RPM"];

    json.insert("image link", image_link);
    qInfo() << json["image link"];

    json.insert("price", price);
    qInfo() << json["price"];

    json.insert("buy link", buy_link);
    qInfo() << json["buy link"];


    QFile save_file("storage/" + name + ".json");
    if (save_file.open(QFile::WriteOnly | QIODevice::Text))
    {
        save_file.write(QJsonDocument(json).toJson());
        save_file.close();
    }

}

void Create_item::create_power_supply(QString name, int standard, int power_W, int sata_power_cable, int pcie6_2_power_cable, int ATX_24_power_cable,
                                      int ATX_4_power_cable, int molex4_power_cable, QString image_link, double price, QString buy_link)
{
    QJsonObject json;
    json.insert("name", name);
    qInfo() << json["name"];

    json.insert("Power supply standard", standard);
    qInfo() << json["Power supply standard"];

    json.insert("Power (W)", power_W);
    qInfo() << json["Power (W)"];

    json.insert("Sata power cable", sata_power_cable);
    qInfo() << json["Sata power cable"];

    json.insert("PCIE 6_2 power cable", pcie6_2_power_cable);
    qInfo() << json["PCIE 6_2 power cable"];

    json.insert("ATX 24 power cable", ATX_24_power_cable);
    qInfo() << json["ATX 24 power cable"];

    json.insert("ATX 4 pin", ATX_4_power_cable);
    qInfo() << json["ATX 4 pin"];

    json.insert("Molex 4 power cable", molex4_power_cable);
    qInfo() << json["Molex 4 power cable"];

    json.insert("image link", image_link);
    qInfo() << json["image link"];

    json.insert("price", price);
    qInfo() << json["price"];

    json.insert("buy link", buy_link);
    qInfo() << json["buy link"];

    QFile save_file("powersupply/" + name + ".json");
    if (save_file.open(QFile::WriteOnly | QIODevice::Text))
    {
        save_file.write(QJsonDocument(json).toJson());
        save_file.close();
    }
}
