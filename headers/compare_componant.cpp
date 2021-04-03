#include "compare_componant.h"

compare_componant::compare_componant(QObject *parent) : QObject(parent)
{
    init_list();
}

void compare_componant::init_list()
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


QVariantMap compare_componant::get_computer_case_name_list()
{
    QVariantMap return_map;
    int i = 0 ;

    for(computer_case ccase : global_case_list)
    {

        return_map.insert(QString(i), ccase.name);
        i++;
    }
    if (return_map.size() != 0)
    {
        return return_map;
    }
    else
    {
        return_map.clear();
        return_map.insert(0, "None");
        return return_map;
    }
}

QVariantMap compare_componant::get_computer_case(QString name)
{
    QVariantMap return_map;

    for(computer_case ccase : global_case_list)
    {
        if(ccase.name == name)
        {
            return_map.insert("name", QString(ccase.name));
            return_map.insert("price",  QString::number(ccase.price) + " " + QString::fromUtf8("€"));

            QString case_list;
            for(int i=0; i<ccase.supported_motherboard_size.count(); i++ )
            {
                case_list += motherboard_size_int_to_str(ccase.supported_motherboard_size[i]) + " ; ";
            }

            return_map.insert("supported motherboard size", case_list );
        }

    }

    return return_map;
}


QVariantMap compare_componant::get_cpu_name_list()
{
    QVariantMap return_map;
    int i = 0 ;

    for(CPU ccpu : global_CPU_list)
    {

        return_map.insert(QString(i), ccpu.name);
        i++;
    }

    if (return_map.size() != 0)
    {
        return return_map;
    }
    else
    {
        return_map.clear();
        return_map.insert(0, "None");
        return return_map;
    }
}

QVariantMap compare_componant::get_cpu(QString name)
{
    QVariantMap return_map;

    for(CPU ccpu : global_CPU_list)
    {
        if(ccpu.name == name)
        {
            return_map.insert("name", QString(ccpu.name));
            return_map.insert("price", QString::number(ccpu.price) + " " + QString::fromUtf8("€"));

            return_map.insert("CPU socket", cpu_socket_int_to_str(ccpu.socket));
            return_map.insert("clock speed", QString::number(ccpu.clock_speed) + " Mhz");
            return_map.insert("boosted clock speed", QString::number(ccpu.boosted_speed) + " Mhz");
            return_map.insert("cache L3", QString::number(ccpu.cache_L3_Mo) + " MB");
            return_map.insert("core number", QString::number(ccpu.core_number));
            return_map.insert("thread number", QString::number(ccpu.thread_number));
            return_map.insert("TDP", QString::number(ccpu.TDP) + " W");
            return_map.insert("supported RAM type", ram_type_int_to_str(ccpu.supported_RAM_type));
            return_map.insert("max RAM speed", ram_speed_int_to_str(ccpu.max_RAM_speed_MHZ));

            QString cpu_list;
            for( int i=0; i<ccpu.supported_chipset.count(); i++ )
            {
                cpu_list += cpu_chipset_int_to_str(ccpu.supported_chipset[i]) + " ; ";
            }

            return_map.insert("CPU chipset", cpu_list );
        }

    }

    return return_map;
}


QVariantMap compare_componant::get_motherboard_name_list()
{
    QVariantMap return_map;
    int i = 0 ;

    for(motherboard mb : global_motherboard_list)
    {

        return_map.insert(QString(i), mb.name);
        i++;
    }

    if (return_map.size() != 0)
    {
        return return_map;
    }
    else
    {
        return_map.clear();
        return_map.insert(0, "None");
        return return_map;
    }
}

