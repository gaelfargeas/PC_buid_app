#include "headers/main_class.h"

main_class::main_class(QObject *parent) : QObject(parent)
{

    init_list();

    pdf_maker_class.init_globase_list(global_case_list, global_cooling_list, global_CPU_list,
                                      global_GPU_list, global_motherboard_list, global_RAM_list,
                                      global_storage_list, global_power_supply_list);

}

void main_class::init_list()
{
    QDir directory(".");
    if (directory.exists("./case"))
    {
        QDir directory_case("./case");
        QStringList json_case_files = directory_case.entryList(QStringList() << "*.json",QDir::Files);

        //get all file int the forlder
        foreach(QString filename, json_case_files)
        {
            //open file
            QFile json_file("./case/" + filename);
            if (json_file.open(QFile::ReadOnly | QFile::Text))
            {
                // read all data
                QString data = json_file.readAll();
                //get json document
                QJsonDocument documentJSON = QJsonDocument::fromJson(data.toUtf8());
                //extract json object
                QJsonObject objetJSON = documentJSON.object();
                //extact value
                computer_case new_case;

                new_case.name = objetJSON["name"].toString();
                new_case.price = objetJSON["price"].toDouble();
                new_case.buy_link = objetJSON["buy link"].toString();
                new_case.image_link = objetJSON["image link"].toString();

                QJsonArray array = objetJSON["supported motherboard size"].toArray();

                for( int i=0; i<array.count(); i++ )
                {

                    new_case.supported_motherboard_size.append((MOTHERBOARD_TYPE) array[i].toVariant().toInt());
                }
                global_case_list.append(new_case);

                //close
                json_file.close();
            }

        }
    }
    else
    {
        //create directory
        directory.mkdir("./case");
    }


    if (directory.exists("./motherboard"))
    {
        QDir directory_motherboard("./motherboard");

        QStringList json_case_files = directory_motherboard.entryList(QStringList() << "*.json",QDir::Files);

        //get all file int the forlder
        foreach(QString filename, json_case_files)
        {
            //open file
            QFile json_file("./motherboard/" + filename);
            if (json_file.open(QFile::ReadOnly | QFile::Text))
            {
                // read all data
                QString data = json_file.readAll();
                //get json document
                QJsonDocument documentJSON = QJsonDocument::fromJson(data.toUtf8());
                //extract json object
                QJsonObject objetJSON = documentJSON.object();

                //extact value
                motherboard new_motherboard;

                new_motherboard.name = objetJSON["name"].toString();
                new_motherboard.price = objetJSON["price"].toDouble();
                new_motherboard.buy_link = objetJSON["buy link"].toString();
                new_motherboard.image_link = objetJSON["image link"].toString();

                new_motherboard.MB_type = (MOTHERBOARD_TYPE) objetJSON["motherboard type"].toInt();
                new_motherboard.power_pin = (MOTHERBOARD_POWER_PIN) objetJSON["POWER pin"].toInt();
                new_motherboard.CPU_chipset = (CPU_SHIPSET) objetJSON["CPU chipset"].toInt();
                new_motherboard.RAM_type = (RAM_TYPE) objetJSON["RAM type"].toInt();
                new_motherboard.RAM_slot_number = objetJSON["RAM slot number"].toInt();
                new_motherboard.RAM_max_capacity = objetJSON["RAM max capacity"].toInt();
                new_motherboard.RAM_max_per_slot = objetJSON["RAM max slot"].toInt();
                new_motherboard.GPU_PCIE_16x_number = objetJSON["GPU pcie 16x number"].toInt();
                new_motherboard.GPU_PCIE_8x_number = objetJSON["GPU pcie 8x number"].toInt();
                new_motherboard.GPU_PCIE_4x_number = objetJSON["GPU pcie 4x number"].toInt();
                new_motherboard.GPU_PCIE_1x_number = objetJSON["GPU pcie 1x number"].toInt();
                new_motherboard.SATA_slot_number = objetJSON["SATA slot number"].toInt();
                new_motherboard.M_2_slot_number = objetJSON["M2 slot number"].toInt();
                new_motherboard.CPU_socket = (CPU_SOCKET) objetJSON["CPU socket"].toInt();

                QJsonArray array = objetJSON["RAM speed supported"].toArray();
                for( int i=0; i<array.count(); ++i )
                {

                    new_motherboard.RAM_speed_supported.append(array[i].toString().toInt());
                }

                global_motherboard_list.append(new_motherboard);

                //close
                json_file.close();


            }

        }
    }
    else
    {
        directory.mkdir("./motherboard");
    }


    if (directory.exists("./cpu"))
    {
        QDir directory_cpu("./cpu");

        QStringList json_case_files = directory_cpu.entryList(QStringList() << "*.json",QDir::Files);

        //get all file int the forlder
        foreach(QString filename, json_case_files)
        {
            //open file
            QFile json_file("./cpu/" + filename);
            if (json_file.open(QFile::ReadOnly | QFile::Text))
            {
                // read all data
                QString data = json_file.readAll();
                //get json document
                QJsonDocument documentJSON = QJsonDocument::fromJson(data.toUtf8());
                //extract json object
                QJsonObject objetJSON = documentJSON.object();
                //extact value
                CPU new_cpu;

                new_cpu.name = objetJSON["name"].toString();
                new_cpu.price = objetJSON["price"].toDouble();
                new_cpu.buy_link = objetJSON["buy link"].toString();
                new_cpu.image_link = objetJSON["image link"].toString();

                new_cpu.socket = (CPU_SOCKET) objetJSON["CPU socket"].toInt() ;
                new_cpu.clock_speed = objetJSON["clock speed"].toInt();
                new_cpu.boosted_speed = objetJSON["boosted clock speed"].toInt();
                new_cpu.cache_L3_Mo = objetJSON["cache L3"].toInt();
                new_cpu.core_number = objetJSON["core number"].toInt();
                new_cpu.thread_number = objetJSON["thread number"].toInt();
                new_cpu.TDP = objetJSON["TDP"].toInt();
                new_cpu.supported_RAM_type = (RAM_TYPE) objetJSON["supported RAM type"].toInt() ;
                new_cpu.max_RAM_speed_MHZ = (RAM_speed) objetJSON["max RAM speed"].toInt();

                QJsonArray array = objetJSON["CPU chipset"].toArray();
                for( int i=0; i<array.count(); ++i )
                {
                    new_cpu.supported_chipset.append((CPU_SHIPSET) array[i].toString().toInt());
                }
                global_CPU_list.append(new_cpu);

                //close
                json_file.close();

            }

        }
    }
    else
    {
        directory.mkdir("./cpu");
    }


    if (directory.exists("./cooling"))
    {
        QDir directory_cooling("./cooling");

        QStringList json_case_files = directory_cooling.entryList(QStringList() << "*.json",QDir::Files);

        //get all file int the forlder
        foreach(QString filename, json_case_files)
        {
            //open file
            QFile json_file("./cooling/" + filename);
            if (json_file.open(QFile::ReadOnly | QFile::Text))
            {
                // read all data
                QString data = json_file.readAll();
                //get json document
                QJsonDocument documentJSON = QJsonDocument::fromJson(data.toUtf8());
                //extract json object
                QJsonObject objetJSON = documentJSON.object();
                //extact value
                cooling new_cooling;

                new_cooling.name = objetJSON["name"].toString();
                new_cooling.price = objetJSON["price"].toDouble();
                new_cooling.buy_link = objetJSON["buy link"].toString();
                new_cooling.image_link = objetJSON["image link"].toString();

                new_cooling.cooling_size = (COOLING_SIZE) objetJSON["cooling size"].toInt();
                new_cooling.cooling_min_sound_dB = objetJSON["cooling min sound"].toDouble();
                new_cooling.cooling_max_sound_dB = objetJSON["cooling max sound"].toDouble();
                new_cooling.cooling_min_speed = objetJSON["cooling min speed"].toInt();
                new_cooling.cooling_max_speed = objetJSON["cooling max speed"].toInt();
                new_cooling.air_flow_CFM = objetJSON["air flow"].toDouble();

                QJsonArray array = objetJSON["CPU socket"].toArray();
                for( int i=0; i<array.count(); ++i )
                {

                    new_cooling.supported_socket.append((CPU_SOCKET) array[i].toString().toInt());
                }
                global_cooling_list.append(new_cooling);

                //close
                json_file.close();
            }

        }
    }
    else
    {
        directory.mkdir("./cooling");
    }


    if (directory.exists("./gpu"))
    {
        QDir directory_gpu("./gpu");

        QStringList json_case_files = directory_gpu.entryList(QStringList() << "*.json",QDir::Files);

        //get all file int the forlder
        foreach(QString filename, json_case_files)
        {
            //open file
            QFile json_file("./gpu/" + filename);
            if (json_file.open(QFile::ReadOnly | QFile::Text))
            {
                // read all data
                QString data = json_file.readAll();
                //get json document
                QJsonDocument documentJSON = QJsonDocument::fromJson(data.toUtf8());
                //extract json object
                QJsonObject objetJSON = documentJSON.object();
                //extact value
                GPU new_gpu;

                new_gpu.name = objetJSON["name"].toString();
                new_gpu.price = objetJSON["price"].toDouble();
                new_gpu.buy_link = objetJSON["buy link"].toString();
                new_gpu.image_link = objetJSON["image link"].toString();

                new_gpu.clock = objetJSON["clock speed"].toInt();
                new_gpu.boost_clock  = objetJSON["boosted clock speed"].toInt();
                new_gpu.GPU_core_number  = objetJSON["GPU core number"].toInt();
                new_gpu.GPU_bus = (GPU_BUS) objetJSON["GPU bus"].toInt();
                new_gpu.GPU_ram_type = (RAM_TYPE) objetJSON["GPU RAM type"].toInt();
                new_gpu.GPU_ram_size = objetJSON["GPU RAM size"].toInt();
                new_gpu.GPU_ram_frequency_MHZ = objetJSON["GPU RAM frequency"].toInt();
                new_gpu.GPU_flux = objetJSON["GPU flux"].toInt();
                new_gpu.power_consumption = objetJSON["power consumption"].toInt();
                new_gpu.power_clable_pin = (GPU_POWER_CABLE_PIN) objetJSON["power cable pin"].toInt();

                global_GPU_list.append(new_gpu);

                //close
                json_file.close();
            }

        }
    }
    else
    {
        directory.mkdir("./gpu");
    }


    if (directory.exists("./ram"))
    {
        QDir directory_ram("./ram");

        QStringList json_case_files = directory_ram.entryList(QStringList() << "*.json",QDir::Files);

        //get all file int the forlder
        foreach(QString filename, json_case_files)
        {
            //open file
            QFile json_file("./ram/" + filename);
            if (json_file.open(QFile::ReadOnly | QFile::Text))
            {
                // read all data
                QString data = json_file.readAll();
                //get json document
                QJsonDocument documentJSON = QJsonDocument::fromJson(data.toUtf8());
                //extract json object
                QJsonObject objetJSON = documentJSON.object();
                //extact value
                RAM new_ram;

                new_ram.name = objetJSON["name"].toString();
                new_ram.price = objetJSON["price"].toDouble();
                new_ram.buy_link = objetJSON["buy link"].toString();
                new_ram.image_link = objetJSON["image link"].toString();

                new_ram.CAS_latency = (RAM_cas_latency) objetJSON["CAS latency"].toInt();
                new_ram.module_number = objetJSON["module number"].toInt();
                new_ram.TYPE = (RAM_TYPE) objetJSON["RAM type"].toInt();
                new_ram.memory_size = objetJSON["memory size"].toInt();
                new_ram.memory_speed = (RAM_speed) objetJSON["memory speed"].toInt();

                global_RAM_list.append(new_ram);

                //close
                json_file.close();
            }
        }
    }
    else
    {
        directory.mkdir("./ram");
    }


    if (directory.exists("./storage"))
    {
        QDir directory_storage("./storage");

        QStringList json_case_files = directory_storage.entryList(QStringList() << "*.json",QDir::Files);

        //get all file int the forlder
        foreach(QString filename, json_case_files)
        {
            //open file
            QFile json_file("./storage/" + filename);
            if (json_file.open(QFile::ReadOnly | QFile::Text))
            {
                // read all data
                QString data = json_file.readAll();
                //get json document
                QJsonDocument documentJSON = QJsonDocument::fromJson(data.toUtf8());
                //extract json object
                QJsonObject objetJSON = documentJSON.object();
                //extact value
                storage new_storage;

                new_storage.name = objetJSON["name"].toString();
                new_storage.price = objetJSON["price"].toDouble();
                new_storage.buy_link = objetJSON["buy link"].toString();
                new_storage.image_link = objetJSON["image link"].toString();

                new_storage.read_speed = objetJSON["Read Speed"].toInt();
                new_storage.write_speed = objetJSON["Write Speed"].toInt();
                new_storage.type = (DD_type) objetJSON["DD type"].toInt();
                new_storage.capacity = (DD_capacity) objetJSON["capacity"].toInt();
                new_storage.RPM = objetJSON["RPM"].toInt();

                global_storage_list.append(new_storage);

            }
            //close
            json_file.close();
        }
    }
    else
    {
        directory.mkdir("./storage");
    }


    if (directory.exists("./powersupply"))
    {
        QDir directory_case("./powersupply");

        QStringList json_case_files = directory_case.entryList(QStringList() << "*.json",QDir::Files);

        //get all file int the forlder
        foreach(QString filename, json_case_files)
        {
            //open file
            QFile json_file("./powersupply/" + filename);
            if (json_file.open(QFile::ReadOnly | QFile::Text))
            {
                // read all data
                QString data = json_file.readAll();
                //get json document
                QJsonDocument documentJSON = QJsonDocument::fromJson(data.toUtf8());
                //extract json object
                QJsonObject objetJSON = documentJSON.object();


                //extact value
                power_supply new_powersupply;

                new_powersupply.name = objetJSON["name"].toString();
                new_powersupply.price = objetJSON["price"].toDouble();
                new_powersupply.buy_link = objetJSON["buy link"].toString();
                new_powersupply.image_link = objetJSON["image link"].toString();

                new_powersupply.standard = (POWER_SUPPLY_STANDARD) objetJSON["Power supply standard"].toInt();
                new_powersupply.power_W = (POWER_SUPPLY_W)objetJSON["Power (W)"].toInt();
                new_powersupply.sata_power_cable = objetJSON["Sata power cable"].toInt();
                new_powersupply.pcie6_2_power_cable = objetJSON["PCIE 6_2 power cable"].toInt();
                new_powersupply.ATX_24_power_cable = objetJSON["ATX 24 power cable"].toInt();
                new_powersupply.molex4_power_cable = objetJSON["Molex 4 power cable"].toInt();
                new_powersupply.ATX_4_power_cable = objetJSON["ATX 4 pin"].toInt();

                global_power_supply_list.append(new_powersupply);

            }
            //close
            json_file.close();
        }
    }
    else
    {
        directory.mkdir("./powersupply");
    }

}

