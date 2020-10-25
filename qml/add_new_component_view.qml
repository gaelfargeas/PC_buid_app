import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.13
import Create_item 1.0
import Main_class 1.0


Item {
    id: element
    width: 640
    height: 480

    property Main_class main_class_object

    Text {
        id: status_message_text
        x: 40
        y: 25
        width: 560
        height: 30
        text: qsTr("Text")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 18
        visible: false
    }

    Text {
        id: component_type_text
        x: 80
        y: 70
        width: 170
        height: 40
        text: qsTr("COMPONENT TYPE :")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 18
    }

    Create_item {
        id: create_item
    }

    ComboBox {
        id: component_type_comboBox
        x: 250
        y: 70
        currentIndex: 0
        model: ["computer case", "motherboard", "CPU", "cooling", "RAM", "GPU", "storage", "power supply"]

        onCurrentIndexChanged: {

            status_message_text.visible = false
            status_message_text.text = ""


            if (currentIndex == 0) {
                // computer case
                computer_case_rectangle.visible = true

                motherboard_rectangle.visible = false
                cpu_rectangle.visible = false
                cooling_rectangle.visible = false
                ram_rectangle.visible = false
                gpu_rectangle.visible = false
                storage_rectangle.visible = false
                power_supply_rectangle.visible = false
            } else if (currentIndex == 1) {
                //motherboard
                motherboard_rectangle.visible = true

                computer_case_rectangle.visible = false
                cpu_rectangle.visible = false
                cooling_rectangle.visible = false
                ram_rectangle.visible = false
                gpu_rectangle.visible = false
                storage_rectangle.visible = false
                power_supply_rectangle.visible = false
            } else if (currentIndex == 2) {
                //cpu
                cpu_rectangle.visible = true

                computer_case_rectangle.visible = false
                motherboard_rectangle.visible = false
                cooling_rectangle.visible = false
                ram_rectangle.visible = false
                gpu_rectangle.visible = false
                storage_rectangle.visible = false
                power_supply_rectangle.visible = false
            } else if (currentIndex == 3) {
                //cooling
                cooling_rectangle.visible = true

                computer_case_rectangle.visible = false
                motherboard_rectangle.visible = false
                cpu_rectangle.visible = false
                ram_rectangle.visible = false
                gpu_rectangle.visible = false
                storage_rectangle.visible = false
                power_supply_rectangle.visible = false
            } else if (currentIndex == 4) {
                //ram
                ram_rectangle.visible = true

                computer_case_rectangle.visible = false
                motherboard_rectangle.visible = false
                cpu_rectangle.visible = false
                cooling_rectangle.visible = false
                gpu_rectangle.visible = false
                storage_rectangle.visible = false
                power_supply_rectangle.visible = false
            } else if (currentIndex == 5) {
                //gpu
                gpu_rectangle.visible = true

                computer_case_rectangle.visible = false
                motherboard_rectangle.visible = false
                cpu_rectangle.visible = false
                cooling_rectangle.visible = false
                ram_rectangle.visible = false
                storage_rectangle.visible = false
                power_supply_rectangle.visible = false
            } else if (currentIndex == 6) {
                //storage
                storage_rectangle.visible = true

                computer_case_rectangle.visible = false
                motherboard_rectangle.visible = false
                cpu_rectangle.visible = false
                cooling_rectangle.visible = false
                ram_rectangle.visible = false
                gpu_rectangle.visible = false
                power_supply_rectangle.visible = false
            } else if (currentIndex == 7) {
                //power supply
                power_supply_rectangle.visible = true

                storage_rectangle.visible = false
                computer_case_rectangle.visible = false
                motherboard_rectangle.visible = false
                cpu_rectangle.visible = false
                cooling_rectangle.visible = false
                ram_rectangle.visible = false
                gpu_rectangle.visible = false
            }
        }
    }

    Button {
        id: create_componant_button
        x: 472
        y: 70
        text: qsTr("ADD")

        onClicked: {
            var i = 0 // index variable
            if (component_type_comboBox.currentText == "computer case") {
                // no empty field allowed
                if (computer_case_name_value.text !== ""
                        && computer_case_price_value.text !== ""
                        && computer_case_buy_link_value.text !== ""
                        && computer_case_image_link_value.text !== "")
                {

                    if ((computer_case_supported_motherboard_ATX.visible
                         || computer_case_supported_motherboard_E_ATX.visible
                         || computer_case_supported_motherboard_Micro_ATX.visible
                         || computer_case_supported_motherboard_Mini_ATX.visible) === true)
                    {
                        var tmp_str = ''

                        //get supported motherboard type
                        if (computer_case_supported_motherboard_ATX.visible == true) {
                            //0
                            tmp_str += "0"
                        }
                        if (computer_case_supported_motherboard_E_ATX.visible == true) {
                            //1
                            tmp_str += ",1"
                        }
                        if (computer_case_supported_motherboard_Micro_ATX.visible == true) {
                            //2
                            tmp_str += ",2"
                        }
                        if (computer_case_supported_motherboard_Mini_ATX.visible == true) {
                            //3
                            tmp_str += ",3"
                        }
                        create_item.create_case(
                                    computer_case_name_value.text, tmp_str,
                                    parseInt(computer_case_price_value.text),
                                    computer_case_buy_link_value.text,
                                    computer_case_image_link_value.text)

                        // reset value
                        computer_case_name_value.text = ""
                        computer_case_price_value.text = ""
                        computer_case_buy_link_value.text = ""
                        computer_case_image_link_value.text = ""
                        computer_case_supported_motherboard_ATX.visible = false
                        computer_case_supported_motherboard_E_ATX.visible = false
                        computer_case_supported_motherboard_Micro_ATX.visible = false
                        computer_case_supported_motherboard_Mini_ATX.visible = false

                        status_message_text.visible = true
                        status_message_text.text = "New Computer Case successfully added"
                    }
                    else
                    {
                        status_message_text.visible = true
                        status_message_text.text = "ERROR : Invalid field detected. Check all field please"
                    }
                } else
                {
                    status_message_text.visible = true
                    status_message_text.text = "ERROR : Empty field detected. Complete all field please"
                }
            }

            if (component_type_comboBox.currentText == "motherboard") {
                // no empty field allowed
                if (motherboard_name_value.text !== ""
                        && motherboard_RAM_slot_number_value.text !== ""
                        && motherboard_RAM_max_capacity_value.text !== ""
                        && motherboard_RAM_max_per_slot_value.text !== ""
                        && motherboard_pcie20_16x_slot_value.text !== ""
                        && motherboard_pcie20_8x_slot_value.text !== ""
                        && motherboard_pcie20_4x_slot_value.text !== ""
                        && motherboard_pcie20_1x_slot_value.text !== ""
                        && motherboard_pcie30_16x_slot_value.text != ""
                        && motherboard_pcie30_8x_slot_value.text != ""
                        && motherboard_pcie30_4x_slot_value.text != ""
                        && motherboard_pcie30_1x_slot_value.text != ""
                        && motherboard_sata_slot_value.text !== ""
                        && motherboard_m2_slot_value.text !== ""
                        && motherboard_price_value.text !== ""
                        && motherboard_buy_link_value.text !== ""
                        && motherboard_image_link_value.text !== "")
                {

                    // check if all field is correct
                    if (ram_speed_supported_text.text !== "Supported RAM speed : "
                            && parseInt(motherboard_RAM_max_capacity_value.text, 10) >= parseInt(motherboard_RAM_max_per_slot_value.text, 10)
                            ) {

                        var motherboard_ram_speed_supported = ''
                        for (i=0 ; i<listModel_motherboard_ram_speed_supported.count ; i++)
                        {
                            if (listModel_motherboard_ram_speed_supported.get(i).selected === true)
                            {
                                motherboard_ram_speed_supported += i + ","
                            }

                            listModel_motherboard_ram_speed_supported.set(i, { "selected": false })
                        }

                        create_item.create_motherboard(
                                    motherboard_name_value.text, motherboard_type_cbb.currentIndex,
                                    motherboard_CPU_socket_cbb.currentIndex, motherboard_CPU_chipset_cbb.currentIndex,
                                    motherboard_RAM_type_cbb.currentIndex, motherboard_ram_speed_supported,
                                    motherboard_RAM_slot_number_value.text, motherboard_RAM_max_capacity_value.text,
                                    motherboard_RAM_max_per_slot_value.text, motherboard_pcie20_16x_slot_value.text,
                                    motherboard_pcie20_8x_slot_value.text, motherboard_pcie20_4x_slot_value.text,
                                    motherboard_pcie20_1x_slot_value.text, motherboard_pcie30_16x_slot_value.text,
                                    motherboard_pcie30_8x_slot_value.text, motherboard_pcie30_4x_slot_value.text,
                                    motherboard_pcie30_1x_slot_value.text, motherboard_sata_slot_value.text,
                                    motherboard_m2_slot_value.text, motherboard_power_pin_cbb.currentIndex,
                                    motherboard_image_link_value.text,
                                    motherboard_price_value.text, motherboard_buy_link_value.text)

                        //reset value
                        motherboard_name_value.text = ""
                        motherboard_RAM_slot_number_value.text = ""
                        motherboard_RAM_max_capacity_value.text = ""
                        motherboard_RAM_max_per_slot_value.text = ""
                        motherboard_pcie20_16x_slot_value.text = ""
                        motherboard_pcie20_8x_slot_value.text = ""
                        motherboard_pcie20_4x_slot_value.text = ""
                        motherboard_pcie20_1x_slot_value.text = ""
                        motherboard_pcie30_16x_slot_value.text = ""
                        motherboard_pcie30_8x_slot_value.text = ""
                        motherboard_pcie30_4x_slot_value.text = ""
                        motherboard_pcie30_1x_slot_value.text = ""
                        motherboard_sata_slot_value.text = ""
                        motherboard_m2_slot_value.text = ""
                        motherboard_price_value.text = ""
                        motherboard_buy_link_value.text = ""
                        motherboard_image_link_value.text = ""

                        motherboard_type_cbb.currentIndex = 0
                        motherboard_CPU_chipset_cbb.currentIndex = 0
                        motherboard_RAM_type_cbb.currentIndex = 0
                        motherboard_CPU_socket_cbb.currentIndex = 0
                        motherboard_power_pin_cbb.currentIndex = 0

                        ram_speed_supported_text.text = "Supported RAM speed : "

                        status_message_text.visible = true
                        status_message_text.text = "New Motherboard successfully added"

                    }
                    else
                    {
                        status_message_text.visible = true
                        status_message_text.text = "ERROR : Invalid field detected. Check all field please"
                    }
                } else
                {
                    status_message_text.visible = true
                    status_message_text.text = "ERROR : Empty field detected. Complete all field please"
                }
            }

            if (component_type_comboBox.currentText == "CPU") {

                // no empty field allowed
                if (cpu_name_value.text !== ""
                        && cpu_clock_speed_value.text !== ""
                        && cpu_boosted_speed_value.text !== ""
                        && cpu_core_value.text !== ""
                        && cpu_thread_value.text !== ""
                        && cpu_cache_L3_value.text !== ""
                        && cpu_TDP_value.text !== ""
                        && cpu_price_value.text !== ""
                        && cpu_buy_link_value.text !== ""
                        && cpu_image_link_value.text !== "") {

                    // check if all field is correct
                    if (cpu_supported_chipset_text.text !== "Supported Chipset : "
                            && parseInt(cpu_clock_speed_value.text, 10) <  parseInt(cpu_boosted_speed_value.text, 10)
                            && parseInt(cpu_thread_value.text, 10) >= parseInt(cpu_core_value.text, 10)

                            ) {

                        var CPU_chipset_supported = ''
                        for (i=0 ; i<listModel_cpu_supported_chipset.count ; i++)
                        {
                            if (listModel_cpu_supported_chipset.get(i).selected === true)
                            {
                                CPU_chipset_supported += i + ","
                            }

                            listModel_cpu_supported_chipset.set(i, { "selected": false })
                        }

                        create_item.create_CPU(
                                    cpu_name_value.text, cpu_socket_cbb.currentIndex,
                                    CPU_chipset_supported, cpu_clock_speed_value.text,
                                    cpu_boosted_speed_value.text, cpu_cache_L3_value.text,
                                    cpu_core_value.text, cpu_thread_value.text,
                                    cpu_TDP_value.text, cpu_RAM_type_cbb.currentIndex,
                                    cpu_RAM_speed_cbb.currentIndex, cpu_image_link_value.text,
                                    cpu_price_value.text, cpu_buy_link_value.text)

                        //reset value
                        cpu_name_value.text = ""
                        cpu_clock_speed_value.text = ""
                        cpu_boosted_speed_value.text = ""
                        cpu_core_value.text = ""
                        cpu_thread_value.text = ""
                        cpu_cache_L3_value.text = ""
                        cpu_TDP_value.text = ""
                        cpu_price_value.text = ""
                        cpu_buy_link_value.text = ""
                        cpu_image_link_value.text = ""

                        cpu_socket_cbb.currentIndex = 0
                        cpu_RAM_type_cbb.currentIndex = 0
                        cpu_RAM_speed_cbb.currentIndex = 0

                        cpu_supported_chipset_text.text = "Supported Chipset : "

                        status_message_text.visible = true
                        status_message_text.text = "New CPU successfully added"
                    }
                    else
                    {
                        status_message_text.visible = true
                        status_message_text.text = "ERROR : Invalid field detected. Check all field please"
                    }
                } else
                {
                    status_message_text.visible = true
                    status_message_text.text = "ERROR : Empty field detected. Complete all field please"
                }
            }

            if (component_type_comboBox.currentText == "cooling") {
                // no empty field allowed
                if (cooling_name_value.text !== ""
                        && cooling_fan_min_sound_value.text !== ""
                        && cooling_fan_max_sound_value.text !== ""
                        && cooling_fan_min_speed_value.text !== ""
                        && cooling_fan_max_speed_value.text !== ""
                        && cooling_air_flow_value.text !== ""
                        && cooling_price_value.text !== ""
                        && cooling_buy_link_value.text !== ""
                        && cooling_image_link_value.text !== "") {

                    // check if all field is correct
                    if (cooling_supported_socket_text.text !== "Supported Socket : "
                            && parseInt(cooling_fan_max_sound_value.text, 10) >= parseInt(cooling_fan_min_sound_value.text, 10)
                            && parseInt(cooling_fan_max_speed_value.text, 10) >= parseInt(cooling_fan_min_speed_value.text, 10)
                            ) {

                        var cooling_socket_supported = ''
                        for (i=0 ; i<listModel_cooling_supported_socket.count ; i++)
                        {
                            if (listModel_cooling_supported_socket.get(i).selected === true)
                            {
                                cooling_socket_supported += i + ","

                            }

                            listModel_cooling_supported_socket.set(i, { "selected": false })
                        }


                        create_item.create_cooling(
                                    cooling_name_value.text,
                                    cooling_socket_supported,
                                    cooling_fan_size_cbb.currentIndex,
                                    cooling_fan_min_sound_value.text,
                                    cooling_fan_max_sound_value.text,
                                    cooling_fan_min_speed_value.text,
                                    cooling_fan_max_speed_value.text,
                                    cooling_air_flow_value.text,
                                    cooling_image_link_value.text,
                                    cooling_price_value.text,
                                    cooling_buy_link_value.text)

                        //reset value
                        cooling_name_value.text = ""
                        cooling_fan_min_sound_value.text = ""
                        cooling_fan_max_sound_value.text = ""
                        cooling_fan_min_speed_value.text = ""
                        cooling_fan_max_speed_value.text = ""
                        cooling_air_flow_value.text = ""
                        cooling_buy_link_value.text = ""
                        cooling_price_value.text = ""
                        cooling_image_link_value.text = ""

                        cooling_fan_size_cbb.currentIndex = 0

                        cooling_supported_socket_text.text = "Supported Socket : "

                        status_message_text.visible = true
                        status_message_text.text = "New Cooling successfully added"

                    }
                    else
                    {
                        status_message_text.visible = true
                        status_message_text.text = "ERROR : Invalid field detected. Check all field please"
                    }
                } else
                {
                    status_message_text.visible = true
                    status_message_text.text = "ERROR : Empty field detected. Complete all field please"
                }
            }

            if (component_type_comboBox.currentText == "RAM") {
                // no empty field allowed
                if (ram_name_value.text !== ""
                        && ram_memory_size_value.text !== ""
                        && ram_price_value.text !== ""
                        && ram_module_number_value.text !== ""
                        && ram_buy_link_value.text !== ""
                        && ram_image_link_value.text !== "") {

                    //les 2 truck (cpu socket et ram speed supported) ont des valeurs
                    if (true) {

                        create_item.create_RAM(
                                    ram_name_value.text,
                                    ram_memory_type_cbb.currentIndex,
                                    ram_memory_size_value.text,
                                    ram_memory_speed_cbb.currentIndex,
                                    ram_image_link_value.text,
                                    ram_cas_latency_cbb.currentIndex,
                                    ram_module_number_value.text,
                                    ram_price_value.text,
                                    ram_buy_link_value.text)

                        //reset value
                        ram_name_value.text = ""
                        ram_memory_size_value.text = ""
                        ram_module_number_value.text = ""
                        ram_price_value.text = ""
                        ram_buy_link_value.text = ""
                        ram_image_link_value.text = ""

                        ram_memory_speed_cbb.currentIndex = 0
                        ram_memory_type_cbb.currentIndex = 0
                        ram_cas_latency_cbb.currentIndex = 0

                        status_message_text.visible = true
                        status_message_text.text = "New RAM successfully added"
                    }
                    else
                    {
                        status_message_text.visible = true
                        status_message_text.text = "ERROR : Invalid field detected. Check all field please"
                    }
                } else
                {
                    status_message_text.visible = true
                    status_message_text.text = "ERROR : Empty field detected. Complete all field please"
                }
            }

            if (component_type_comboBox.currentText == "GPU") {
                // no empty field allowed
                if (gpu_name_value.text !== ""
                        && gpu_clock_value.text !== ""
                        && gpu_boosted_clock_value.text !== ""
                        && gpu_core_value.text !== ""
                        && gpu_ram_size_value.text !== ""
                        && gpu_ram_speed_value.text !== ""
                        && gpu_flux_value.text !== ""
                        && gpu_power_consumption_value.text !== ""
                        && gpu_price_value.text !== ""
                        && gpu_image_link_value.text !== ""
                        && gpu_buy_link_value.text !== "") {


                    if(parseInt(gpu_boosted_clock_value.text, 10) >= parseInt(gpu_clock_value.text, 10))
                    {

                        create_item.create_GPU(
                                    gpu_name_value.text, gpu_clock_value.text,
                                    gpu_boosted_clock_value.text, gpu_core_value.text,
                                    gpu_bus_cbb.currentIndex, gpu_RAM_type_cbb.currentIndex,
                                    gpu_ram_size_value.text, gpu_ram_speed_value.text,
                                    gpu_flux_value.text, gpu_power_consumption_value.text,
                                    gpu_power_cable_pin_cbb.currentIndex, gpu_image_link_value.text,
                                    gpu_price_value.text, gpu_buy_link_value.text)

                        //reset value
                        gpu_name_value.text = ""
                        gpu_clock_value.text = ""
                        gpu_boosted_clock_value.text = ""
                        gpu_core_value.text = ""
                        gpu_ram_size_value.text = ""
                        gpu_ram_speed_value.text = ""
                        gpu_flux_value.text = ""
                        gpu_power_consumption_value.text = ""
                        gpu_price_value.text = ""
                        gpu_image_link_value.text = ""
                        gpu_buy_link_value.text = ""

                        gpu_bus_cbb.currentIndex = 0
                        gpu_RAM_type_cbb.currentIndex = 0
                        gpu_power_cable_pin_cbb.currentIndex = 0

                        status_message_text.visible = true
                        status_message_text.text = "New GPU successfully added"

                    }
                    else
                    {
                        status_message_text.visible = true
                        status_message_text.text = "ERROR : Invalid field detected. Check all field please"
                    }
                } else
                {
                    status_message_text.visible = true
                    status_message_text.text = "ERROR : Empty field detected. Complete all field please"
                }
            }

            if (component_type_comboBox.currentText == "storage") {
                // no empty field allowed
                if (storage_name_value.text !== ""
                        && storage_read_speed_value.text !== ""
                        && storage_write_speed_value.text !== ""
                        && storage_capacity_value.text !== ""
                        && storage_hdd_spindle_speed_value.text !== ""
                        && storage_price_value.text !== ""
                        && storage_buy_link_value.text !== ""
                        && storage_image_link_value.text !== "") {

                    create_item.create_storage(
                                storage_name_value.text,
                                storage_read_speed_value.text,
                                storage_write_speed_value.text,
                                storage_type_cbb.currentIndex,
                                storage_capacity_value.text,
                                storage_hdd_spindle_speed_value.text,
                                storage_image_link_value.text,
                                storage_price_value.text,
                                storage_buy_link_value.text)

                    //reset value
                    storage_name_value.text = ""
                    storage_capacity_value.text = ""
                    storage_hdd_spindle_speed_value.text = ""
                    storage_price_value.text = ""
                    storage_buy_link_value.text = ""
                    storage_image_link_value.text = ""
                    storage_read_speed_value.text = ""
                    storage_write_speed_value.text = ""

                    storage_type_cbb.currentIndex = 0

                    status_message_text.visible = true
                    status_message_text.text = "New Storage successfully added"

                } else
                {
                    status_message_text.visible = true
                    status_message_text.text = "ERROR : Empty field detected. Complete all field please"
                }
            }

            if (component_type_comboBox.currentText == "power supply") {
                // no empty field allowed
                if (power_supply_name_value.text !== ""
                        && power_supply_ATX24_value.text !== ""
                        && power_supply_molex4_value.text !== ""
                        && power_supply_ATX_4_value.text !== ""
                        && power_supply_pcie6_2_value.text !== ""
                        && power_supply_sata_power_cable_value.text !== ""
                        && power_supply_price_value.text !== ""
                        && power_supply_buy_link_value.text !== ""
                        && power_supply_image_link_value.text !== "") {

                    create_item.create_power_supply(power_supply_name_value.text, power_supply_standard_cbb.currentIndex,
                                                    power_supply_power_cbb.currentIndex, power_supply_sata_power_cable_value.text,
                                                    power_supply_pcie6_2_value.text, power_supply_ATX24_value.text,
                                                    power_supply_ATX_4_value.text, power_supply_molex4_value.text,
                                                    power_supply_image_link_value.text, power_supply_price_value.text,
                                                    power_supply_buy_link_value.text)

                    //reset value
                    power_supply_name_value.text = ""
                    power_supply_ATX24_value.text = ""
                    power_supply_molex4_value.text = ""
                    power_supply_ATX_4_value.text = ""
                    power_supply_pcie6_2_value.text = ""
                    power_supply_sata_power_cable_value.text = ""
                    power_supply_POWER_value.text = ""
                    power_supply_price_value.text = ""
                    power_supply_buy_link_value.text = ""
                    power_supply_image_link_value.text = ""

                    power_supply_standard_cbb.currentIndex = 0

                    status_message_text.visible = true
                    status_message_text.text = "New Power Supply successfully added"

                } else
                {
                    status_message_text.visible = true
                    status_message_text.text = "ERROR : Empty field detected. Complete all field please"
                }
            }

            main_class_object.refresh_list()
        }
    }

    Item {
        id: computer_case_rectangle
        y: 140
        height: 340
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        visible: true

        Text {
            id: computer_case_name_text
            x: 150
            y: 0
            width: 60
            height: 20
            text: qsTr("name :")
            font.pixelSize: 18
        }
        TextInput {
            id: computer_case_name_value
            x: 210
            width: 412
            height: 20
            text: qsTr("")
            font.pixelSize: 18
        }

        Text {
            id: computer_case_supported_motherboard_format_text
            x: 110
            y: 64
            width: 340
            height: 20
            text: qsTr("SUPPORTED MOTHERBOARD FORMAT :")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        ComboBox {
            id: computer_case_supported_motherboard_cbb
            x: 50
            y: 90
            model: ["ATX", "E_ATX", "Micro_ATX", "Mini_ATX"]
        }
        Button {
            id: computer_case_supported_motherboard_button
            x: 200
            y: 90
            text: qsTr("ADD")
            font.pointSize: 18
            onClicked: {

                if (computer_case_supported_motherboard_cbb.currentText == "ATX") {
                    computer_case_supported_motherboard_ATX.visible
                            = !computer_case_supported_motherboard_ATX.visible
                } else if (computer_case_supported_motherboard_cbb.currentText == "E_ATX") {
                    computer_case_supported_motherboard_E_ATX.visible
                            = !computer_case_supported_motherboard_E_ATX.visible
                } else if (computer_case_supported_motherboard_cbb.currentText == "Micro_ATX") {
                    computer_case_supported_motherboard_Micro_ATX.visible
                            = !computer_case_supported_motherboard_Micro_ATX.visible
                } else if (computer_case_supported_motherboard_cbb.currentText == "Mini_ATX") {
                    computer_case_supported_motherboard_Mini_ATX.visible
                            = !computer_case_supported_motherboard_Mini_ATX.visible
                }
            }
        }

        Text {
            id: computer_case_supported_motherboard_ATX
            x: 300
            y: 90
            width: 60
            height: 40
            text: qsTr("ATX")
            visible: false
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            leftPadding: 0
            font.pixelSize: 22
        }
        Text {
            id: computer_case_supported_motherboard_E_ATX
            x: 350
            y: 90
            width: 80
            height: 40
            text: qsTr("E_ATX")
            visible: false
            verticalAlignment: Text.AlignVCenter
            leftPadding: 0
            font.pixelSize: 22
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: computer_case_supported_motherboard_Mini_ATX
            x: 530
            y: 90
            width: 120
            height: 40
            text: qsTr("Mini_ATX")
            visible: false
            verticalAlignment: Text.AlignVCenter
            leftPadding: 0
            font.pixelSize: 22
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: computer_case_supported_motherboard_Micro_ATX
            x: 420
            y: 90
            width: 120
            height: 40
            text: qsTr("Micro_ATX")
            visible: false
            verticalAlignment: Text.AlignVCenter
            leftPadding: 0
            font.pixelSize: 22
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: computer_case_price_text
            x: 40
            y: 240
            text: qsTr("PRICE :")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        TextInput {
            id: computer_case_price_value
            x: 101
            y: 240
            width: 129
            height: 22
            text: ""
            maximumLength: 7
            layer.enabled: true
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+\.[0-9]+/
            }
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }

        Text {
            id: computer_case_price_text_euro
            x: 230
            y: 240
            width: 50
            text: qsTr("euro")
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: computer_case_buy_link_text
            x: 40
            y: 270
            height: 20
            text: qsTr("Buy link :")
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
        }
        TextInput {
            id: computer_case_buy_link_value
            x: 120
            y: 270
            width: 502
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: computer_case_image_link_text
            x: 40
            y: 300
            height: 20
            text: qsTr("Image link :")
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
        }
        TextInput {
            id: computer_case_image_link_value
            x: 140
            y: 300
            width: 482
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }
    }

    Item {
        id: motherboard_rectangle
        y: 140
        height: 340
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottomMargin: 0
        visible: false

        Text {
            id: motherboard_name_text
            x: 150
            y: 0
            width: 60
            height: 20
            text: qsTr("name :")
            font.pixelSize: 18
        }
        TextInput {
            id: motherboard_name_value
            x: 210
            width: 412
            height: 20
            text: qsTr("")
            font.pixelSize: 18
        }

        Text {
            id: motherboard_type_text
            x: 40
            y: 30
            width: 140
            height: 20
            text: qsTr("Motherboard size")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        ComboBox {
            id: motherboard_type_cbb
            x: 40
            y: 60
            model: ["ATX", "E_ATX", "Micro_ATX", "Mini_ATX"]
        }

        Text {
            id: motherboard_CPU_chipset_text
            x: 200
            y: 30
            width: 120
            height: 20
            text: qsTr("CPU chipset")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        ComboBox {
            id: motherboard_CPU_chipset_cbb
            x: 200
            y: 60
            width: 120
            model: ["AMD_A68H", "AMD_760G", "AMD_B350", "AMD_B450", "AMD_X399", "Intel_H110", "Intel_H270", "Intel_H310", "Intel_H370", "Intel_B150", "Intel_B250", "Intel_B360", "Intel_B365", "Intel_Z170", "Intel_Z270", "Intel_Z370", "Intel_Z390", "Intel_X99", "Intel_X299"]
        }

        Text {
            id: motherboard_RAM_type_text
            x: 340
            y: 30
            width: 120
            height: 20
            text: qsTr("RAM type")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        ComboBox {
            id: motherboard_RAM_type_cbb
            x: 340
            y: 60
            width: 120
            model: ["DDR3", "DDR4", "GDDR5", "GDDR5X", "GDDR6"]
        }

        Text {
            id: motherboard_CPU_socket_text
            x: 480
            y: 30
            width: 120
            height: 20
            text: qsTr("CPU socket")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        ComboBox {
            id: motherboard_CPU_socket_cbb
            x: 480
            y: 60
            width: 120
            model: ["AMD_AM2", "AMD_AM2_plus", "AMD_AM3", "AMD_AM3_plus", "AMD_AM4", "AMD_SP3", "AMD_sTR4", "AMD_sTRx4", "LGA_1150", "LGA_1151", "LGA_1155",
                "LGA_1156", "LGA_1366", "LGA_2011", "LGA_2011_v3", "LGA_2066"]
        }

        Text {
            id: motherboard_RAM_slot_number_text
            x: 40
            y: 180
            height: 20
            text: qsTr("RAM slot :")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        TextInput {
            id: motherboard_RAM_slot_number_value
            x: 122
            y: 180
            width: 30
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            maximumLength: 2
            layer.enabled: true
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
        }

        Text {
            id: motherboard_RAM_max_capacity_text
            x: 200
            y: 180
            width: 90
            height: 20
            text: qsTr("MAX RAM :")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        TextInput {
            id: motherboard_RAM_max_capacity_value
            x: 290
            y: 180
            width: 40
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            maximumLength: 3
            layer.enabled: true
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
        }
        Text {
            id: motherboard_RAM_max_capacity_Go_text
            x: 330
            y: 180
            width: 25
            height: 20
            text: qsTr("Go")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: motherboard_RAM_max_per_slot_text
            x: 400
            y: 180
            height: 20
            text: qsTr("MAX RAM per slot :")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        TextInput {
            id: motherboard_RAM_max_per_slot_value
            x: 554
            y: 180
            width: 40
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            maximumLength: 3
            layer.enabled: true
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
        }
        Text {
            id: motherboard_RAM_max_per_slot_Go_text
            x: 594
            y: 180
            height: 20
            text: qsTr("Go")
            font.pixelSize: 18
        }

        Text {
            id: motherboard_pcie20_slot_text
            x: 40
            y: 210
            height: 20
            text: qsTr("PCIE 2.0 :")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        TextInput {
            id: motherboard_pcie20_16x_slot_value
            x: 121
            y: 210
            width: 30
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            maximumLength: 1
            layer.enabled: true
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
        }
        Text {
            id: motherboard_pcie20_16x_slot_text
            x: 151
            y: 210
            height: 20
            text: qsTr("16x ")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        TextInput {
            id: motherboard_pcie20_8x_slot_value
            x: 190
            y: 210
            width: 30
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            maximumLength: 1
            layer.enabled: true
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
        }
        Text {
            id: motherboard_pcie20_8x_slot_text
            x: 220
            y: 210
            height: 20
            text: qsTr("8x")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        TextInput {
            id: motherboard_pcie20_4x_slot_value
            x: 250
            y: 210
            width: 30
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            maximumLength: 1
            layer.enabled: true
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
        }
        Text {
            id: motherboard_pcie20_4x_slot_text
            x: 280
            y: 210
            height: 20
            text: qsTr("4x")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        TextInput {
            id: motherboard_pcie20_1x_slot_value
            x: 310
            y: 210
            width: 30
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            maximumLength: 1
            layer.enabled: true
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
        }
        Text {
            id: motherboard_pcie20_1x_slot_text
            x: 340
            y: 210
            height: 20
            text: qsTr("1x")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }

        Text {
            id: motherboard_sata_slot_text
            x: 380
            y: 210
            height: 20
            text: qsTr("SATA slot :")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        TextInput {
            id: motherboard_sata_slot_value
            x: 470
            y: 210
            width: 30
            height: 20
            text: qsTr("")
            maximumLength: 2
            layer.enabled: true
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }

        Text {
            id: motherboard_m2_slot_text
            x: 520
            y: 210
            height: 20
            text: qsTr("M.2 slot :")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        TextInput {
            id: motherboard_m2_slot_value
            x: 595
            y: 210
            width: 30
            height: 20
            text: qsTr("")
            maximumLength: 1
            layer.enabled: true
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }

        Text {
            id: motherboard_pcie30_slot_text
            x: 40
            y: 240
            height: 20
            text: qsTr("PCIE 3.0 :")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        TextInput {
            id: motherboard_pcie30_16x_slot_value
            x: 121
            y: 240
            width: 30
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            maximumLength: 1
            layer.enabled: true
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
        }
        Text {
            id: motherboard_pcie30_16x_slot_text
            x: 151
            y: 240
            height: 20
            text: qsTr("16x ")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        TextInput {
            id: motherboard_pcie30_8x_slot_value
            x: 190
            y: 240
            width: 30
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            maximumLength: 1
            layer.enabled: true
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
        }
        Text {
            id: motherboard_pcie30_8x_slot_text
            x: 220
            y: 240
            height: 20
            text: qsTr("8x")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        TextInput {
            id: motherboard_pcie30_4x_slot_value
            x: 250
            y: 240
            width: 30
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            maximumLength: 1
            layer.enabled: true
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
        }
        Text {
            id: motherboard_pcie30_4x_slot_text
            x: 280
            y: 240
            height: 20
            text: qsTr("4x")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        TextInput {
            id: motherboard_pcie30_1x_slot_value
            x: 310
            y: 240
            width: 30
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            maximumLength: 1
            layer.enabled: true
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
        }
        Text {
            id: motherboard_pcie30_1x_slot_text
            x: 340
            y: 240
            height: 20
            text: qsTr("1x")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }

        Text {
            id: motherboard_price_text
            x: 400
            y: 240
            width: 60
            height: 20
            text: qsTr("PRICE :")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        TextInput {
            id: motherboard_price_value
            x: 460
            y: 240
            width: 90
            height: 20
            text: qsTr("")
            maximumLength: 7
            layer.enabled: true
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+\.[0-9]+/
            }
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }

        Text {
            id: motherboard_buy_link_text
            x: 40
            y: 270
            height: 20
            text: qsTr("Buy link :")
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
        }
        TextInput {
            id: motherboard_buy_link_value
            x: 120
            y: 270
            width: 502
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: motherboard_image_link_text
            x: 40
            y: 300
            height: 20
            text: qsTr("Image link :")
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
        }
        TextInput {
            id: motherboard_image_link_value
            x: 140
            y: 300
            width: 482
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }


        Text {
            id: motherboard_power_pin_text
            x: 40
            y: 105
            width: 120
            height: 20
            text: qsTr("POWER PIN")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        ComboBox {
            id: motherboard_power_pin_cbb
            x: 40
            y: 130
            width: 120
            model: ["ATX 4 Pin", "ATX 4+4 Pin"]
        }



        Text {
            id: ram_speed_supported_text
            x: 180
            y: 120
            width: 440
            height: 50
            text: qsTr("Supported RAM speed : ")
            font.pixelSize: 18
            wrapMode: Text.WordWrap


            MouseArea{
                anchors.fill: parent

                onClicked: {
                    motherboard_ram_speed_supported_rectangle.visible = true
                }
            }
        }
        Rectangle
        {
            id : motherboard_ram_speed_supported_rectangle
            anchors.fill: parent
            visible: false

            Button{
                id: motherboard_ram_speed_supported_button
                x: 30
                y: 100
                width: 100
                height: 50
                text: qsTr("VALID")

                onClicked:
                {
                    ram_speed_supported_text.text = "Supported RAM speed : "

                    for (var i=0 ; i<listModel_motherboard_ram_speed_supported.count ; i++)
                    {
                        if (listModel_motherboard_ram_speed_supported.get(i).selected === true)
                        {
                            ram_speed_supported_text.text += listModel_motherboard_ram_speed_supported.get(i).name
                            ram_speed_supported_text.text += " , "
                        }

                    }

                    if(ram_speed_supported_text.text !== "Supported RAM speed : " )
                    {
                        ram_speed_supported_text.text = ram_speed_supported_text.text.substring(0, ram_speed_supported_text.text.length - 3)
                    }
                    motherboard_ram_speed_supported_rectangle.visible = false

                }
            }

            ListView {
                id: listView_ram_speed_supported

                width: 320
                anchors.leftMargin: 160
                anchors.rightMargin: 160
                anchors.fill: parent
                focus: true
                clip: true
                model: listModel_motherboard_ram_speed_supported
                delegate: listDelegate_motherboard_ram_speed_supported

                boundsMovement: Flickable.StopAtBounds

                ScrollBar.vertical: ScrollBar {
                    policy: ScrollBar.AlwaysOn
                }

            }
        }
        ListModel {
            id: listModel_motherboard_ram_speed_supported



            ListElement {
                name: "1066Mhz"
                selected: false
            }
            ListElement {
                name: "1333Mhz"
                selected: false
            }
            ListElement {
                name: "1600Mhz"
                selected: false
            }
            ListElement {
                name: "1866Mhz"
                selected: false
            }
            ListElement {
                name: "2133Mhz"
                selected: false
            }
            ListElement {
                name: "2400Mhz"
                selected: false
            }
            ListElement {
                name: "2666Mhz"
                selected: false
            }
            ListElement {
                name: "2800Mhz"
                selected: false
            }
            ListElement {
                name: "2933Mhz"
                selected: false
            }
            ListElement {
                name: "3000Mhz"
                selected: false
            }
            ListElement {
                name: "3200Mhz"
                selected: false
            }
            ListElement {
                name: "3300Mhz"
                selected: false
            }
            ListElement {
                name: "3333Mhz"
                selected: false
            }
            ListElement {
                name: "3400Mhz"
                selected: false
            }
            ListElement {
                name: "3466Mhz"
                selected: false
            }
            ListElement {
                name: "3600Mhz"
                selected: false
            }
            ListElement {
                name: "3666Mhz"
                selected: false
            }
            ListElement {
                name: "3733Mhz"
                selected: false
            }
            ListElement {
                name: "3800Mhz"
                selected: false
            }
            ListElement {
                name: "3866Mhz"
                selected: false
            }
            ListElement {
                name: "4000Mhz"
                selected: false
            }
            ListElement {
                name: "4133Mhz"
                selected: false
            }
            ListElement {
                name: "4200Mhz"
                selected: false
            }
            ListElement {
                name: "4266Mhz"
                selected: false
            }
            ListElement {
                name: "4300Mhz"
                selected: false
            }
            ListElement {
                name: "4333Mhz"
                selected: false
            }
            ListElement {
                name: "4400Mhz"
                selected: false
            }
            ListElement {
                name: "4500Mhz"
                selected: false
            }
            ListElement {
                name: "4600Mhz"
                selected: false
            }
            ListElement {
                name: "4700Mhz"
                selected: false
            }
            ListElement {
                name: "4800Mhz"
                selected: false
            }

        }
        Component {
            id: listDelegate_motherboard_ram_speed_supported

            BorderImage {
                id: background_image_listDelegate
                width: 320
                height: 50
                source: "../images/image_listDelegate.png"

                Text {
                    id: listDelegate_text
                    text: name
                    font.pixelSize: 18
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    width: 270
                    height: 50

                }

                CheckBox {
                    id: checkbox
                    checked: selected
                    x: listDelegate_text.x + listDelegate_text.width
                    onClicked: listModel_motherboard_ram_speed_supported.set(index, { "selected": checkbox.checked })
                }


            }
        }

    }

    Item {
        id: cpu_rectangle
        y: 140
        height: 340
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottomMargin: 0
        visible: false

        Text {
            id: cpu_name_text
            x: 150
            y: 0
            width: 60
            height: 20
            text: qsTr("name :")
            font.pixelSize: 18
        }
        TextInput {
            id: cpu_name_value
            x: 210
            width: 412
            height: 20
            text: qsTr("")
            font.pixelSize: 18
        }

        Text {
            id: cpu_socket_text
            x: 60
            y: 30
            width: 140
            height: 20
            text: qsTr("SOCKET")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        ComboBox {
            id: cpu_socket_cbb
            x: 60
            y: 60
            model: ["AMD_AM2", "AMD_AM2_plus", "AMD_AM3", "AMD_AM3_plus", "AMD_AM4", "AMD_SP3", "AMD_sTR4", "AMD_sTRx4", "LGA_1150", "LGA_1151", "LGA_1155",
                "LGA_1156", "LGA_1366", "LGA_2011", "LGA_2011_v3", "LGA_2066"]
        }

        Text {
            id: cpu_RAM_speed_text
            x: 240
            y: 30
            width: 140
            height: 20
            text: qsTr("Max RAM Speed")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        ComboBox {
            id: cpu_RAM_speed_cbb
            x: 240
            y: 60
            width: 140
            height: 40
            model: ["1066 Mhz","1333 Mhz","1600 Mhz","1866 Mhz","2133 Mhz","2400 Mhz","2666 Mhz","2800 Mhz",
                "2933 Mhz","3000 Mhz","3200 Mhz","3300 Mhz","3333 Mhz","3400 Mhz","3466 Mhz","3600 Mhz",
                "3666 Mhz","3733 Mhz","3800 Mhz","3866 Mhz","4000 Mhz","4133 Mhz","4200 Mhz","4266 Mhz",
                "4300 Mhz","4333 Mhz","4400 Mhz","4500 Mhz","4600 Mhz","4700 Mhz","4800 Mhz"]
        }

        Text {
            id: cpu_RAM_type_text
            x: 420
            y: 30
            width: 140
            height: 20
            text: qsTr("RAM type")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        ComboBox {
            id: cpu_RAM_type_cbb
            x: 420
            y: 60
            model: ["DDR3", "DDR4", "GDDR5", "GDDR5X", "GDDR6"]
        }


        Text {
            id: cpu_clock_speed_text
            x: 80
            y: 180
            width: 100
            height: 20
            text: qsTr("CLK Speed :")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
        }
        TextInput {
            id: cpu_clock_speed_value
            x: 180
            y: 180
            width: 50
            height: 20
            text: qsTr("")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            layer.enabled: true
            maximumLength: 5
        }
        Text {
            id: cpu_clock_speed_Mhz_text
            x: 230
            y: 180
            width: 35
            height: 20
            text: qsTr("Mhz")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: cpu_boosted_speed_text
            x: 380
            y: 180
            width: 130
            height: 20
            text: qsTr("Boosted speed :")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
        }
        TextInput {
            id: cpu_boosted_speed_value
            x: 510
            y: 180
            width: 50
            height: 20
            text: qsTr("")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            layer.enabled: true
            maximumLength: 5
        }
        Text {
            id: cpu_boosted_speed_Mhz_text
            x: 560
            y: 180
            width: 35
            height: 20
            text: qsTr("Mhz")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: cpu_core_text
            x: 80
            y: 210
            width: 60
            height: 20
            text: qsTr("CORE :")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
        }
        TextInput {
            id: cpu_core_value
            x: 140
            y: 210
            width: 30
            height: 20
            text: qsTr("")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            layer.enabled: true
            maximumLength: 2
        }

        Text {
            id: cpu_thread_text
            x: 380
            y: 210
            width: 80
            height: 20
            text: qsTr("THREAD :")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
        }
        TextInput {
            id: cpu_thread_value
            x: 460
            y: 210
            width: 30
            height: 20
            text: qsTr("")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            layer.enabled: true
            maximumLength: 2
        }

        Text {
            id: cpu_cache_L3_text
            x: 40
            y: 240
            height: 20
            text: qsTr("CACHE L3 :")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
        }
        TextInput {
            id: cpu_cache_L3_value
            x: 132
            y: 240
            width: 40
            height: 20
            text: qsTr("")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            layer.enabled: true
            maximumLength: 3
        }
        Text {
            id: cpu_cache_L3_MB_text
            x: 172
            y: 240
            height: 20
            text: qsTr("MB")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: cpu_TDP_text
            x: 245
            y: 240
            height: 20
            text: qsTr("TDP :")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
        }
        TextInput {
            id: cpu_TDP_value
            x: 290
            y: 240
            width: 40
            height: 20
            text: qsTr("")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            layer.enabled: true
            maximumLength: 3
        }
        Text {
            id: cpu_TDP_W_text
            x: 330
            y: 240
            height: 20
            text: qsTr("W")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: cpu_price_text
            x: 380
            y: 240
            width: 60
            height: 20
            text: qsTr("PRICE :")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
        }
        TextInput {
            id: cpu_price_value
            x: 440
            y: 240
            width: 90
            height: 20
            text: qsTr("")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+\.[0-9]+/
            }
            layer.enabled: true
            maximumLength: 7
        }

        Text {
            id: cpu_buy_link_text
            x: 40
            y: 270
            height: 20
            text: qsTr("Buy link :")
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            verticalAlignment: Text.AlignTop
        }
        TextInput {
            id: cpu_buy_link_value
            x: 120
            y: 270
            width: 502
            height: 20
            text: qsTr("")
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            verticalAlignment: Text.AlignTop
            layer.enabled: true
        }

        Text {
            id: cpu_image_link_text
            x: 40
            y: 300
            height: 20
            text: qsTr("Image link :")
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            verticalAlignment: Text.AlignTop
        }
        TextInput {
            id: cpu_image_link_value
            x: 140
            y: 300
            width: 482
            height: 20
            text: qsTr("")
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            verticalAlignment: Text.AlignTop
            layer.enabled: true
        }



        Text {
            id: cpu_supported_chipset_text
            x: 80
            y: 120
            width: 540
            height: 50
            text: "Supported Chipset : "
            wrapMode: Text.WordWrap
            font.pixelSize: 18


            MouseArea{
                anchors.fill: parent

                onClicked: {
                    cpu_supported_chipset_rectangle.visible = true
                }
            }
        }
        Rectangle
        {
            id : cpu_supported_chipset_rectangle
            anchors.fill: parent
            visible: false

            Button{
                id: cpu_supported_chipset_button
                x: 30
                y: 100
                width: 100
                height: 50
                text: qsTr("VALID")

                onClicked:
                {
                    cpu_supported_chipset_text.text = "Supported Chipset : "

                    for (var i=0 ; i<listModel_cpu_supported_chipset.count ; i++)
                    {
                        if (listModel_cpu_supported_chipset.get(i).selected === true)
                        {
                            cpu_supported_chipset_text.text += listModel_cpu_supported_chipset.get(i).name
                            cpu_supported_chipset_text.text += " , "
                        }

                    }

                    if (cpu_supported_chipset_text.text !== "Supported Chipset : ")
                    {
                        cpu_supported_chipset_text.text = cpu_supported_chipset_text.text.substring(0, cpu_supported_chipset_text.text.length - 3)
                    }

                    cpu_supported_chipset_rectangle.visible = false

                }
            }

            ListView {
                id: listView_cpu_supported_chipset

                width: 320
                anchors.leftMargin: 160
                anchors.rightMargin: 160
                anchors.fill: parent
                focus: true
                clip: true
                model: listModel_cpu_supported_chipset
                delegate: listDelegate_cpu_supported_chipset

                boundsMovement: Flickable.StopAtBounds

                ScrollBar.vertical: ScrollBar {
                    policy: ScrollBar.AlwaysOn
                }

            }
        }
        ListModel {
            id: listModel_cpu_supported_chipset

            ListElement {
                name: "AMD_A68H"
                selected: false
            }
            ListElement {
                name: "AMD_760G"
                selected: false
            }
            ListElement {
                name: "AMD_B350"
                selected: false
            }
            ListElement {
                name: "AMD_B450"
                selected: false
            }
            ListElement {
                name: "AMD_X399"
                selected: false
            }
            ListElement {
                name: "Intel_H110"
                selected: false
            }
            ListElement {
                name: "Intel_H270"
                selected: false
            }
            ListElement {
                name: "Intel_H310"
                selected: false
            }
            ListElement {
                name: "Intel_H370"
                selected: false
            }
            ListElement {
                name: "Intel_B150"
                selected: false
            }
            ListElement {
                name: "Intel_B250"
                selected: false
            }
            ListElement {
                name: "Intel_B360"
                selected: false
            }
            ListElement {
                name: "Intel_B365"
                selected: false
            }
            ListElement {
                name: "Intel_Z170"
                selected: false
            }
            ListElement {
                name: "Intel_Z270"
                selected: false
            }
            ListElement {
                name: "Intel_Z370"
                selected: false
            }
            ListElement {
                name: "Intel_Z390"
                selected: false
            }
            ListElement {
                name: "Intel_X99"
                selected: false
            }
            ListElement {
                name: "Intel_X299"
                selected: false
            }


        }
        Component {
            id: listDelegate_cpu_supported_chipset

            BorderImage {
                id: background_image_listDelegate
                width: 320
                height: 50
                source: "../images/image_listDelegate.png"

                Text {
                    id: listDelegate_text
                    text: name
                    font.pixelSize: 18
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    width: 270
                    height: 50

                }

                CheckBox {
                    id: checkbox
                    checked: selected
                    x: listDelegate_text.x + listDelegate_text.width
                    onClicked: listModel_cpu_supported_chipset.set(index, { "selected": checkbox.checked })
                }


            }
        }


    }

    Item {
        id: cooling_rectangle
        y: 140
        height: 340
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottomMargin: 0
        visible: false

        Text {
            id: cooling_name_text
            x: 150
            y: 0
            width: 60
            height: 20
            text: qsTr("name :")
            font.pixelSize: 18
        }
        TextInput {
            id: cooling_name_value
            x: 210
            width: 412
            height: 20
            text: qsTr("")
            font.pixelSize: 18
        }

        Text {
            id: cooling_fan_size_text
            x: 120
            y: 130
            width: 140
            height: 20
            text: qsTr("FAN Diameter")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        ComboBox {
            id: cooling_fan_size_cbb
            x: 120
            y: 160
            model: ["120mm", "140mm", "240mm", "280mm", "360mm", "420mm"]
        }

        Text {
            id: cooling_fan_min_sound_text
            x: 380
            y: 150
            width: 130
            height: 20
            text: qsTr("fan min sound :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: cooling_fan_min_sound_value
            x: 510
            y: 150
            width: 55
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 5
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+\.[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: cooling_fan_min_sound_DB_text
            x: 565
            y: 150
            height: 20
            text: qsTr("DB")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: cooling_fan_max_sound_text
            x: 380
            y: 180
            height: 20
            text: qsTr("fan max sound :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: cooling_fan_max_sound_value
            x: 510
            y: 180
            width: 55
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 5
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+\.[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: cooling_fan_max_sound_DB_text
            x: 565
            y: 180
            height: 20
            text: qsTr("DB")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: cooling_fan_min_speed_text
            x: 80
            y: 210
            width: 137
            height: 20
            text: qsTr("fan_min_speed :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: cooling_fan_min_speed_value
            x: 217
            y: 210
            width: 50
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 5
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: cooling_fan_min_speed_RPM_text
            x: 276
            y: 210
            height: 20
            text: qsTr("RPM")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: cooling_fan_max_speed_text
            x: 380
            y: 210
            width: 130
            height: 20
            text: qsTr("fan max speed :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: cooling_fan_max_speed_value
            x: 510
            y: 210
            width: 55
            height: 20
            text: qsTr("")
            maximumLength: 5
            verticalAlignment: Text.AlignVCenter
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: cooling_fan_max_speed_RPM_text
            x: 565
            y: 210
            height: 20
            text: qsTr("RPM")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: cooling_air_flow_text
            x: 80
            y: 240
            height: 20
            text: qsTr("AIR flow :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: cooling_air_flow_value
            x: 160
            y: 240
            width: 60
            height: 20
            text: qsTr("")
            maximumLength: 5
            verticalAlignment: Text.AlignVCenter
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+\.[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: cooling_air_flow_CFM_text
            x: 220
            y: 240
            height: 20
            text: qsTr("CFM")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: cooling_price_text
            x: 380
            y: 240
            width: 60
            height: 20
            text: qsTr("PRICE :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: cooling_price_value
            x: 440
            y: 240
            width: 90
            height: 20
            text: qsTr("")
            maximumLength: 7
            verticalAlignment: Text.AlignVCenter
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+\.[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: cooling_buy_link_text
            x: 40
            y: 270
            height: 20
            text: qsTr("Buy link :")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            horizontalAlignment: Text.AlignLeft
        }
        TextInput {
            id: cooling_buy_link_value
            x: 120
            y: 270
            width: 502
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignLeft
        }

        Text {
            id: cooling_image_link_text
            x: 40
            y: 300
            height: 20
            text: qsTr("Image link :")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            horizontalAlignment: Text.AlignLeft
        }
        TextInput {
            id: cooling_image_link_value
            x: 140
            y: 300
            width: 482
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignLeft
        }



        Text {
            id: cooling_supported_socket_text
            x: 60
            y: 40
            width: 520
            height: 50
            text: "Supported Socket : "
            wrapMode: Text.WordWrap
            font.pixelSize: 18


            MouseArea{
                anchors.fill: parent

                onClicked: {
                    cooling_supported_socket_rectangle.visible = true
                }
            }
        }
        Rectangle
        {
            id : cooling_supported_socket_rectangle
            anchors.fill: parent
            visible: false

            Button{
                id: cooling_supported_socket_button
                x: 30
                y: 100
                width: 100
                height: 50
                text: qsTr("VALID")

                onClicked:
                {
                    cooling_supported_socket_text.text = "Supported Socket : "

                    for (var i=0 ; i<listModel_cooling_supported_socket.count ; i++)
                    {
                        if (listModel_cooling_supported_socket.get(i).selected === true)
                        {
                            cooling_supported_socket_text.text += listModel_cooling_supported_socket.get(i).name
                            cooling_supported_socket_text.text += " , "
                        }

                    }

                    if (cooling_supported_socket_text.text !== "Supported Socket : ")
                    {
                        cooling_supported_socket_text.text = cooling_supported_socket_text.text.substring(0, cooling_supported_socket_text.text.length - 3)
                    }

                    cooling_supported_socket_rectangle.visible = false

                }
            }

            ListView {
                id: listView_cooling_supported_socket

                width: 320
                anchors.leftMargin: 160
                anchors.rightMargin: 160
                anchors.fill: parent
                focus: true
                clip: true
                model: listModel_cooling_supported_socket
                delegate: listDelegate_cooling_supported_socket

                boundsMovement: Flickable.StopAtBounds

                ScrollBar.vertical: ScrollBar {
                    policy: ScrollBar.AlwaysOn
                }

            }
        }
        ListModel {
            id: listModel_cooling_supported_socket

            ListElement {
                name: "AMD_AM2"
                selected: false
            }
            ListElement {
                name: "AMD_AM2_plus"
                selected: false
            }
            ListElement {
                name: "AMD_AM3"
                selected: false
            }
            ListElement {
                name: "AMD_AM3_plus"
                selected: false
            }
            ListElement {
                name: "AMD_AM4"
                selected: false
            }
            ListElement {
                name: "AMD_SP3"
                selected: false
            }
            ListElement {
                name: "AMD_sTR4"
                selected: false
            }
            ListElement {
                name: "AMD_sTRx4"
                selected: false
            }
            ListElement {
                name: "LGA_1150"
                selected: false
            }
            ListElement {
                name: "LGA_1151"
                selected: false
            }
            ListElement {
                name: "LGA_1155"
                selected: false
            }
            ListElement {
                name: "LGA_1156"
                selected: false
            }
            ListElement {
                name: "LGA_1366"
                selected: false
            }
            ListElement {
                name: "LGA_2011"
                selected: false
            }
            ListElement {
                name: "LGA_2011_v3"
                selected: false
            }
            ListElement {
                name: "LGA_2066"
                selected: false
            }

        }
        Component {
            id: listDelegate_cooling_supported_socket

            BorderImage {
                id: background_image_listDelegate
                width: 320
                height: 50
                source: "../images/image_listDelegate.png"

                Text {
                    id: listDelegate_text
                    text: name
                    font.pixelSize: 18
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    width: 270
                    height: 50

                }

                CheckBox {
                    id: checkbox
                    checked: selected
                    x: listDelegate_text.x + listDelegate_text.width
                    onClicked: listModel_cooling_supported_socket.set(index, { "selected": checkbox.checked })
                }


            }
        }

    }

    Item {
        id: ram_rectangle
        y: 140
        height: 340
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottomMargin: 0
        visible: false

        Text {
            id: ram_name_text
            x: 150
            y: 0
            width: 60
            height: 20
            text: qsTr("name :")
            font.pixelSize: 18
        }
        TextInput {
            id: ram_name_value
            x: 210
            width: 412
            height: 20
            text: qsTr("")
            font.pixelSize: 18
        }

        Text {
            id: ram_memory_type_text
            x: 70
            y: 50
            width: 140
            height: 20
            text: qsTr("RAM type")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        ComboBox {
            id: ram_memory_type_cbb
            x: 70
            y: 80
            model: ["DDR3", "DDR4", "GDDR5", "GDDR5X", "GDDR6"]
        }


        Text {
            id: ram_cas_latency_text
            x: 250
            y: 50
            width: 140
            height: 20
            text: qsTr("CAS latency")
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        ComboBox {
            id: ram_cas_latency_cbb
            x: 250
            y: 80
            model: ["CL 22", "CL 21", "CL 20", "CL 19", "CL 18", "CL 17", "CL 16", "CL 15", "CL 14",
                "CL 13", "CL 12", "CL 11", "CL 10"]
        }


        Text {
            id: ram_memory_speed_text
            x: 430
            y: 50
            width: 140
            height: 20
            text: qsTr("memory speed :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        ComboBox {
            id: ram_memory_speed_cbb
            x: 430
            y: 80
            model: ["1066Mhz","1333Mhz","1600Mhz","1866Mhz","2133Mhz","2400Mhz","2666Mhz","2800Mhz",
                "2933Mhz","3000Mhz","3200Mhz","3300Mhz","3333Mhz","3400Mhz","3466Mhz","3600Mhz",
                "3666Mhz","3733Mhz","3800Mhz","3866Mhz","4000Mhz","4133Mhz","4200Mhz","4266Mhz",
                "4300Mhz","4333Mhz","4400Mhz","4500Mhz","4600Mhz","4700Mhz","4800Mhz"]
        }


        Text {
            id: ram_module_number_text
            x: 90
            y: 200
            width: 170
            height: 20
            text: qsTr("Number of Modules :")
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        TextInput {
            id: ram_module_number_value
            x: 260
            y: 200
            width: 40
            height: 20
            text: qsTr("")
            layer.enabled: true
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            maximumLength: 1
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }


        Text {
            id: ram_memory_size_text
            x: 340
            y: 200
            width: 112
            height: 20
            text: qsTr("Total Memory :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: ram_memory_size_value
            x: 452
            y: 200
            width: 40
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 3
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: ram_memory_size_GB_text
            x: 492
            y: 200
            height: 20
            text: qsTr("GB")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }


        Text {
            id: ram_price_text
            x: 340
            y: 240
            width: 60
            height: 20
            text: qsTr("PRICE :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: ram_price_value
            x: 400
            y: 240
            width: 90
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 7
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+\.[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }


        Text {
            id: ram_buy_link_text
            x: 40
            y: 270
            height: 20
            text: qsTr("Buy link :")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            horizontalAlignment: Text.AlignLeft
        }
        TextInput {
            id: ram_buy_link_value
            x: 120
            y: 270
            width: 502
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignLeft
        }


        Text {
            id: ram_image_link_text
            x: 40
            y: 300
            height: 20
            text: qsTr("Image link :")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            horizontalAlignment: Text.AlignLeft
        }
        TextInput {
            id: ram_image_link_value
            x: 140
            y: 300
            width: 482
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignLeft
        }

    }

    Item {
        id: gpu_rectangle
        y: 140
        height: 340
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottomMargin: 0
        visible: false

        Text {
            id: gpu_name_text
            x: 150
            y: 0
            width: 60
            height: 20
            text: qsTr("name :")
            font.pixelSize: 18
        }
        TextInput {
            id: gpu_name_value
            x: 210
            width: 412
            height: 20
            text: qsTr("")
            font.pixelSize: 18
        }

        Text {
            id: gpu_bus_text
            x: 80
            y: 30
            width: 140
            height: 20
            text: qsTr("GPU bus")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        ComboBox {
            id: gpu_bus_cbb
            x: 80
            y: 60
            model: ["PCIE_2_0_16x", "PCIE_2_0_8x", "PCIE_2_0_4x", "PCIE_2_0_1x","PCIE_3_0_16x", "PCIE_3_0_8x", "PCIE_3_0_4x", "PCIE_3_0_1x"]
        }

        Text {
            id: gpu_power_cable_pin_text
            x: 240
            y: 30
            width: 140
            height: 20
            text: qsTr("Power pin")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        ComboBox {
            id: gpu_power_cable_pin_cbb
            x: 240
            y: 60
            model: ["PCIE_8", "PCIE_8_8", "NONE"]
        }

        Text {
            id: gpu_RAM_type_text
            x: 400
            y: 30
            width: 140
            height: 20
            text: qsTr("RAM type")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        ComboBox {
            id: gpu_RAM_type_cbb
            x: 400
            y: 60
            model: ["DDR3", "DDR4", "GDDR5", "GDDR5X", "GDDR6"]
        }

        Text {
            id: gpu_clock_text
            x: 91
            y: 180
            width: 92
            height: 20
            text: qsTr("GPU clock :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: gpu_clock_value
            x: 183
            y: 180
            width: 60
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 5
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: gpu_clock_Mhz_text
            x: 243
            y: 180
            height: 20
            text: qsTr("Mhz")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: gpu_boosted_clock_text
            x: 315
            y: 180
            width: 142
            height: 20
            text: qsTr("GPU boost clock :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: gpu_boosted_clock_value
            x: 457
            y: 180
            width: 60
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 5
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: gpu_boosted_clock_Mhz_text
            x: 517
            y: 180
            height: 20
            text: qsTr("Mhz")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: gpu_core_text
            x: -1
            y: 206
            height: 20
            text: qsTr("GPU core :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: gpu_core_value
            x: 84
            y: 206
            width: 40
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 2
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: gpu_ram_size_text
            x: 164
            y: 210
            height: 20
            text: qsTr("GPU RAM size :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: gpu_ram_size_value
            x: 287
            y: 210
            width: 60
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 5
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: gpu_ram_size_GB_text
            x: 347
            y: 210
            height: 20
            text: qsTr("GB")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: gpu_ram_speed_text
            x: 409
            y: 210
            height: 20
            text: qsTr("GPU RAM speed :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: gpu_ram_speed_value
            x: 549
            y: 210
            width: 60
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 5
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: gpu_ram_speed_Mhz_text
            x: 609
            y: 210
            height: 20
            text: qsTr("Mhz")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: gpu_flux_text
            x: 53
            y: 242
            height: 20
            text: qsTr("Flux :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: gpu_flux_value
            x: 97
            y: 244
            width: 50
            height: 20
            text: qsTr("")
            maximumLength: 5
            verticalAlignment: Text.AlignVCenter
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: gpu_power_consumption_text
            x: 174
            y: 242
            width: 168
            height: 20
            text: qsTr("power consumption :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: gpu_power_consumption_value
            x: 342
            y: 242
            width: 40
            height: 20
            text: qsTr("")
            maximumLength: 3
            verticalAlignment: Text.AlignVCenter
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: gpu_power_consumption_W_text
            x: 382
            y: 242
            height: 20
            text: qsTr("W")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: gpu_price_text
            x: 438
            y: 242
            width: 60
            height: 20
            text: qsTr("PRICE :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: gpu_price_value
            x: 498
            y: 242
            width: 90
            height: 20
            text: qsTr("")
            maximumLength: 7
            verticalAlignment: Text.AlignVCenter
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+\.[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: gpu_buy_link_text
            x: 40
            y: 270
            height: 20
            text: qsTr("Buy link :")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            horizontalAlignment: Text.AlignLeft
        }
        TextInput {
            id: gpu_buy_link_value
            x: 120
            y: 270
            width: 502
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignLeft
        }

        Text {
            id: gpu_image_link_text
            x: 40
            y: 300
            height: 20
            text: qsTr("Image link :")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            horizontalAlignment: Text.AlignLeft
        }
        TextInput {
            id: gpu_image_link_value
            x: 140
            y: 300
            width: 482
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignLeft
        }
    }

    Item {
        id: storage_rectangle
        y: 140
        height: 340
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottomMargin: 0
        visible: false

        Text {
            id: storage_name_text
            x: 150
            y: 0
            width: 60
            height: 20
            text: qsTr("name :")
            font.pixelSize: 18
        }
        TextInput {
            id: storage_name_value
            x: 210
            width: 412
            height: 20
            text: qsTr("")
            font.pixelSize: 18
        }

        Text {
            id: storage_type_text
            x: 250
            y: 120
            width: 140
            height: 20
            text: qsTr("Type")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        ComboBox {
            id: storage_type_cbb
            x: 250
            y: 150
            model: ["HDD","SSD","M_2"]

            onCurrentTextChanged:
            {
                if(storage_type_cbb.currentText === "HDD")
                {
                    storage_hdd_spindle_speed_RPM_text.visible = true
                    storage_hdd_spindle_speed_text.visible = true
                    storage_hdd_spindle_speed_value.visible = true

                } else
                {
                    storage_hdd_spindle_speed_RPM_text.visible = false
                    storage_hdd_spindle_speed_text.visible = false
                    storage_hdd_spindle_speed_value.text = "0"
                    storage_hdd_spindle_speed_value.visible = false
                }
            }
        }

        Text {
            id: storage_read_speed_text
            x: 20
            y: 210
            height: 20
            text: qsTr("Read Speed :")
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        TextInput {
            id: storage_read_speed_value
            x: 125
            y: 210
            width: 60
            height: 20
            text: qsTr("")
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            maximumLength: 5
            layer.enabled: true
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: storage_read_speed_GB_s_text
            x: 185
            y: 210
            height: 20
            text: qsTr("GB/s")
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: storage_write_speed_text
            x: 340
            y: 210
            height: 20
            text: qsTr("Write Speed :")
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        TextInput {
            id: storage_write_speed_value
            x: 447
            y: 210
            width: 60
            height: 20
            text: qsTr("")
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            maximumLength: 5
            layer.enabled: true
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: storage_write_speed_GB_s_text
            x: 507
            y: 210
            height: 20
            text: qsTr("GB/s")
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: storage_capacity_text
            x: 19
            y: 240
            height: 20
            text: qsTr("Capacity :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: storage_capacity_value
            x: 97
            y: 240
            width: 60
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 5
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: storage_capacity_GB_text
            x: 157
            y: 240
            width: 24
            height: 20
            text: qsTr("GB")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: storage_hdd_spindle_speed_text
            x: 221
            y: 240
            height: 20
            text: qsTr("Spindle speed:")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: storage_hdd_spindle_speed_value
            x: 336
            y: 240
            width: 60
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 5
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: storage_hdd_spindle_speed_RPM_text
            x: 396
            y: 240
            height: 20
            text: qsTr("RPM")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: storage_price_text
            x: 471
            y: 240
            width: 60
            height: 20
            text: qsTr("PRICE :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: storage_price_value
            x: 531
            y: 240
            width: 90
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 7
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+\.[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: storage_buy_link_text
            x: 40
            y: 270
            height: 20
            text: qsTr("Buy link :")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            horizontalAlignment: Text.AlignLeft
        }
        TextInput {
            id: storage_buy_link_value
            x: 120
            y: 270
            width: 502
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignLeft
        }

        Text {
            id: storage_image_link_text
            x: 40
            y: 300
            height: 20
            text: qsTr("Image link :")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            horizontalAlignment: Text.AlignLeft
        }
        TextInput {
            id: storage_image_link_value
            x: 140
            y: 300
            width: 482
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignLeft
        }

    }

    Item {
        id: power_supply_rectangle
        y: 140
        height: 340
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottomMargin: 0
        visible: false

        Text {
            id: power_supply_name_text
            x: 150
            y: 0
            width: 60
            height: 20
            text: qsTr("name :")
            font.pixelSize: 18
        }
        TextInput {
            id: power_supply_name_value
            x: 210
            width: 412
            height: 20
            text: qsTr("")
            font.pixelSize: 18
        }

        Text {
            id: power_supply_power_text
            y: 50
            width: 140
            height: 20
            text: qsTr("POWER")
            font.pixelSize: 18

            anchors.right: power_supply_standard_text.left
            anchors.rightMargin: parent.width / 10
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter



        }
        ComboBox {
            id: power_supply_power_cbb
            y: 80

            anchors.right: power_supply_standard_cbb.left
            anchors.rightMargin: parent.width / 10

            model: ["300 W", "350 W", "400 W", "450 W", "500 W", "550 W", "600 W", "650 W", "700 W", "750 W", "800 W", "850 W",
                "900 W", "950 W", "1000 W", "1100 W", "1200 W", "1300 W", "1400 W", "1500 W", "1600 W"]
        }
        Text {
            id: power_supply_standard_text
            y: 50
            width: 140
            height: 20
            text: qsTr("STANDARD")

            font.pixelSize: 18

            anchors.left: parent.left
            anchors.leftMargin: ( (parent.width / 2) + (parent.width / 20) )
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        ComboBox {
            id: power_supply_standard_cbb
            y: 80

            anchors.left: parent.left
            anchors.leftMargin: ( (parent.width / 2) + (parent.width / 20) )

            model: ["plus_80", "plus_80_bronze", "plus_80_silver", "plus_80_gold", "plus_80_platinium", "plus_80_titanium"]
        }

        Text {
            id: power_supply_ATX24_text
            x: 232
            y: 150
            height: 20
            text: qsTr("ATX 24 pin cable :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: power_supply_ATX24_value
            x: 378
            y: 150
            width: 30
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 2
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: power_supply_molex4_text
            x: 120
            y: 180
            height: 20
            text: qsTr("Molex 4 pin cable :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: power_supply_molex4_value
            x: 270
            y: 180
            width: 30
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 2
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: power_supply_ATX_4_text
            x: 340
            y: 180
            height: 20
            text: qsTr("ATX 4 pin  power cable :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: power_supply_ATX_4_value
            x: 536
            y: 180
            width: 30
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 2
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: power_supply_pcie6_2_text
            x: 135
            y: 210
            height: 20
            text: qsTr("PCIE 6+2 cable :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: power_supply_pcie6_2_value
            x: 270
            y: 210
            width: 30
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 2
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: power_supply_sata_power_cable_text
            x: 340
            y: 210
            height: 20
            text: qsTr("SATA Power cable :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: power_supply_sata_power_cable_value
            x: 495
            y: 210
            width: 30
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 2
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: power_supply_price_text
            x: 340
            y: 240
            width: 60
            height: 20
            text: qsTr("PRICE :")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
        TextInput {
            id: power_supply_price_value
            x: 400
            y: 240
            width: 90
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            maximumLength: 7
            validator: RegExpValidator {
                regExp: /[1-9]+[0-9]+\.[0-9]+/
            }
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: power_supply_buy_link_text
            x: 40
            y: 270
            height: 20
            text: qsTr("Buy link :")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            horizontalAlignment: Text.AlignLeft
        }
        TextInput {
            id: power_supply_buy_link_value
            x: 120
            y: 270
            width: 502
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignLeft
        }

        Text {
            id: power_supply_image_link_text
            x: 40
            y: 300
            height: 20
            text: qsTr("Image link :")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            horizontalAlignment: Text.AlignLeft
        }
        TextInput {
            id: power_supply_image_link_value
            x: 140
            y: 300
            width: 482
            height: 20
            text: qsTr("")
            verticalAlignment: Text.AlignTop
            font.pixelSize: 18
            layer.enabled: true
            horizontalAlignment: Text.AlignLeft
        }


    }


}

/*##^##
Designer {
    D{i:3;anchors_width:640;anchors_x:0}D{i:6;invisible:true}D{i:115;invisible:true}D{i:24;invisible:true}
D{i:129;invisible:true}
}
##^##*/