QVariantMap compare_componant::get_motherboard(QString name)
{
    QVariantMap return_map;

    for(motherboard mb : global_motherboard_list)
    {
        if(mb.name == name)
        {
            return_map.insert("name", QString(mb.name));
            return_map.insert("price", QString::number(mb.price) + " " + QString::fromUtf8("€"));

            return_map.insert("motherboard type", motherboard_size_int_to_str(mb.MB_type));
            return_map.insert("POWER pin", motherboard_power_pin_int_to_str(mb.power_pin));
            return_map.insert("CPU chipset", cpu_chipset_int_to_str(mb.CPU_chipset));
            return_map.insert("RAM type", ram_type_int_to_str(mb.RAM_type));
            return_map.insert("RAM slot number", QString::number(mb.RAM_slot_number));
            return_map.insert("RAM max capacity", QString::number(mb.RAM_max_capacity) + " GB");
            return_map.insert("RAM max slot", QString::number(mb.RAM_max_per_slot) + " GB");
            return_map.insert("GPU pcie 16x number", QString::number(mb.GPU_PCIE_16x_number));
            return_map.insert("GPU pcie 8x number", QString::number(mb.GPU_PCIE_8x_number));
            return_map.insert("GPU pcie 4x number", QString::number(mb.GPU_PCIE_4x_number));
            return_map.insert("GPU pcie 1x number", QString::number(mb.GPU_PCIE_1x_number));
            return_map.insert("SATA slot number", QString::number(mb.SATA_slot_number));
            return_map.insert("M2 slot number", QString::number(mb.M_2_slot_number));
            return_map.insert("CPU socket", cpu_socket_int_to_str(mb.CPU_socket));

            QString motherboard_list;
            for( int i=0; i<mb.RAM_speed_supported.count(); i++ )
            {
                motherboard_list += ram_speed_int_to_str(mb.RAM_speed_supported[i]) + " ; ";
            }


            return_map.insert("RAM speed supported", motherboard_list);
        }

    }

    return return_map;
}


QVariantMap compare_componant::get_cooling_name_list()
{
    QVariantMap return_map;
    int i = 0 ;

    for(cooling ccooling : global_cooling_list)
    {

        return_map.insert(QString(i), ccooling.name);
        i++;
    }

    if (return_map.size() != 0)
    {
        return return_map;
    }
    else
    {
        return_map.clear();
        return_map.insert(0, "None");
        return return_map;
    }
}

QVariantMap compare_componant::get_cooling(QString name)
{
    QVariantMap return_map;

    for(cooling ccooling : global_cooling_list)
    {
        if(ccooling.name == name)
        {
            return_map.insert("name", QString(ccooling.name));
            return_map.insert("price", QString::number(ccooling.price) + " " + QString::fromUtf8("€"));

            return_map.insert("cooling size", cooling_size_int_to_str(ccooling.cooling_size));
            return_map.insert("cooling min sound", QString::number(ccooling.cooling_min_sound_dB) + " dB");
            return_map.insert("cooling max sound", QString::number(ccooling.cooling_max_sound_dB) + " dB");
            return_map.insert("cooling min speed", QString::number(ccooling.cooling_min_speed) + " RPM");
            return_map.insert("cooling max speed", QString::number(ccooling.cooling_max_speed) + " RPM");
            return_map.insert("air flow", QString::number(ccooling.air_flow_CFM) + " CFM");

            QString cooling_list;
            for( int i=0; i<ccooling.supported_socket.count(); i++ )
            {
                cooling_list += cpu_socket_int_to_str(ccooling.supported_socket[i]) + " ; ";
            }

            return_map.insert("CPU socket", cooling_list );
        }

    }

    return return_map;
}


QVariantMap compare_componant::get_ram_name_list()
{
    QVariantMap return_map;
    int i = 0 ;

    for(RAM ram : global_RAM_list)
    {

        return_map.insert(QString(i), ram.name);
        i++;
    }

    if (return_map.size() != 0)
    {
        return return_map;
    }
    else
    {
        return_map.clear();
        return_map.insert(0, "None");
        return return_map;
    }
}

QVariantMap compare_componant::get_ram(QString name)
{
    QVariantMap return_map;

    for(RAM rram : global_RAM_list)
    {
        if(rram.name == name)
        {
            return_map.insert("name", QString(rram.name));
            return_map.insert("price", QString::number(rram.price) + " " + QString::fromUtf8("€"));

            return_map.insert("RAM type", ram_type_int_to_str(rram.TYPE));
            return_map.insert("memory size", QString::number(rram.memory_size) + " GB");
            return_map.insert("memory speed", ram_speed_int_to_str(rram.memory_speed));
            return_map.insert("module number", QString::number(rram.module_number));
        }

    }

    return return_map;
}


QVariantMap compare_componant::get_gpu_name_list()
{
    QVariantMap return_map;
    int i = 0 ;

    for(GPU ggpu : global_GPU_list)
    {

        return_map.insert(QString(i), ggpu.name);
        i++;
    }

    if (return_map.size() != 0)
    {
        return return_map;
    }
    else
    {
        return_map.clear();
        return_map.insert(0, "None");
        return return_map;
    }
}