void main_class::refresh_list()
{
    global_case_list.clear();
    global_cooling_list.clear();
    global_CPU_list.clear();
    global_GPU_list.clear();
    global_motherboard_list.clear();
    global_RAM_list.clear();
    global_storage_list.clear();
    global_power_supply_list.clear();

    init_list();
    pdf_maker_class.init_globase_list(global_case_list, global_cooling_list, global_CPU_list,
                                      global_GPU_list, global_motherboard_list, global_RAM_list,
                                      global_storage_list, global_power_supply_list);
}



int main_class::socket_str_to_int(QString socket)
{

    if(socket == "AMD_AM2")
    {
        return  0;
    }else if(socket == "AMD_AM2_plus")
    {
        return  1;
    }else if(socket == "AMD_AM3")
    {
        return  2;
    }else if(socket == "AMD_AM3_plus")
    {
        return  3;
    }else if(socket == "AMD_AM4")
    {
        return  4;
    }else if(socket == "AMD_SP3")
    {
        return  5;
    }else if(socket == "AMD_sTR4")
    {
        return  6;
    }else if(socket == "AMD_sTRx4")
    {
        return  7;
    }else if(socket == "LGA_1150")
    {
        return  8;
    }else if(socket == "LGA_1151")
    {
        return  9;
    }else if(socket == "LGA_1155")
    {
        return  10;
    }else if(socket == "LGA_1156")
    {
        return  11;
    }else if(socket == "LGA_1366")
    {
        return  12;
    }else if(socket == "LGA_2011")
    {
        return  13;
    }else if(socket == "LGA_2011_v3")
    {
        return  14;
    }else if(socket == "LGA_2066")
    {
        return  15;
    }else
    {
        return 16;
    }

}