QVariantMap compare_componant::get_gpu(QString name)
{
    QVariantMap return_map;

    for(GPU ggpu : global_GPU_list)
    {
        if(ggpu.name == name)
        {
            return_map.insert("name", QString(ggpu.name));
            return_map.insert("price", QString::number(ggpu.price) + " " + QString::fromUtf8("€"));

            return_map.insert("clock speed", QString::number(ggpu.clock) + " Ghz");
            return_map.insert("boosted clock speed", QString::number(ggpu.boost_clock) + " Ghz");
            return_map.insert("GPU core number", QString::number(ggpu.GPU_core_number));
            return_map.insert("GPU bus", gpu_bus_int_to_str(ggpu.GPU_bus));
            return_map.insert("GPU RAM type", ram_type_int_to_str(ggpu.GPU_ram_type));
            return_map.insert("GPU RAM size", QString::number(ggpu.GPU_ram_size) + " GB");
            return_map.insert("GPU RAM frequency", QString::number(ggpu.GPU_ram_frequency_MHZ) + " Mhz");
            return_map.insert("GPU flux", QString::number(ggpu.GPU_flux));
            return_map.insert("power consumption", QString::number(ggpu.power_consumption) + " W");
            return_map.insert("power cable pin", gpu_power_cable_pin_int_to_str(ggpu.power_clable_pin));
        }

    }

    return return_map;
}


QVariantMap compare_componant::get_storage_name_list()
{
    QVariantMap return_map;
    int i = 0 ;

    for(storage sstorage : global_storage_list)
    {

        return_map.insert(QString(i), sstorage.name);
        i++;
    }

    if (return_map.size() != 0)
    {
        return return_map;
    }
    else
    {
        return_map.clear();
        return_map.insert(0, "None");
        return return_map;
    }
}

QVariantMap compare_componant::get_storage(QString name)
{
    QVariantMap return_map;

    for(storage sstorage : global_storage_list)
    {
        if(sstorage.name == name)
        {
            return_map.insert("name", QString(sstorage.name));
            return_map.insert("price", QString::number(sstorage.price) + " " + QString::fromUtf8("€"));

            return_map.insert("Read Speed", QString::number(sstorage.read_speed) + " MB/s");
            return_map.insert("Write Speed", QString::number(sstorage.write_speed) + " MB/s");
            return_map.insert("DD type", storage_type_int_to_str(sstorage.type));
            return_map.insert("capacity", storage_capacity_int_to_str(sstorage.capacity));
            return_map.insert("RPM", QString::number(sstorage.RPM));
        }

    }

    return return_map;
}


QVariantMap compare_componant::get_power_supply_name_list()
{
    QVariantMap return_map;
    int i = 0 ;

    for(power_supply ps : global_power_supply_list)
    {

        return_map.insert(QString(i), ps.name);
        i++;
    }

    if (return_map.size() != 0)
    {
        return return_map;
    }
    else
    {
        return_map.clear();
        return_map.insert(0, "None");
        return return_map;
    }
}

QVariantMap compare_componant::get_power_supply(QString name)
{
    QVariantMap return_map;

    for(power_supply ccpowersupply : global_power_supply_list)
    {
        if(ccpowersupply.name == name)
        {
            return_map.insert("name", QString(ccpowersupply.name));
            return_map.insert("price", QString::number(ccpowersupply.price) + " " + QString::fromUtf8("€"));

            return_map.insert("Power supply standard", power_supply_standard_int_to_str(ccpowersupply.standard));
            return_map.insert("Power (W)", power_supply_W_int_to_str(ccpowersupply.power_W));
            return_map.insert("Sata power cable", QString::number(ccpowersupply.sata_power_cable));
            return_map.insert("PCIE 6_2 power cable", QString::number(ccpowersupply.pcie6_2_power_cable));
            return_map.insert("ATX 24 power cable", QString::number(ccpowersupply.ATX_24_power_cable));
            return_map.insert("ATX 4 pin", QString::number(ccpowersupply.ATX_4_power_cable));
            return_map.insert("Molex 4 power cable", QString::number(ccpowersupply.molex4_power_cable));

        }

    }

    return return_map;
}

QString compare_componant::motherboard_size_int_to_str(int motherboard_size_int)
{
    if (motherboard_size_int == 0)
    {
        return "ATX";

    }else if (motherboard_size_int == 1)
    {
        return "E_ATX";

    }else if (motherboard_size_int == 2)
    {
        return "Micro_ATX";

    }else if (motherboard_size_int == 3)
    {
        return "Mini_ATX";
    }else
    {
        return "";
    }

}

QString compare_componant::motherboard_power_pin_int_to_str(int motherboard_power_pin_int)
{
    if (motherboard_power_pin_int == 0)
    {
        return "ATX 4 Pin";

    }else if (motherboard_power_pin_int == 1)
    {
        return "ATX 8 Pin";

    }else if (motherboard_power_pin_int == 2)
    {
        return "ATX 2x8 Pin";

    }else
    {
        return "";
    }
}

QString compare_componant::cpu_chipset_int_to_str(int cpu_chiptset_int)
{
    if (cpu_chiptset_int == 0)
    {
        return "AMD_A68H";

    }
    else if (cpu_chiptset_int == 1)
    {
        return "AMD_760G";

    }
    else if (cpu_chiptset_int == 2)
    {
        return "AMD_A520";

    }
    else if (cpu_chiptset_int == 3)
    {
        return "AMD_B350";
    }
    else if (cpu_chiptset_int == 4)
    {
        return "AMD_B450";
    }
    else if (cpu_chiptset_int == 5)
    {
        return "AMD_B550";
    }
    else if (cpu_chiptset_int == 6)
    {
        return "AMD_X370";
    }
    else if (cpu_chiptset_int == 7)
    {
        return "AMD_X399";
    }
    else if (cpu_chiptset_int == 8)
    {
        return "AMD_X470";

    }
    else if (cpu_chiptset_int == 9)
    {
        return "AMD_X570";

    }
    else if (cpu_chiptset_int == 10)
    {
        return "AMD_TRX40";

    }
    else if (cpu_chiptset_int == 11)
    {
        return "Intel_H110";

    }
    else if (cpu_chiptset_int == 12)
    {
        return "Intel_H270";
    }
    else if (cpu_chiptset_int == 13)
    {
        return "Intel_H310";
    }
    else if (cpu_chiptset_int == 14)
    {
        return "Intel_H370";
    }
    else if (cpu_chiptset_int == 15)
    {
        return "Intel_B150";

    }
    else if (cpu_chiptset_int == 10)
    {
        return "Intel_B250";
    }
    else if (cpu_chiptset_int == 16)
    {
        return "Intel_B360";
    }
    else if (cpu_chiptset_int == 17)
    {
        return "Intel_B365";
    }
    else if (cpu_chiptset_int == 18)
    {
        return "Intel_Z170";
    }
    else if (cpu_chiptset_int == 19)
    {
        return "Intel_Z270";
    }
    else if (cpu_chiptset_int == 20)
    {
        return "Intel_Z370";
    }
    else if (cpu_chiptset_int == 21)
    {
        return "Intel_Z390";
    }
    else if (cpu_chiptset_int == 22)
    {
        return "Intel_X99";
    }
    else if (cpu_chiptset_int == 23)
    {
        return "Intel_X299";
    }else
    {
        return "";
    }

}

QString compare_componant::cpu_socket_int_to_str(int cpu_socket_int)
{
    if (cpu_socket_int == 0)
    {
        return "AMD_AM2";

    }else if (cpu_socket_int == 1)
    {
        return "AMD_AM2_plus";

    }else if (cpu_socket_int == 2)
    {
        return "AMD_AM3";
    }else if (cpu_socket_int == 3)
    {
        return "AMD_AM3_plus";
    }
    else if (cpu_socket_int == 4)
    {
        return "AMD_AM4";
    }else if (cpu_socket_int == 5)
    {
        return "AMD_SP3";

    }else if (cpu_socket_int == 6)
    {
        return "AMD_sTR4";
    }else if (cpu_socket_int == 7)
    {
        return "AMD_sTRx4";
    }
    else if (cpu_socket_int == 8)
    {
        return "LGA_1150";
    }else if (cpu_socket_int == 9)
    {
        return "LGA_1151";

    }else if (cpu_socket_int == 10)
    {
        return "LGA_1155";
    }else if (cpu_socket_int == 11)
    {
        return "LGA_1156";
    }
    else if (cpu_socket_int == 12)
    {
        return "LGA_1366";
    }else if (cpu_socket_int == 13)
    {
        return "LGA_2011";
    }else if (cpu_socket_int == 14)
    {
        return "LGA_2011_v3";
    }
    else if (cpu_socket_int == 15)
    {
        return "LGA_2066";
    }else
    {
        return "";
    }

}