int main_class::chipset_str_to_int(QString chipset)
{

    if(chipset == "AMD_A68H")
    {
        return  0;
    }
    else if(chipset == "AMD_760G")
    {
        return  1;
    }
    else if(chipset == "AMD_A520")
    {
        return  2;
    }
    else if(chipset == "AMD_B350")
    {
        return  3;
    }
    else if(chipset == "AMD_B450")
    {
        return  4;
    }
    else if(chipset == "AMD_B550")
    {
        return  5;
    }
    else if(chipset == "AMD_X370")
    {
        return  6;
    }
    else if(chipset == "AMD_X399")
    {
        return  7;
    }
    else if(chipset == "AMD_X470")
    {
        return  8;
    }
    else if(chipset == "AMD_X570")
    {
        return  9;
    }
    else if(chipset == "AMD_TRX40")
    {
        return  10;
    }
    else if(chipset == "Intel_H110")
    {
        return  11;
    }
    else if(chipset == "Intel_H270")
    {
        return  12;
    }
    else if(chipset == "Intel_H310")
    {
        return  13;
    }
    else if(chipset == "Intel_H370")
    {
        return  14;
    }
    else if(chipset == "Intel_B150")
    {
        return  15;
    }
    else if(chipset == "Intel_B250")
    {
        return  16;
    }
    else if(chipset == "Intel_B360")
    {
        return  17;
    }
    else if(chipset == "Intel_B365")
    {
        return  18;
    }
    else if(chipset == "Intel_Z170")
    {
        return  19;
    }
    else if(chipset == "Intel_Z270")
    {
        return  20;
    }
    else if(chipset == "Intel_Z370")
    {
        return  21;
    }
    else if(chipset == "Intel_Z390")
    {
        return  22;
    }
    else if(chipset == "Intel_X99")
    {
        return  23;
    }
    else if(chipset == "Intel_X299")
    {
        return  24;
    }
    else
    {
        return 0;
    }


}

int main_class::ram_type_str_to_int(QString ram_type)
{

    if(ram_type == "DDR3")
    {
        return  0;
    }else if(ram_type == "DDR4")
    {
        return  1;
    }else if(ram_type == "GDDR5")
    {
        return  2;
    }else if(ram_type == "GDDR5X")
    {
        return  3;
    }else if(ram_type == "GDDR6")
    {
        return  4;
    }else
    {
        return 5;
    }

}

int main_class::ram_speed_str_to_int(QString ram_speed)
{

    if(ram_speed == "1066Mhz")
    {
        return  0;
    }else if(ram_speed == "1333Mhz")
    {
        return  1;
    }else if(ram_speed == "1600Mhz")
    {
        return  2;
    }else if(ram_speed == "1866Mhz")
    {
        return  3;
    }else if(ram_speed == "2133Mhz")
    {
        return  4;
    }else if(ram_speed == "2400Mhz")
    {
        return  5;
    }else if(ram_speed == "2666Mhz")
    {
        return  6;
    }else if(ram_speed == "2800Mhz")
    {
        return  7;
    }else if(ram_speed == "2933Mhz")
    {
        return  8;
    }else if(ram_speed == "3000Mhz")
    {
        return  9;
    }else if(ram_speed == "3200Mhz")
    {
        return  10;
    }else if(ram_speed == "3300Mhz")
    {
        return  11;
    }else if(ram_speed == "3333Mhz")
    {
        return  12;
    }else if(ram_speed == "3400Mhz")
    {
        return  13;
    }else if(ram_speed == "3466Mhz")
    {
        return  14;
    }else if(ram_speed == "3600Mhz")
    {
        return  15;
    }else if(ram_speed == "3666Mhz")
    {
        return  16;
    }else if(ram_speed == "3733Mhz")
    {
        return  17;
    }else if(ram_speed == "3800Mhz")
    {
        return  18;
    }else if(ram_speed == "3866Mhz")
    {
        return  19;
    }else if(ram_speed == "4000Mhz")
    {
        return  20;
    }else if(ram_speed == "4133Mhz")
    {
        return  21;
    }else if(ram_speed == "4200Mhz")
    {
        return  22;
    }else if(ram_speed == "4266Mhz")
    {
        return  23;
    }else if(ram_speed == "4300Mhz")
    {
        return  24;
    }else if(ram_speed == "4333Mhz")
    {
        return  25;
    }else if(ram_speed == "4400Mhz")
    {
        return  26;
    }else if(ram_speed == "4500Mhz")
    {
        return  27;
    }else if(ram_speed == "4600Mhz")
    {
        return  28;
    }else if(ram_speed == "4700Mhz")
    {
        return  29;
    }else if(ram_speed == "4800Mhz")
    {
        return  30;
    }else
    {
        return 31;
    }

}

int main_class::enum_power_supply_w_to_int(POWER_SUPPLY_W W)
{
    if(W > W300 && W < W1000)
    {
        return 300 +(50 * W);
    }
    else if(W >= W1000 && W <= W1600)
    {
        return 1000 + (100 *(W - 14));
    }
    else
    {
        return 300;
    }


}



QList<computer_case> main_class::apply_computer_case_list_filters(QList<computer_case> list, QString name_filter, int mb_size_filter)
{
    QList<computer_case> computer_case_list_filtred = list;

    if (name_filter != "" )
    {
        computer_case_list_filtred = computer_case_list_name_filter(computer_case_list_filtred, name_filter);
    }
    if (mb_size_filter != 0)
    {
        computer_case_list_filtred = computer_case_motherboard_type_filter(computer_case_list_filtred, mb_size_filter - 1);
    }

    return computer_case_list_filtred;
}

QList<computer_case> main_class::computer_case_list_name_filter(QList<computer_case> list, QString name_filter)
{
    QList<computer_case> ret;

    for(computer_case CC : list)
    {
        if(CC.name.toLower().contains(name_filter.toLower()))
        {
            ret.append(CC);
        }
    }
    return ret;
}

QList<computer_case> main_class::computer_case_motherboard_type_filter(QList<computer_case> list, int mb_size_filter)
{
    QList<computer_case> ret;

    for(computer_case CC : list)
    {
        if(CC.supported_motherboard_size.contains((MOTHERBOARD_TYPE) mb_size_filter))
        {
            ret.append(CC);
        }
    }
    return ret;
}



QList<motherboard> main_class::apply_motherboard_list_filters(QList<motherboard> list, QList<int> type, QString name_filter, int chipset, int socket, int ram)
{
    QList<motherboard> motherboard_list_filtred = list;

    if (type.length() != 0)
    {
        motherboard_list_filtred = motherboard_list_type_filter(motherboard_list_filtred, type);
    }
    if (name_filter != "" )
    {
        motherboard_list_filtred = motherboard_list_name_filter(motherboard_list_filtred, name_filter);
    }
    if (chipset != 0 ) //0 = "" on cbb == value shifted ( chipset type 0 == cbb 1; chipset type 1 = cbb 2)
    {
        motherboard_list_filtred = motherboard_list_chipset_filter(motherboard_list_filtred, chipset-1);
    }
    if (socket != 0 ) //0 = "" on cbb == value shifted ( socket type 0 == cbb 1; socket type 1 = cbb 2)
    {
        motherboard_list_filtred = motherboard_list_socket_filter(motherboard_list_filtred, socket-1);
    }
    if (ram != 0 ) //0 = "" on cbb == value shifted ( ram type 0 == cbb 1; ram type 1 = cbb 2)
    {
        motherboard_list_filtred = motherboard_list_ram_filter(motherboard_list_filtred, ram-1);
    }
    return motherboard_list_filtred;

}

QList<motherboard> main_class::motherboard_list_type_filter(QList<motherboard> list, QList<int> type)
{
    QList<motherboard> ret;

    for(motherboard MB : list)
    {
        if(type.contains(MB.MB_type))
        {
            ret.append(MB);
        }
    }
    return ret;
}

QList<motherboard> main_class::motherboard_list_name_filter(QList<motherboard> list, QString name_filter)
{
    QList<motherboard> ret;

    for(motherboard MB : list)
    {
        if(MB.name.toLower().contains(name_filter.toLower()))
        {
            ret.append(MB);
        }
    }
    return ret;
}

QList<motherboard> main_class::motherboard_list_chipset_filter(QList<motherboard> list, int chipset)
{
    QList<motherboard> ret;

    for(motherboard MB : list)
    {
        if(MB.CPU_chipset == chipset)
        {
            ret.append(MB);
        }
    }
    return ret;
}

QList<motherboard> main_class::motherboard_list_socket_filter(QList<motherboard> list, int socket)
{
    QList<motherboard> ret;

    for(motherboard MB : list)
    {
        if(MB.CPU_socket == socket)
        {
            ret.append(MB);
        }
    }
    return ret;
}

QList<motherboard> main_class::motherboard_list_ram_filter(QList<motherboard> list, int ram)
{
    QList<motherboard> ret;

    for(motherboard MB : list)
    {
        if(MB.RAM_type == ram)
        {
            ret.append(MB);
        }
    }
    return ret;
}



QList<CPU> main_class::apply_cpu_list_filters(QList<CPU> list, QString name_filter, QString socket, QString chipset, QString ram_type)
{
    QList<CPU> cpu_list_filtred = list;

    if (name_filter != "" )
    {
        cpu_list_filtred = cpu_list_name_filter(cpu_list_filtred, name_filter);
    }
    if(socket != "" )
    {

        cpu_list_filtred = cpu_list_socket_filter(cpu_list_filtred,socket_str_to_int(socket) );
    }
    if(chipset != "" )
    {

        cpu_list_filtred = cpu_list_chipset_filter(cpu_list_filtred, chipset_str_to_int(chipset) );
    }
    if(ram_type != "" )
    {

        cpu_list_filtred = cpu_list_ram_filter(cpu_list_filtred, ram_type_str_to_int(ram_type) );
    }

    return cpu_list_filtred;
}

QList<CPU> main_class::cpu_list_name_filter(QList<CPU> list, QString name_filter)
{
    QList<CPU> ret;

    for(CPU cpu : list)
    {
        if(cpu.name.toLower().contains(name_filter.toLower()))
        {
            ret.append(cpu);
        }
    }
    return ret;
}

QList<CPU> main_class::cpu_list_chipset_filter(QList<CPU> list, int chipset)
{
    QList<CPU> ret;

    for(CPU cpu : list)
    {
        if(cpu.supported_chipset.contains((CPU_SHIPSET) chipset))
        {
            ret.append(cpu);
        }
    }
    return ret;
}

QList<CPU> main_class::cpu_list_socket_filter(QList<CPU> list, int socket)
{
    QList<CPU> ret;

    for(CPU cpu : list)
    {
        if(cpu.socket == (CPU_SOCKET) socket)
        {
            ret.append(cpu);
        }
    }
    return ret;
}

QList<CPU> main_class::cpu_list_ram_filter(QList<CPU> list, int ram_type)
{
    QList<CPU> ret;

    for(CPU cpu : list)
    {
        if(cpu.supported_RAM_type == (RAM_TYPE) ram_type)
        {
            ret.append(cpu);
        }
    }
    return ret;
}



QList<cooling> main_class::apply_cooling_list_filters(QList<cooling> list, QString name_filter, int fan_size)
{
    QList<cooling> cooling_list_filtred = list;

    if (name_filter != "" )
    {
        cooling_list_filtred = cooling_list_name_filter(cooling_list_filtred, name_filter);
    }
    if(fan_size != 0)
    {
        cooling_list_filtred = cooling_list_fan_size_filter(cooling_list_filtred, (COOLING_SIZE) (fan_size - 1));
    }

    return cooling_list_filtred;
}

QList<cooling> main_class::cooling_list_name_filter(QList<cooling> list, QString name_filter)
{
    QList<cooling> ret;

    for(cooling Cool : list)
    {
        if(Cool.name.toLower().contains(name_filter.toLower()))
        {
            ret.append(Cool);
        }
    }
    return ret;
}

QList<cooling> main_class::cooling_list_fan_size_filter(QList<cooling> list, COOLING_SIZE fan_size)
{
    QList<cooling> ret;

    for(cooling Cool : list)
    {
        if(Cool.cooling_size == fan_size)
        {
            ret.append(Cool);
        }
    }
    return ret;
}



QList<RAM> main_class::apply_ram_list_filters(QList<RAM> list, QList<int> ram_speed, QString name_filter, int ram_size_filter,
                                              QString ram_type, int size_slot, int max_module)
{
    QList<RAM> ram_list_filtred = list;

    if(ram_speed.length() != 0 )
    {
        ram_list_filtred = ram_list_speed_filter(ram_list_filtred, ram_speed);

    }
    if (name_filter != "" )
    {
        ram_list_filtred = ram_list_name_filter(ram_list_filtred, name_filter);
    }
    if(ram_size_filter != 0)
    {
        ram_list_filtred = ram_list_size_filter(ram_list_filtred, ram_size_filter);
    }
    if (ram_type != "" )
    {
        ram_list_filtred = ram_list_type_filter(ram_list_filtred, ram_type_str_to_int(ram_type));
    }
    if (max_module != -1)
    {
        ram_list_filtred = ram_list_module_filter(ram_list_filtred, max_module);
    }
    if (size_slot != 0 )
    {
        ram_list_filtred = ram_list_size_slot_filter(ram_list_filtred, size_slot);
    }


    return ram_list_filtred;
}

QList<RAM> main_class::ram_list_name_filter(QList<RAM> list, QString name_filter)
{
    QList<RAM> ret;

    for(RAM ram : list)
    {
        if(ram.name.toLower().contains(name_filter.toLower()))
        {
            ret.append(ram);
        }
    }
    return ret;
}

QList<RAM> main_class::ram_list_type_filter(QList<RAM> list, int ram_type)
{
    QList<RAM> ret;

    for(RAM ram : list)
    {
        if(ram.TYPE == (RAM_TYPE) ram_type)
        {
            ret.append(ram);
        }
    }
    return ret;
}

QList<RAM> main_class::ram_list_size_slot_filter(QList<RAM> list, int size)
{
    QList<RAM> ret;

    for(RAM ram : list)
    {
        if((ram.memory_size / ram.module_number) <= size)
        {
            ret.append(ram);
        }
    }
    return ret;
}

QList<RAM> main_class::ram_list_speed_filter(QList<RAM> list, QList<int> ram_speed)
{
    QList<RAM> ret;

    for(RAM ram : list)
    {
        if(ram_speed.contains(ram.memory_speed))
        {
            ret.append(ram);
        }
    }
    return ret;
}

QList<RAM> main_class::ram_list_size_filter(QList<RAM> list, int size_total)
{
    QList<RAM> ret;

    for(RAM ram : list)
    {
        if(ram.memory_size == int( std::pow(2.0, size_total-1) ) )
        {
            ret.append(ram);
        }
    }
    return ret;
}

QList<RAM> main_class::ram_list_module_filter(QList<RAM> list, int remaining_module)
{
    QList<RAM> ret;

    for(RAM ram : list)
    {
        if(ram.module_number <= remaining_module )
        {
            ret.append(ram);
        }
    }
    return ret;
}



QList<GPU> main_class::apply_gpu_list_filters(QList<GPU> list, int no_motherboard, QString name_filter, int pcie_16x_slot, int pcie_8x_slot,
                                              int pcie_4x_slot, int pcie_1x_slot,
                                              int used_pcie_16x, int used_pcie_8x, int used_pcie_4x, int used_pcie_1x,
                                              int gpu_ram_type, int gpu_power_cable)
{
    QList<GPU> gpu_list_filtred = list;



    if (name_filter != "" )
    {
        gpu_list_filtred = gpu_list_name_filter(gpu_list_filtred, name_filter);
    }
    if (gpu_ram_type != 0 )
    {
        gpu_list_filtred = gpu_list_ram_type_filter(gpu_list_filtred, gpu_ram_type-1);
    }
    if (gpu_power_cable != 0 )
    {
        gpu_list_filtred = gpu_list_power_cable_filter(gpu_list_filtred, gpu_power_cable-1);
    }
    if(no_motherboard == 0)
    {
        gpu_list_filtred = gpu_list_bus_filter(gpu_list_filtred, pcie_16x_slot, pcie_8x_slot, pcie_4x_slot, pcie_1x_slot,
                                               used_pcie_16x, used_pcie_8x, used_pcie_4x, used_pcie_1x);
    }

    return gpu_list_filtred;
}