QString compare_componant::ram_type_int_to_str(int ram_type_int)
{
    if (ram_type_int == 0)
    {
        return "DDR3";

    }else if (ram_type_int == 1)
    {
        return "DDR4";

    }else if (ram_type_int == 2)
    {
        return "GDDR5";
    }else if (ram_type_int == 3)
    {
        return "GDDR5X";
    }
    else if (ram_type_int == 4)
    {
        return "GDDR6";
    }else
    {
        return "";
    }

}

QString compare_componant::ram_speed_int_to_str(int ram_speed_int)
{
    if (ram_speed_int == 0)
    {
        return "1066Mhz";
    }else if (ram_speed_int == 1)
    {
        return "1333Mhz";

    }else if (ram_speed_int == 2)
    {
        return "1600Mhz";
    }else if (ram_speed_int == 3)
    {
        return "1866Mhz";
    }else if (ram_speed_int == 4)
    {
        return "2133Mhz";
    }else if (ram_speed_int == 5)
    {
        return "2400Mhz";
    }else if (ram_speed_int == 6)
    {
        return "2666Mhz";
    }else if (ram_speed_int == 7)
    {
        return "2800Mhz";
    }else if (ram_speed_int == 8)
    {
        return "2933Mhz";
    }else if (ram_speed_int == 9)
    {
        return "3000Mhz";
    }else if (ram_speed_int == 10)
    {
        return "3200Mhz";
    }else if (ram_speed_int == 11)
    {
        return "3300Mhz";
    }else if (ram_speed_int == 12)
    {
        return "3333Mhz";
    }else if (ram_speed_int == 13)
    {
        return "3400Mhz";
    }else if (ram_speed_int == 14)
    {
        return "3466Mhz";
    }else if (ram_speed_int == 15)
    {
        return "3600Mhz";
    }else if (ram_speed_int == 16)
    {
        return "3666Mhz";
    }else if (ram_speed_int == 17)
    {
        return "3733Mhz";
    }else if (ram_speed_int == 18)
    {
        return "3800Mhz";
    }else if (ram_speed_int == 19)
    {
        return "3866Mhz";
    }else if (ram_speed_int == 20)
    {
        return "4000Mhz";
    }else if (ram_speed_int == 21)
    {
        return "4133Mhz";
    }else if (ram_speed_int == 22)
    {
        return "4200Mhz";
    }else if (ram_speed_int == 23)
    {
        return "4266Mhz";
    }else if (ram_speed_int == 24)
    {
        return "4300Mhz";
    }else if (ram_speed_int == 25)
    {
        return "4333Mhz";
    }else if (ram_speed_int == 26)
    {
        return "4400Mhz";
    }else if (ram_speed_int == 27)
    {
        return "4500Mhz";
    }else if (ram_speed_int == 28)
    {
        return "4600Mhz";
    }else if (ram_speed_int == 29)
    {
        return "4700Mhz";
    }else if (ram_speed_int == 30)
    {
        return "4800Mhz";
    }else
    {
        return "";
    }

}

QString compare_componant::storage_type_int_to_str(int storage_type_int)
{
    if (storage_type_int == 0)
    {
        return "HDD";

    }else if (storage_type_int == 1)
    {
        return "SSD";

    }else if (storage_type_int == 2)
    {
        return "M_2";
    }else
    {
        return "";
    }

}

QString compare_componant::storage_capacity_int_to_str(int storage_capacity_int)
{
    if (storage_capacity_int == 0)
    {
        return "120GB";

    }else if (storage_capacity_int == 1)
    {
        return "250GB";

    }else if (storage_capacity_int == 2)
    {
        return "500GB";

    }else if (storage_capacity_int == 3)
    {
        return "1TB";

    }else if (storage_capacity_int == 4)
    {
        return "2TB";

    }else if (storage_capacity_int == 5)
    {
        return "4TB";

    }else if (storage_capacity_int == 6)
    {
        return "8TB";

    }else
    {
        return "";
    }

}