QList<GPU> main_class::gpu_list_name_filter(QList<GPU> list, QString name_filter)
{
    QList<GPU> ret;

    for(GPU gpu : list)
    {
        if(gpu.name.toLower().contains(name_filter.toLower()))
        {
            ret.append(gpu);
        }
    }
    return ret;
}

QList<GPU> main_class::gpu_list_bus_filter(QList<GPU> list, int pcie_16x_slot, int pcie_8x_slot,
                                           int pcie_4x_slot, int pcie_1x_slot,
                                           int used_pcie_16x, int used_pcie_8x, int used_pcie_4x, int used_pcie_1x)
{
    QList<GPU> ret;

    for(GPU gpu : list)
    {

        switch (gpu.GPU_bus)
        {
        case PCIE_16x:
            if((pcie_16x_slot - used_pcie_16x) > 0)
            {
                ret.append(gpu);
            }
            break;

        case PCIE_8x:
            if((pcie_8x_slot - used_pcie_8x) > 0)
            {
                ret.append(gpu);
            }
            break;

        case PCIE_4x:
            if((pcie_4x_slot - used_pcie_4x) > 0)
            {
                ret.append(gpu);
            }
            break;

        case PCIE_1x:
            if((pcie_1x_slot - used_pcie_1x) > 0)
            {
                ret.append(gpu);
            }
            break;
        }
    }

    return ret;
}

QList<GPU> main_class::gpu_list_ram_type_filter(QList<GPU> list, int gpu_ram_type)
{
    QList<GPU> ret;

    for(GPU gpu : list)
    {
        if(gpu.GPU_ram_type == (RAM_TYPE)gpu_ram_type)
        {
            ret.append(gpu);
        }
    }
    return ret;
}

QList<GPU> main_class::gpu_list_power_cable_filter(QList<GPU> list, int gpu_power_cable)
{
    QList<GPU> ret;

    for(GPU gpu : list)
    {
        if(gpu.power_clable_pin == (GPU_POWER_CABLE_PIN) gpu_power_cable)
        {
            ret.append(gpu);
        }
    }
    return ret;
}



QList<storage> main_class::apply_storage_list_filters(QList<storage> list, int no_motherboard, QString name_filter,
                                                      int storage_type, int storage_capacity, int remaining_sata, int remaining_M2)
{
    QList<storage> storage_list_filtred = list;

    if (name_filter != "" )
    {
        storage_list_filtred = storage_list_name_filter(storage_list_filtred, name_filter);
    }
    if (storage_type != 0 )
    {
        storage_list_filtred = storage_list_type_filter(storage_list_filtred, storage_type-1);
    }
    if (storage_capacity != 0)
    {
        storage_list_filtred = storage_list_capacity_filter(storage_list_filtred, storage_capacity-1);
    }
    if(no_motherboard == 0)
    {
        if (remaining_sata != -1)
        {
            storage_list_filtred = storage_list_remaining_sata_filter(storage_list_filtred, remaining_sata);
        }
        if (remaining_M2 != -1)
        {
            storage_list_filtred = storage_list_remaining_M2_filter(storage_list_filtred, remaining_M2);
        }
    }

    return storage_list_filtred;
}

QList<storage> main_class::storage_list_name_filter(QList<storage> list, QString name_filter)
{
    QList<storage> ret;

    for(storage ST : list)
    {
        if(ST.name.toLower().contains(name_filter.toLower()))
        {
            ret.append(ST);
        }
    }
    return ret;
}

QList<storage> main_class::storage_list_type_filter(QList<storage> list, int storage_type)
{
    QList<storage> ret;

    for(storage ST : list)
    {
        if(ST.type == (DD_type)storage_type)
        {
            ret.append(ST);
        }
    }
    return ret;
}

QList<storage> main_class::storage_list_capacity_filter(QList<storage> list, int storage_capacity)
{
    QList<storage> ret;

    for(storage ST : list)
    {
        if(ST.capacity == (DD_capacity)storage_capacity)
        {
            ret.append(ST);
        }
    }
    return ret;
}

QList<storage> main_class::storage_list_remaining_sata_filter(QList<storage> list, int remaining_sata)
{
    QList<storage> ret;

    for(storage ST : list)
    {
        if(ST.type == HDD || ST.type == SSD)
        {
            if(remaining_sata > 0)
            {
                ret.append(ST);
            }
        }else
        {
            // ST is M_2
            ret.append(ST);
        }
    }
    return ret;
}

QList<storage> main_class::storage_list_remaining_M2_filter(QList<storage> list, int remaining_M2)
{
    QList<storage> ret;

    for(storage ST : list)
    {
        if(ST.type == M_2)
        {
            if(remaining_M2 > 0)
            {
                ret.append(ST);
            }

        }
        else
        {
            // ST is ssd or hdd
            ret.append(ST);
        }
    }
    return ret;
}



QList<power_supply> main_class::apply_power_supply_list_filters(QList<power_supply> list, QString name_filter, int standard_filter,
                                                                int power_filter, int needed_sata, int needed_gpu_power_cable, int power_needed, int needed_cpu_power_cable)
{
    QList<power_supply> power_supply_list_filtred = list;

    if (name_filter != "" )
    {
        power_supply_list_filtred = power_supply_list_name_filter(power_supply_list_filtred, name_filter);
    }
    if (standard_filter != 0 )
    {
        power_supply_list_filtred = power_supply_list_standard_filter(power_supply_list_filtred, standard_filter - 1);
    }
    if (power_filter != 0 )
    {
        power_supply_list_filtred = power_supply_list_power_filter(power_supply_list_filtred, power_filter - 1);
    }
    power_supply_list_filtred = power_supply_list_sata_filter(power_supply_list_filtred, needed_sata);
    power_supply_list_filtred = power_supply_list_needed_gpu_power_cable_filter(power_supply_list_filtred, needed_gpu_power_cable);
    power_supply_list_filtred = power_supply_list_needed_power_filter(power_supply_list_filtred, power_needed);
    power_supply_list_filtred = power_supply_list_needed_cpu_power_cable_filter(power_supply_list_filtred, needed_cpu_power_cable);

    return power_supply_list_filtred;
}

QList<power_supply> main_class::power_supply_list_name_filter(QList<power_supply> list, QString name_filter)
{
    QList<power_supply> ret;

    for(power_supply PS : list)
    {
        if(PS.name.toLower().contains(name_filter.toLower()))
        {
            ret.append(PS);
        }
    }
    return ret;
}

QList<power_supply> main_class::power_supply_list_standard_filter(QList<power_supply> list, int standard_filter)
{
    QList<power_supply> ret;

    for(power_supply PS : list)
    {
        if(PS.standard == (POWER_SUPPLY_STANDARD)(standard_filter) )
        {
            ret.append(PS);
        }
    }
    return ret;
}

QList<power_supply> main_class::power_supply_list_power_filter(QList<power_supply> list, int power_filter)
{
    QList<power_supply> ret;

    for(power_supply PS : list)
    {
        if(PS.power_W == (POWER_SUPPLY_W) (power_filter) )
        {
            ret.append(PS);
        }
    }
    return ret;
}

QList<power_supply> main_class::power_supply_list_sata_filter(QList<power_supply> list, int needed_sata)
{
    QList<power_supply> ret;

    for(power_supply PS : list)
    {
        if(PS.sata_power_cable >= needed_sata)
        {
            ret.append(PS);
        }
    }
    return ret;
}

QList<power_supply> main_class::power_supply_list_needed_power_filter(QList<power_supply> list, int power_needed)
{
    QList<power_supply> ret;

    for(power_supply PS : list)
    {
        if(enum_power_supply_w_to_int(PS.power_W) >= power_needed)
        {
            ret.append(PS);
        }
    }
    return ret;
}

QList<power_supply> main_class::power_supply_list_needed_gpu_power_cable_filter(QList<power_supply> list, int needed_gpu_power_cable)
{
    QList<power_supply> ret;
    for(power_supply PS : list)
    {
        if(PS.pcie6_2_power_cable >= needed_gpu_power_cable)
        {
            ret.append(PS);
        }
    }
    return ret;
}

QList<power_supply> main_class::power_supply_list_needed_cpu_power_cable_filter(QList<power_supply> list, int needed_cpu_power_cable)
{
    QList<power_supply> ret;
    for(power_supply PS : list)
    {
        if(PS.ATX_4_power_cable >= needed_cpu_power_cable)
        {
            ret.append(PS);
        }
    }
    return ret;
}



void main_class::createPDF(QString case_name, QString motherboard, QString CPU, QString cooling, QVariant RAM, QVariant GPU, QVariant DD, QString power_supply)
{

    QVariantMap component_list;
    component_list.insert("case", case_name);
    component_list.insert("motherboard", motherboard);
    component_list.insert("CPU", CPU);
    component_list.insert("cooling", cooling);
    component_list.insert("RAM", RAM);
    component_list.insert("GPU", GPU);
    component_list.insert("storage", DD);
    component_list.insert("power_supply", power_supply);


    pdf_maker_class.create_pdf(component_list);


}



QVariantMap main_class::get_case_list(QObject* obj, QString name_filter, int mb_size_filter, QList<computer_case> list)
{

    QVariantMap main_map;
    int i = 0 ;

    if(list.isEmpty())
    {
        list = global_case_list;
    }

    QList<computer_case> computer_case_list = apply_computer_case_list_filters(list, name_filter, mb_size_filter);

    for(computer_case ccase : computer_case_list)
    {


        QVariantMap case_map;
        case_map.insert("name", ccase.name);
        case_map.insert("price", ccase.price);
        case_map.insert("buy link", ccase.buy_link);
        case_map.insert("image link", ccase.image_link);


        QVariantList case_list;
        for( int i=0; i<ccase.supported_motherboard_size.count(); i++ )
        {
            case_list.append(ccase.supported_motherboard_size[i]);
        }


        case_map.insert("supported motherboard size", case_list );
        main_map.insert(QString(i),case_map);
        i++;
    }


    if (obj != NULL)
    {
        QMetaObject::invokeMethod(obj, "create_case_object", Q_ARG(QVariant, QVariant::fromValue(main_map)));
    }

    return main_map;

}

QVariantMap main_class::get_motherboard_list(QObject *obj, QString name_filter, QString types, int chipset, int socket, int ram, QList<motherboard> list)
{
    QVariantMap main_map;
    int i = 0 ;

    if(list.isEmpty())
    {
        list = global_motherboard_list;
    }

    QList<int> supported_type_qlist;
    if (types != ""){
        for(QString type : types.split("supported motherboard size : ", Qt::SkipEmptyParts)[0].split("," , Qt::SkipEmptyParts) )
        {
            if(type == "ATX")
            {
                supported_type_qlist.append(0);
            }else
                if(type == "E_ATX")
                {
                    supported_type_qlist.append(1);
                }else
                    if(type == "Micro_ATX")
                    {
                        supported_type_qlist.append(2);
                    }else
                        if(type == "Mini_ATX")
                        {
                            supported_type_qlist.append(3);
                        }

        }
    }

    QList<motherboard> motherboard_list = apply_motherboard_list_filters(list, supported_type_qlist, name_filter, chipset, socket, ram);

    for(motherboard motherboard : motherboard_list)
    {

        QVariantMap motherboard_map;
        motherboard_map.insert("name", motherboard.name);
        motherboard_map.insert("price", motherboard.price);
        motherboard_map.insert("buy link", motherboard.buy_link);
        motherboard_map.insert("image link", motherboard.image_link);

        motherboard_map.insert("motherboard type", motherboard.MB_type);
        motherboard_map.insert("POWER pin", motherboard.power_pin);
        motherboard_map.insert("CPU chipset", motherboard.CPU_chipset);
        motherboard_map.insert("RAM type", motherboard.RAM_type);
        motherboard_map.insert("RAM slot number", motherboard.RAM_slot_number);
        motherboard_map.insert("RAM max capacity", motherboard.RAM_max_capacity);
        motherboard_map.insert("RAM max slot", motherboard.RAM_max_per_slot);
        motherboard_map.insert("GPU pcie 16x number", motherboard.GPU_PCIE_16x_number);
        motherboard_map.insert("GPU pcie 8x number", motherboard.GPU_PCIE_8x_number);
        motherboard_map.insert("GPU pcie 4x number", motherboard.GPU_PCIE_4x_number);
        motherboard_map.insert("GPU pcie 1x number", motherboard.GPU_PCIE_1x_number);
        motherboard_map.insert("SATA slot number", motherboard.SATA_slot_number);
        motherboard_map.insert("M2 slot number", motherboard.M_2_slot_number);
        motherboard_map.insert("CPU socket", motherboard.CPU_socket);

        QVariantList motherboard_list;
        for( int i=0; i<motherboard.RAM_speed_supported.count(); i++ )
        {
            motherboard_list.append(motherboard.RAM_speed_supported[i]);
        }


        motherboard_map.insert("RAM speed supported", motherboard_list );
        main_map.insert(QString(i),motherboard_map);
        i++;
    }

    if (obj != NULL)
    {
        QMetaObject::invokeMethod(obj, "create_motherboard_object", Q_ARG(QVariant, QVariant::fromValue(main_map)));
    }

    return main_map;

}

QVariantMap main_class::get_cpu_list(QObject *obj, QString name_filter, QString socket, QString chipset, QString ram_type, QList<CPU> list)
{

    QVariantMap main_map;
    int i = 0 ;

    if(list.isEmpty())
    {
        list = global_CPU_list;
    }

    QList<CPU> cpu_list = apply_cpu_list_filters(list, name_filter, socket.remove(", "), chipset.remove(", "), ram_type.remove(", ") );

    for(CPU ccpu : cpu_list)
    {
        QVariantMap cpu_map;
        cpu_map.insert("name", ccpu.name);
        cpu_map.insert("price", ccpu.price);
        cpu_map.insert("buy link", ccpu.buy_link);
        cpu_map.insert("image link", ccpu.image_link);

        cpu_map.insert("CPU socket", ccpu.socket);
        cpu_map.insert("clock speed", ccpu.clock_speed);
        cpu_map.insert("boosted clock speed", ccpu.boosted_speed);
        cpu_map.insert("cache L3", ccpu.cache_L3_Mo);
        cpu_map.insert("core number", ccpu.core_number);
        cpu_map.insert("thread number", ccpu.thread_number);
        cpu_map.insert("TDP", ccpu.TDP);
        cpu_map.insert("supported RAM type", ccpu.supported_RAM_type);
        cpu_map.insert("max RAM speed", ccpu.max_RAM_speed_MHZ);

        QVariantList cpu_list;
        for( int i=0; i<ccpu.supported_chipset.count(); i++ )
        {
            cpu_list.append(ccpu.supported_chipset[i]);
        }
        cpu_map.insert("CPU chipset", cpu_list );

        main_map.insert(QString(i),cpu_map);
        i++;
    }

    if (obj != NULL)
    {
        QMetaObject::invokeMethod(obj, "create_cpu_object", Q_ARG(QVariant, QVariant::fromValue(main_map)));
    }

    return main_map;

}

QVariantMap main_class::get_cooling_list(QObject *obj, QString name_filter, int fan_size, QList<cooling> list)
{
    QVariantMap main_map;
    int i = 0 ;

    if(list.isEmpty())
    {
        list = global_cooling_list;
    }

    QList<cooling> cooling_list = apply_cooling_list_filters(list, name_filter, fan_size);

    for(cooling ccooling : cooling_list)
    {
        QVariantMap cooling_map;
        cooling_map.insert("name", ccooling.name);
        cooling_map.insert("price", ccooling.price);
        cooling_map.insert("buy link", ccooling.buy_link);
        cooling_map.insert("image link", ccooling.image_link);

        cooling_map.insert("cooling size", ccooling.cooling_size);
        cooling_map.insert("cooling min sound", ccooling.cooling_min_sound_dB);
        cooling_map.insert("cooling max sound", ccooling.cooling_max_sound_dB);
        cooling_map.insert("cooling min speed", ccooling.cooling_min_speed);
        cooling_map.insert("cooling max speed", ccooling.cooling_max_speed);
        cooling_map.insert("air flow", ccooling.air_flow_CFM);

        QVariantList cooling_list;
        for( int i=0; i<ccooling.supported_socket.count(); i++ )
        {
            cooling_list.append(ccooling.supported_socket[i]);
        }
        cooling_map.insert("CPU socket", cooling_list );

        main_map.insert(QString(i),cooling_map);
        i++;
    }

    if (obj != NULL)
    {
        QMetaObject::invokeMethod(obj, "create_cooling_object", Q_ARG(QVariant, QVariant::fromValue(main_map)));
    }

    return main_map;

}