QString compare_componant::gpu_bus_int_to_str(int gpu_bus_int)
{
    if (gpu_bus_int == 0)
    {
        return "PCIE 2.0 16x";

    }else if (gpu_bus_int == 1)
    {
        return "PCIE 2.0 8x";

    }else if (gpu_bus_int == 2)
    {
        return "PCIE 2.0 4x";
    }else if (gpu_bus_int == 3)
    {
        return "PCIE 2.0 1x";
    }else if (gpu_bus_int == 4)
    {
        return "PCIE 3.0 16x";

    }else if (gpu_bus_int == 5)
    {
        return "PCIE 3.0 8x";

    }else if (gpu_bus_int == 6)
    {
        return "PCIE 3.0 4x";
    }else if (gpu_bus_int == 7)
    {
        return "PCIE 3.0 1x";
    }else
    {
        return "";
    }

}

QString compare_componant::gpu_power_cable_pin_int_to_str(int gpu_power_cable_pin_int)
{
    if (gpu_power_cable_pin_int == 0)
    {
        return "8 pin PCIe";

    }else if (gpu_power_cable_pin_int == 1)
    {
        return "2x8 pin PCIe";

    }else if (gpu_power_cable_pin_int == 2)
    {
        return "NONE";
    }else
    {
        return "";
    }

}

QString compare_componant::cooling_size_int_to_str(int cooling_size_int)
{
    if (cooling_size_int == 0)
    {
        return "120 mm";

    }else if (cooling_size_int == 1)
    {
        return "140 mm";

    }else if (cooling_size_int == 2)
    {
        return "240 mm";
    }else if (cooling_size_int == 3)
    {
        return "280 mm";
    }
    else if (cooling_size_int == 4)
    {
        return "360 mm";
    }else if (cooling_size_int == 5)
    {
        return "420 mm ";
    }else
    {
        return "";
    }

}

QString compare_componant::power_supply_W_int_to_str(int power_supply_W_int)
{
    if (power_supply_W_int == 0)
    {
        return "300W";

    }
    else if (power_supply_W_int == 1)
    {
        return "350W";

    }
    else if (power_supply_W_int == 2)
    {
        return "400W";
    }
    else if (power_supply_W_int == 3)
    {
        return "450W";
    }
    else if (power_supply_W_int == 4)
    {
        return "500W";
    }
    else if (power_supply_W_int == 5)
    {
        return "550W";
    }
    else if (power_supply_W_int == 6)
    {
        return "600W";
    }
    else if (power_supply_W_int == 7)
    {
        return "650W";
    }
    else if (power_supply_W_int == 8)
    {
        return "700W";
    }
    else if (power_supply_W_int == 9)
    {
        return "750W";
    }
    else if (power_supply_W_int == 10)
    {
        return "800W";
    }
    else if (power_supply_W_int == 11)
    {
        return "850W";
    }
    else if (power_supply_W_int == 12)
    {
        return "900W";
    }
    else if (power_supply_W_int == 13)
    {
        return "950W";
    }
    else if (power_supply_W_int == 14)
    {
        return "1000W";
    }
    else if (power_supply_W_int == 15)
    {
        return "1100W";
    }
    else if (power_supply_W_int == 16)
    {
        return "1200W";
    }
    else if (power_supply_W_int == 17)
    {
        return "1300W";
    }
    else if (power_supply_W_int == 18)
    {
        return "1400W";
    }
    else if (power_supply_W_int == 19)
    {
        return "1500W";
    }
    else if (power_supply_W_int == 20)
    {
        return "1600W";
    }


}

QString compare_componant::power_supply_standard_int_to_str(int power_supply_standard_int)
{
    if (power_supply_standard_int == 0)
    {
        return "plus 80";

    }
    else if (power_supply_standard_int == 1)
    {
        return "plus 80 bronze";

    }
    else if (power_supply_standard_int == 2)
    {
        return "plus 80 silver";
    }
    else if (power_supply_standard_int == 3)
    {
        return "plus 80 gold";
    }
    else if (power_supply_standard_int == 4)
    {
        return "plus 80 platinium";
    }
    else if (power_supply_standard_int == 5)
    {
        return "plus 80 titanium";
    }

}