QVariantMap main_class::get_ram_list(QObject *obj, QString ram_speed, QString name_filter, int ram_size_filter, QString ram_type , int size, int max_module, QList<RAM> list)
{
    QVariantMap main_map;
    int i = 0 ;

    if(list.isEmpty())
    {
        list = global_RAM_list;
    }

    QList<int> supported_ram_speed_qlist;
    for(QString rram_speed : ram_speed.split(", " , Qt::SkipEmptyParts) )
    {

        supported_ram_speed_qlist.append(ram_speed_str_to_int(rram_speed));
    }

    QList<RAM> ram_list = apply_ram_list_filters(list, supported_ram_speed_qlist ,
                                                 name_filter, ram_size_filter, ram_type.remove(", "), size, max_module);
    for(RAM rram : ram_list)
    {
        QVariantMap ram_map;
        ram_map.insert("name", rram.name);
        ram_map.insert("price", rram.price);
        ram_map.insert("buy link", rram.buy_link);
        ram_map.insert("image link", rram.image_link);

        ram_map.insert("RAM type", rram.TYPE);
        ram_map.insert("memory size", rram.memory_size);
        ram_map.insert("memory speed", rram.memory_speed);
        ram_map.insert("module number", rram.module_number);

        main_map.insert(QString(i),ram_map);
        i++;

    }

    if (obj != NULL)
    {
        QMetaObject::invokeMethod(obj, "create_ram_object", Q_ARG(QVariant, QVariant::fromValue(main_map)));
    }

    return main_map;

}

QVariantMap main_class::get_gpu_list(QObject *obj, int no_motherboard, QString name_filter, int pcie_16x_slot, int pcie_8x_slot,
                                     int pcie_4x_slot, int pcie_1x_slot, int used_pcie_16x, int used_pcie_8x, int used_pcie_4x,
                                     int used_pcie_1x, int gpu_ram_type, int gpu_power_cable, QList<GPU> list)
{
    QVariantMap main_map;
    int i = 0 ;

    if(list.isEmpty())
    {
        list = global_GPU_list;
    }

    QList<GPU> cpu_list = apply_gpu_list_filters(list, no_motherboard, name_filter, pcie_16x_slot,
                                                 pcie_8x_slot, pcie_4x_slot, pcie_1x_slot,
                                                 used_pcie_16x, used_pcie_8x, used_pcie_4x, used_pcie_1x,
                                                 gpu_ram_type, gpu_power_cable);
    for(GPU ggpu : cpu_list)
    {

        QVariantMap gpu_map;
        gpu_map.insert("name", ggpu.name);
        gpu_map.insert("price", ggpu.price);
        gpu_map.insert("buy link", ggpu.buy_link);
        gpu_map.insert("image link", ggpu.image_link);

        gpu_map.insert("clock speed", ggpu.clock);
        gpu_map.insert("boosted clock speed", ggpu.boost_clock);
        gpu_map.insert("GPU core number", ggpu.GPU_core_number);
        gpu_map.insert("GPU bus", ggpu.GPU_bus);
        gpu_map.insert("GPU RAM type", ggpu.GPU_ram_type);
        gpu_map.insert("GPU RAM size", ggpu.GPU_ram_size);
        gpu_map.insert("GPU RAM frequency", ggpu.GPU_ram_frequency_MHZ);
        gpu_map.insert("GPU flux", ggpu.GPU_flux);
        gpu_map.insert("power consumption", ggpu.power_consumption);
        gpu_map.insert("power cable pin", ggpu.power_clable_pin);

        main_map.insert(QString(i),gpu_map);
        i++;
    }

    if (obj != NULL)
    {
        QMetaObject::invokeMethod(obj, "create_gpu_object", Q_ARG(QVariant, QVariant::fromValue(main_map)));
    }

    return main_map;

}

QVariantMap main_class::get_storage_list(QObject *obj, int no_motherboard, QString name_filter, int storage_type,
                                         int storage_capacity, int max_sata, int max_M2, QList<storage> list)
{
    QVariantMap main_map;
    int i = 0 ;

    if(list.isEmpty())
    {
        list = global_storage_list;
    }

    QList<storage> storage_list = apply_storage_list_filters(list, no_motherboard,
                                                             name_filter, storage_type, storage_capacity,
                                                             max_sata, max_M2);
    for(storage sstorage : storage_list)
    {

        QVariantMap storage_map;
        storage_map.insert("name", sstorage.name);
        storage_map.insert("price", sstorage.price);
        storage_map.insert("buy link", sstorage.buy_link);
        storage_map.insert("image link", sstorage.image_link);

        storage_map.insert("Read Speed", sstorage.read_speed);
        storage_map.insert("Write Speed", sstorage.write_speed);
        storage_map.insert("DD type", sstorage.type);
        storage_map.insert("capacity", sstorage.capacity);
        storage_map.insert("RPM", sstorage.RPM);

        main_map.insert(QString(i),storage_map);
        i++;
    }

    if (obj != NULL)
    {
        QMetaObject::invokeMethod(obj, "create_storage_object", Q_ARG(QVariant, QVariant::fromValue(main_map)));
    }

    return main_map;

}

QVariantMap main_class::get_power_supply_list(QObject *obj, QString name_filter, int standard_filter, int power_filter,
                                              int needed_sata, int needed_gpu_power_cable, int power_needed, int needed_cpu_power_cable, QList<power_supply> list)
{
    QVariantMap main_map;
    int i = 0 ;

    if(list.isEmpty())
    {
        list = global_power_supply_list;
    }

    QList<power_supply> power_supply_list = apply_power_supply_list_filters(list, name_filter, standard_filter,
                                                                            power_filter, needed_sata, needed_gpu_power_cable, power_needed, needed_cpu_power_cable);

    for(power_supply ccpowersupply : power_supply_list)
    {

        QVariantMap powersupply_map;
        powersupply_map.insert("name", ccpowersupply.name);
        powersupply_map.insert("price", ccpowersupply.price);
        powersupply_map.insert("buy link", ccpowersupply.buy_link);
        powersupply_map.insert("image link", ccpowersupply.image_link);

        powersupply_map.insert("Power supply standard", ccpowersupply.standard);
        powersupply_map.insert("Power (W)", ccpowersupply.power_W);
        powersupply_map.insert("Sata power cable", ccpowersupply.sata_power_cable);
        powersupply_map.insert("PCIE 6_2 power cable", ccpowersupply.pcie6_2_power_cable);
        powersupply_map.insert("ATX 24 power cable", ccpowersupply.ATX_24_power_cable);
        powersupply_map.insert("ATX 4 pin", ccpowersupply.ATX_4_power_cable);
        powersupply_map.insert("Molex 4 power cable", ccpowersupply.molex4_power_cable);

        main_map.insert(QString(i),powersupply_map);
        i++;
    }

    if (obj != NULL)
    {
        QMetaObject::invokeMethod(obj, "create_power_supply_object", Q_ARG(QVariant, QVariant::fromValue(main_map)));
    }

    return main_map;

}

void main_class::import_component(QString file_path)
{

    QFile json_file(file_path.split("file:///",QString::SkipEmptyParts)[0]);

    if (json_file.open(QFile::ReadOnly | QFile::Text))
    {
        // read all data
        QString data = json_file.readAll();
        //get json document
        QJsonDocument documentJSON = QJsonDocument::fromJson(data.toUtf8());
        //extract json object
        QJsonObject objetJSON = documentJSON.object();

        //extract

        //case
        foreach(QJsonValue key , objetJSON.value("case").toObject())
        {
            QFile save_file("case/" + key.toObject()["name"].toString() + ".json");
            if (save_file.open(QFile::WriteOnly | QIODevice::Text))
            {
                save_file.write( QJsonDocument(key.toObject()).toJson() );
                save_file.close();
            }
        }


        //motherboard
        foreach(QJsonValue key , objetJSON["motherboard"].toObject())
        {
            QFile save_file("motherboard/" + key.toObject()["name"].toString() + ".json");
            if (save_file.open(QFile::WriteOnly | QIODevice::Text))
            {
                save_file.write(QJsonDocument(key.toObject()).toJson());
                save_file.close();
            }
        }

        //cpu
        foreach(QJsonValue key , objetJSON["cpu"].toObject())
        {
            QFile save_file("cpu/" + key.toObject()["name"].toString() + ".json");
            if (save_file.open(QFile::WriteOnly | QIODevice::Text))
            {
                save_file.write(QJsonDocument(key.toObject()).toJson());
                save_file.close();
            }
        }

        //cooling
        foreach(QJsonValue key , objetJSON["cooling"].toObject())
        {
            QFile save_file("cooling/" + key.toObject()["name"].toString() + ".json");
            if (save_file.open(QFile::WriteOnly | QIODevice::Text))
            {
                save_file.write(QJsonDocument(key.toObject()).toJson());
                save_file.close();
            }
        }

        //ram
        foreach(QJsonValue key , objetJSON["ram"].toObject())
        {
            QFile save_file("ram/" + key.toObject()["name"].toString() + ".json");
            if (save_file.open(QFile::WriteOnly | QIODevice::Text))
            {
                save_file.write(QJsonDocument(key.toObject()).toJson());
                save_file.close();
            }
        }

        //gpu
        foreach(QJsonValue key , objetJSON["gpu"].toObject())
        {
            QFile save_file("gpu/" + key.toObject()["name"].toString() + ".json");
            if (save_file.open(QFile::WriteOnly | QIODevice::Text))
            {
                save_file.write(QJsonDocument(key.toObject()).toJson());
                save_file.close();
            }
        }

        //storage
        foreach(QJsonValue key , objetJSON["storage"].toObject())
        {
            QFile save_file("storage/" + key.toObject()["name"].toString() + ".json");
            if (save_file.open(QFile::WriteOnly | QIODevice::Text))
            {
                save_file.write(QJsonDocument(key.toObject()).toJson());
                save_file.close();
            }
        }

        //power supply
        foreach(QJsonValue key , objetJSON["power supply"].toObject())
        {
            QFile save_file("powersupply/" + key.toObject()["name"].toString() + ".json");
            if (save_file.open(QFile::WriteOnly | QIODevice::Text))
            {
                save_file.write(QJsonDocument(key.toObject()).toJson());
                save_file.close();
            }
        }


        //close
        json_file.close();
    }

}

void main_class::export_component(QString file_path)
{

    QJsonObject json;

    //computer case
    QJsonObject case_json;
    QDir directory_case("./case");

    QStringList json_case_files = directory_case.entryList(QStringList() << "*.json",QDir::Files);
    //get all file int the forlder
    foreach(QString filename, json_case_files)
    {
        QFile json_file("./case/" + filename);
        if (json_file.open(QFile::ReadOnly | QFile::Text))
        {
            // read all data
            QString data = json_file.readAll();
            //get json document
            QJsonDocument documentJSON = QJsonDocument::fromJson(data.toUtf8());
            //extract json object
            QJsonObject objetJSON = documentJSON.object();

            case_json.insert(filename, objetJSON );


            //close
            json_file.close();
        }
    }
    json.insert("case",case_json);


    // motherboard
    QJsonObject motherboard_json;
    QDir directory_motherboard("./motherboard");

    QStringList json_motherboard_files = directory_motherboard.entryList(QStringList() << "*.json",QDir::Files);
    //get all file int the forlder
    foreach(QString filename, json_motherboard_files)
    {
        QFile json_file("./motherboard/" + filename);
        if (json_file.open(QFile::ReadOnly | QFile::Text))
        {
            // read all data
            QString data = json_file.readAll();
            //get json document
            QJsonDocument documentJSON = QJsonDocument::fromJson(data.toUtf8());
            //extract json object
            QJsonObject objetJSON = documentJSON.object();

            motherboard_json.insert(filename, objetJSON );


            //close
            json_file.close();
        }
    }
    json.insert("motherboard",motherboard_json);


    // cpu
    QJsonObject cpu_json;
    QDir directory_cpu("./cpu");

    QStringList json_cpu_files = directory_cpu.entryList(QStringList() << "*.json",QDir::Files);
    //get all file int the forlder
    foreach(QString filename, json_cpu_files)
    {
        QFile json_file("./cpu/" + filename);
        if (json_file.open(QFile::ReadOnly | QFile::Text))
        {
            // read all data
            QString data = json_file.readAll();
            //get json document
            QJsonDocument documentJSON = QJsonDocument::fromJson(data.toUtf8());
            //extract json object
            QJsonObject objetJSON = documentJSON.object();
            cpu_json.insert(filename, objetJSON );


            //close
            json_file.close();
        }
    }
    json.insert("cpu",cpu_json);


    //cooling
    QJsonObject cooling_json;
    QDir directory_cooling("./cooling");

    QStringList json_cooling_files = directory_cooling.entryList(QStringList() << "*.json",QDir::Files);
    //get all file int the forlder
    foreach(QString filename, json_cooling_files)
    {
        QFile json_file("./cooling/" + filename);
        if (json_file.open(QFile::ReadOnly | QFile::Text))
        {
            // read all data
            QString data = json_file.readAll();
            //get json document
            QJsonDocument documentJSON = QJsonDocument::fromJson(data.toUtf8());
            //extract json object
            QJsonObject objetJSON = documentJSON.object();

            cooling_json.insert(filename, objetJSON );


            //close
            json_file.close();
        }
    }
    json.insert("cooling",cooling_json);


    // ram
    QJsonObject ram_json;
    QDir directory_ram("./ram");

    QStringList json_ram_files = directory_ram.entryList(QStringList() << "*.json",QDir::Files);
    //get all file int the forlder
    foreach(QString filename, json_ram_files)
    {
        QFile json_file("./ram/" + filename);
        if (json_file.open(QFile::ReadOnly | QFile::Text))
        {
            // read all data
            QString data = json_file.readAll();
            //get json document
            QJsonDocument documentJSON = QJsonDocument::fromJson(data.toUtf8());
            //extract json object
            QJsonObject objetJSON = documentJSON.object();

            ram_json.insert(filename, objetJSON );


            //close
            json_file.close();
        }
    }
    json.insert("ram",ram_json);


    // gpu
    QJsonObject gpu_json;
    QDir directory_gpu("./gpu");

    QStringList json_gpu_files = directory_gpu.entryList(QStringList() << "*.json",QDir::Files);
    //get all file int the forlder
    foreach(QString filename, json_gpu_files)
    {
        QFile json_file("./gpu/" + filename);
        if (json_file.open(QFile::ReadOnly | QFile::Text))
        {
            // read all data
            QString data = json_file.readAll();
            //get json document
            QJsonDocument documentJSON = QJsonDocument::fromJson(data.toUtf8());
            //extract json object
            QJsonObject objetJSON = documentJSON.object();

            gpu_json.insert(filename, objetJSON );


            //close
            json_file.close();
        }
    }
    json.insert("gpu",gpu_json);


    // storage
    QJsonObject storage_json;
    QDir directory_storage("./storage");

    QStringList json_storage_files = directory_storage.entryList(QStringList() << "*.json",QDir::Files);
    //get all file int the forlder
    foreach(QString filename, json_storage_files)
    {
        QFile json_file("./storage/" + filename);
        if (json_file.open(QFile::ReadOnly | QFile::Text))
        {
            // read all data
            QString data = json_file.readAll();
            //get json document
            QJsonDocument documentJSON = QJsonDocument::fromJson(data.toUtf8());
            //extract json object
            QJsonObject objetJSON = documentJSON.object();

            storage_json.insert(filename, objetJSON );


            //close
            json_file.close();
        }
    }
    json.insert("storage",storage_json);


    // power supply
    QJsonObject power_supply_json;
    QDir directory_power_supply("./powersupply");

    QStringList json_power_supply_files = directory_power_supply.entryList(QStringList() << "*.json",QDir::Files);
    //get all file int the forlder
    foreach(QString filename, json_power_supply_files)
    {
        QFile json_file("./powersupply/" + filename);
        if (json_file.open(QFile::ReadOnly | QFile::Text))
        {
            // read all data
            QString data = json_file.readAll();
            //get json document
            QJsonDocument documentJSON = QJsonDocument::fromJson(data.toUtf8());
            //extract json object
            QJsonObject objetJSON = documentJSON.object();

            power_supply_json.insert(filename, objetJSON );


            //close
            json_file.close();
        }
    }
    json.insert("power supply",power_supply_json);


    //save qml
    QFile save_file(file_path.split("file:///",QString::SkipEmptyParts)[0]);
    if (save_file.open(QFile::WriteOnly | QIODevice::Text))
    {
        save_file.write(QJsonDocument(json).toJson());
        save_file.close();
    }



}




