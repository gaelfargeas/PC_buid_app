import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.13
import Create_item 1.0
import Main_class 1.0


Item {
    id: element
    width: 740
    height: 520

    property Main_class main_class_object
    property bool day_mode: false

    anchors.fill: parent

    Create_item {
        id: create_item
    }

    Rectangle{
        id: background_rectangle
        anchors.fill: parent
        color: "#121212"
    }

    Rectangle {
        id: status_message_rectangle
        y: 25
        height: 30
        color: "#424242"
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 50

        border.color: "#757575"
        border.width: 5
        radius: 20

        Text {
            id: status_message_text
            visible: false
            text: qsTr("Text")

            font.pixelSize: 18
            color: "#E0E0E0"

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.rightMargin: 10
        }
    }

    Rectangle {
        id: main_rectangle
        y: 90
        height: 50
        color: "#424242"

        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 50

        border.color: "#757575"
        border.width: 5
        radius: 20

        Text {
            id: component_type_text
            text: qsTr("COMPONENT TYPE :")

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

            font.pixelSize: 18

            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

        }

        ComboBox {
            id: component_type_comboBox

            anchors.left: component_type_text.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

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

        Button{
            id: day_mode_button
            width: 120

            anchors.left: component_type_comboBox.right
            anchors.leftMargin: 30
            anchors.right: create_componant_button.left
            anchors.rightMargin: 30
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

            text: qsTr("Day Mode")

            onClicked: {
                if(day_mode === true)
                {
                    // BACKGROUND
                    background_rectangle.color = "#121212"

                    // STATUS
                    status_message_rectangle.color = "#424242"
                    status_message_rectangle.border.color = "#757575"
                    status_message_text.color = "#E0E0E0"

                    // MAIN RECTANGLE
                    main_rectangle.color = "#424242"
                    main_rectangle.border.color = "#757575"

                    // COMPUTER CASE
                    computer_case_background.color = "#424242"
                    computer_case_background.border.color = "#757575"

                    computer_case_name_value_rectangle.color = "#757575"
                    computer_case_name_value.color = "black"

                    computer_case_price_value_rectangle.color = "#757575"
                    computer_case_price_value.color = "black"

                    computer_case_buy_link_value_rectangle.color = "#757575"
                    computer_case_buy_link_value.color = "black"

                    computer_case_image_link_value_rectangle.color = "#757575"
                    computer_case_image_link_value.color = "black"

                    // MOTHERBOARD
                    motherboard_background.color = "#424242"
                    motherboard_background.border.color = "#757575"

                    motherboard_name_value_rectangle.color = "#757575"
                    motherboard_name_value.color = "black"

                    ram_speed_supported_text_rectangle.color = "#616161"
                    ram_speed_supported_text_rectangle.border.color = "#757575"
                    ram_speed_supported_text.color = "black"

                    motherboard_RAM_slot_number_value_rectangle.color = "#757575"
                    motherboard_RAM_slot_number_value.color = "black"

                    motherboard_RAM_max_capacity_value_rectangle.color = "#757575"
                    motherboard_RAM_max_capacity_value.color = "black"

                    motherboard_RAM_max_per_slot_value_rectangle.color = "#757575"
                    motherboard_RAM_max_per_slot_value.color = "black"

                    motherboard_pcie20_16x_slot_value_rectangle.color = "#757575"
                    motherboard_pcie20_16x_slot_value.color = "black"

                    motherboard_pcie20_8x_slot_value_rectangle.color = "#757575"
                    motherboard_pcie20_8x_slot_value.color = "black"

                    motherboard_pcie20_4x_slot_value_rectangle.color = "#757575"
                    motherboard_pcie20_4x_slot_value.color = "black"

                    motherboard_pcie20_1x_slot_value_rectangle.color = "#757575"
                    motherboard_pcie20_1x_slot_value.color = "black"

                    motherboard_pcie30_16x_slot_value_rectangle.color = "#757575"
                    motherboard_pcie30_16x_slot_value.color = "black"

                    motherboard_pcie30_8x_slot_value_rectangle.color = "#757575"
                    motherboard_pcie30_8x_slot_value.color = "black"

                    motherboard_pcie30_4x_slot_value_rectangle.color = "#757575"
                    motherboard_pcie30_4x_slot_value.color = "black"

                    motherboard_pcie30_1x_slot_value_rectangle.color = "#757575"
                    motherboard_pcie30_1x_slot_value.color = "black"

                    motherboard_sata_slot_value_rectangle.color = "#757575"
                    motherboard_sata_slot_value.color = "black"

                    motherboard_m2_slot_value_rectangle.color = "#757575"
                    motherboard_m2_slot_value.color = "black"

                    motherboard_price_value_rectangle.color = "#757575"
                    motherboard_price_value.color = "black"

                    motherboard_buy_link_value_rectangle.color = "#757575"
                    motherboard_buy_link_value.color = "black"

                    motherboard_image_link_value_rectangle.color = "#757575"
                    motherboard_image_link_value.color = "black"

                    // CPU
                    cpu_background.color = "#424242"
                    cpu_background.border.color = "#757575"

                    cpu_name_value_rectangle.color = "#757575"
                    cpu_name_value.color = "black"

                    cpu_supported_chipset_text_rectangle.color = "#616161"
                    cpu_supported_chipset_text_rectangle.border.color = "#757575"
                    cpu_supported_chipset_text.color = "black"

                    cpu_core_value_rectangle.color = "#757575"
                    cpu_core_value.color = "black"

                    cpu_clock_speed_value_rectangle.color = "#757575"
                    cpu_clock_speed_value.color = "black"

                    cpu_boosted_speed_value_rectangle.color = "#757575"
                    cpu_boosted_speed_value.color = "black"

                    cpu_thread_value_rectangle.color = "#757575"
                    cpu_thread_value.color = "black"

                    cpu_cache_L3_value_rectangle.color = "#757575"
                    cpu_cache_L3_value.color = "black"

                    cpu_TDP_value_rectangle.color = "#757575"
                    cpu_TDP_value.color = "black"

                    cpu_price_value_rectangle.color = "#757575"
                    cpu_price_value.color = "black"

                    cpu_buy_link_value_rectangle.color = "#757575"
                    cpu_buy_link_value.color = "black"

                    cpu_image_link_value_rectangle.color = "#757575"
                    cpu_image_link_value.color = "black"

                    // COOLING

                    cooling_background.color = "#424242"
                    cooling_background.border.color = "#757575"

                    cooling_name_value_rectangle.color = "#757575"
                    cooling_name_value.color = "black"

                    cooling_supported_socket_text_rectangle.color = "#616161"
                    cooling_supported_socket_text_rectangle.border.color = "#757575"
                    cooling_supported_socket_text.color = "black"

                    cooling_fan_min_sound_value_rectangle.color = "#757575"
                    cooling_fan_min_sound_value.color = "black"

                    cooling_fan_max_sound_value_rectangle.color = "#757575"
                    cooling_fan_max_sound_value.color = "black"

                    cooling_price_value_rectangle.color = "#757575"
                    cooling_price_value.color = "black"

                    cooling_fan_min_speed_value_rectangle.color = "#757575"
                    cooling_fan_min_speed_value.color = "black"

                    cooling_fan_max_speed_value_rectangle.color = "#757575"
                    cooling_fan_max_speed_value.color = "black"

                    cooling_air_flow_value_rectangle.color = "#757575"
                    cooling_air_flow_value.color = "black"

                    cooling_buy_link_value_rectangle.color = "#757575"
                    cooling_buy_link_value.color = "black"

                    cooling_image_link_value_rectangle.color = "#757575"
                    cooling_image_link_value.color = "black"

                    // RAM

                    ram_background.color = "#424242"
                    ram_background.border.color = "#757575"

                    ram_name_value_rectangle.color = "#757575"
                    ram_name_value.color = "black"

                    ram_module_number_value_rectangle.color = "#757575"
                    ram_module_number_value.color = "black"

                    ram_memory_size_value_rectangle.color = "#757575"
                    ram_memory_size_value.color = "black"

                    ram_price_value_rectangle.color = "#757575"
                    ram_price_value.color = "black"

                    ram_buy_link_value_rectangle.color = "#757575"
                    ram_buy_link_value.color = "black"

                    ram_image_link_value_rectangle.color = "#757575"
                    ram_image_link_value.color = "black"

                    // GPU

                    gpu_background.color = "#424242"
                    gpu_background.border.color = "#757575"

                    gpu_name_value_rectangle.color = "#757575"
                    gpu_name_value.color = "black"

                    gpu_clock_value_rectangle.color = "#757575"
                    gpu_clock_value.color = "black"

                    gpu_boosted_clock_value_rectangle.color = "#757575"
                    gpu_boosted_clock_value.color = "black"

                    gpu_core_value_rectangle.color = "#757575"
                    gpu_core_value.color = "black"

                    gpu_ram_size_value_rectangle.color = "#757575"
                    gpu_ram_size_value.color = "black"

                    gpu_ram_speed_value_rectangle.color = "#757575"
                    gpu_ram_speed_value.color = "black"

                    gpu_flux_value_rectangle.color = "#757575"
                    gpu_flux_value.color = "black"

                    gpu_power_consumption_value_rectangle.color = "#757575"
                    gpu_power_consumption_value.color = "black"

                    gpu_price_value_rectangle.color = "#757575"
                    gpu_price_value.color = "black"

                    gpu_buy_link_value_rectangle.color = "#757575"
                    gpu_buy_link_value.color = "black"

                    gpu_image_link_value_rectangle.color = "#757575"
                    gpu_image_link_value.color = "black"


                    // STORAGE

                    storage_background.color = "#424242"
                    storage_background.border.color = "#757575"

                    storage_name_value_rectangle.color = "#757575"
                    storage_name_value.color = "black"

                    storage_read_speed_value_rectangle.color = "#757575"
                    storage_read_speed_value.color = "black"

                    storage_write_speed_value_rectangle.color = "#757575"
                    storage_write_speed_value.color = "black"

                    storage_capacity_value_rectangle.color = "#757575"
                    storage_capacity_value.color = "black"

                    storage_hdd_spindle_speed_value_rectangle.color = "#757575"
                    storage_hdd_spindle_speed_value.color = "black"

                    storage_price_value_rectangle.color = "#757575"
                    storage_price_value.color = "black"

                    storage_buy_link_value_rectangle.color = "#757575"
                    storage_buy_link_value.color = "black"

                    storage_image_link_value_rectangle.color = "#757575"
                    storage_image_link_value.color = "black"

                    // POWER SUPPLY
                    power_supply_background.color = "#424242"
                    power_supply_background.border.color = "#757575"

                    power_supply_name_value_rectangle.color = "#757575"
                    power_supply_name_value.color = "black"

                    power_supply_ATX24_value_rectangle.color = "#757575"
                    power_supply_ATX24_value.color = "black"

                    power_supply_molex4_value_rectangle.color = "#757575"
                    power_supply_molex4_value.color = "black"

                    power_supply_price_value_rectangle.color = "#757575"
                    power_supply_price_value.color = "black"

                    power_supply_ATX_4_value_rectangle.color = "#757575"
                    power_supply_ATX_4_value.color = "black"

                    power_supply_pcie6_2_value_rectangle.color = "#757575"
                    power_supply_pcie6_2_value.color = "black"

                    power_supply_sata_power_cable_value_rectangle.color = "#757575"
                    power_supply_sata_power_cable_value.color = "black"

                    power_supply_buy_link_value_rectangle.color = "#757575"
                    power_supply_buy_link_value.color = "black"

                    power_supply_image_link_value_rectangle.color = "#757575"
                    power_supply_image_link_value.color = "black"

                    // BUTTON AND VARIABLES
                    day_mode_button.text = "Day Mode"
                    day_mode = false
                }else
                {
                    // BACKGROUND
                    background_rectangle.color = "#FAFAFA"

                    // STATUS
                    status_message_rectangle.color = "#757575"
                    status_message_rectangle.border.color = "#9E9E9E"
                    status_message_text.color = "#E0E0E0"

                    // MAIN RECTANGLE
                    main_rectangle.color = "#757575"
                    main_rectangle.border.color = "#9E9E9E"

                    // COMPUTER CASE
                    computer_case_background.color = "#757575"
                    computer_case_background.border.color = "#9E9E9E"

                    computer_case_name_value_rectangle.color = "#424242"
                    computer_case_name_value.color = "#E0E0E0"

                    computer_case_price_value_rectangle.color = "#424242"
                    computer_case_price_value.color = "#E0E0E0"

                    computer_case_buy_link_value_rectangle.color = "#424242"
                    computer_case_buy_link_value.color = "#E0E0E0"

                    computer_case_image_link_value_rectangle.color = "#424242"
                    computer_case_image_link_value.color = "#E0E0E0"

                    // MOTHERBOARD
                    motherboard_background.color = "#757575"
                    motherboard_background.border.color = "#9E9E9E"

                    motherboard_name_value_rectangle.color = "#424242"
                    motherboard_name_value.color = "#BDBDBD"

                    ram_speed_supported_text_rectangle.color = "#424242"
                    ram_speed_supported_text_rectangle.border.color = "#9E9E9E"
                    ram_speed_supported_text.color = "#BDBDBD"

                    motherboard_RAM_slot_number_value_rectangle.color = "#424242"
                    motherboard_RAM_slot_number_value.color = "#BDBDBD"

                    motherboard_RAM_max_capacity_value_rectangle.color = "#424242"
                    motherboard_RAM_max_capacity_value.color = "#BDBDBD"

                    motherboard_RAM_max_per_slot_value_rectangle.color = "#424242"
                    motherboard_RAM_max_per_slot_value.color = "#BDBDBD"

                    motherboard_pcie20_16x_slot_value_rectangle.color = "#424242"
                    motherboard_pcie20_16x_slot_value.color = "#BDBDBD"

                    motherboard_pcie20_8x_slot_value_rectangle.color = "#424242"
                    motherboard_pcie20_8x_slot_value.color = "#BDBDBD"

                    motherboard_pcie20_4x_slot_value_rectangle.color = "#424242"
                    motherboard_pcie20_4x_slot_value.color = "#BDBDBD"

                    motherboard_pcie20_1x_slot_value_rectangle.color = "#424242"
                    motherboard_pcie20_1x_slot_value.color = "#BDBDBD"

                    motherboard_pcie30_16x_slot_value_rectangle.color = "#424242"
                    motherboard_pcie30_16x_slot_value.color = "#BDBDBD"

                    motherboard_pcie30_8x_slot_value_rectangle.color = "#424242"
                    motherboard_pcie30_8x_slot_value.color = "#BDBDBD"

                    motherboard_pcie30_4x_slot_value_rectangle.color = "#424242"
                    motherboard_pcie30_4x_slot_value.color = "#BDBDBD"

                    motherboard_pcie30_1x_slot_value_rectangle.color = "#424242"
                    motherboard_pcie30_1x_slot_value.color = "#BDBDBD"

                    motherboard_sata_slot_value_rectangle.color = "#424242"
                    motherboard_sata_slot_value.color = "#BDBDBD"

                    motherboard_m2_slot_value_rectangle.color = "#424242"
                    motherboard_m2_slot_value.color = "#BDBDBD"

                    motherboard_price_value_rectangle.color = "#424242"
                    motherboard_price_value.color = "#BDBDBD"

                    motherboard_buy_link_value_rectangle.color = "#424242"
                    motherboard_buy_link_value.color = "#BDBDBD"

                    motherboard_image_link_value_rectangle.color = "#424242"
                    motherboard_image_link_value.color = "#BDBDBD"

                    // CPU
                    cpu_background.color = "#757575"
                    cpu_background.border.color = "#9E9E9E"

                    cpu_name_value_rectangle.color = "#424242"
                    cpu_name_value.color = "#BDBDBD"

                    cpu_supported_chipset_text_rectangle.color = "#424242"
                    cpu_supported_chipset_text_rectangle.border.color = "#9E9E9E"
                    cpu_supported_chipset_text.color = "#BDBDBD"

                    cpu_core_value_rectangle.color = "#424242"
                    cpu_core_value.color = "#BDBDBD"

                    cpu_clock_speed_value_rectangle.color = "#424242"
                    cpu_clock_speed_value.color = "#BDBDBD"

                    cpu_boosted_speed_value_rectangle.color = "#424242"
                    cpu_boosted_speed_value.color = "#BDBDBD"

                    cpu_thread_value_rectangle.color = "#424242"
                    cpu_thread_value.color = "#BDBDBD"

                    cpu_cache_L3_value_rectangle.color = "#424242"
                    cpu_cache_L3_value.color = "#BDBDBD"

                    cpu_TDP_value_rectangle.color = "#424242"
                    cpu_TDP_value.color = "#BDBDBD"

                    cpu_price_value_rectangle.color = "#424242"
                    cpu_price_value.color = "#BDBDBD"

                    cpu_buy_link_value_rectangle.color = "#424242"
                    cpu_buy_link_value.color = "#BDBDBD"

                    cpu_image_link_value_rectangle.color = "#424242"
                    cpu_image_link_value.color = "#BDBDBD"

                    // COOLING

                    cooling_background.color = "#757575"
                    cooling_background.border.color = "#9E9E9E"

                    cooling_name_value_rectangle.color = "#424242"
                    cooling_name_value.color = "#BDBDBD"

                    cooling_supported_socket_text_rectangle.color = "#424242"
                    cooling_supported_socket_text_rectangle.border.color = "#9E9E9E"
                    cooling_supported_socket_text.color = "#BDBDBD"

                    cooling_fan_min_sound_value_rectangle.color = "#424242"
                    cooling_fan_min_sound_value.color = "#BDBDBD"

                    cooling_fan_max_sound_value_rectangle.color = "#424242"
                    cooling_fan_max_sound_value.color = "#BDBDBD"

                    cooling_price_value_rectangle.color = "#424242"
                    cooling_price_value.color = "#BDBDBD"

                    cooling_fan_min_speed_value_rectangle.color = "#424242"
                    cooling_fan_min_speed_value.color = "#BDBDBD"

                    cooling_fan_max_speed_value_rectangle.color = "#424242"
                    cooling_fan_max_speed_value.color = "#BDBDBD"

                    cooling_air_flow_value_rectangle.color = "#424242"
                    cooling_air_flow_value.color = "#BDBDBD"

                    cooling_buy_link_value_rectangle.color = "#424242"
                    cooling_buy_link_value.color = "#BDBDBD"

                    cooling_image_link_value_rectangle.color = "#424242"
                    cooling_image_link_value.color = "#BDBDBD"

                    // RAM

                    ram_background.color = "#757575"
                    ram_background.border.color = "#9E9E9E"

                    ram_name_value_rectangle.color = "#424242"
                    ram_name_value.color = "#BDBDBD"

                    ram_module_number_value_rectangle.color = "#424242"
                    ram_module_number_value.color = "#BDBDBD"

                    ram_memory_size_value_rectangle.color = "#424242"
                    ram_memory_size_value.color = "#BDBDBD"

                    ram_price_value_rectangle.color = "#424242"
                    ram_price_value.color = "#BDBDBD"

                    ram_buy_link_value_rectangle.color = "#424242"
                    ram_buy_link_value.color = "#BDBDBD"

                    ram_image_link_value_rectangle.color = "#424242"
                    ram_image_link_value.color = "#BDBDBD"

                    // GPU

                    gpu_background.color = "#757575"
                    gpu_background.border.color = "#9E9E9E"

                    gpu_name_value_rectangle.color = "#424242"
                    gpu_name_value.color = "#BDBDBD"

                    gpu_clock_value_rectangle.color = "#424242"
                    gpu_clock_value.color = "#BDBDBD"

                    gpu_boosted_clock_value_rectangle.color = "#424242"
                    gpu_boosted_clock_value.color = "#BDBDBD"

                    gpu_core_value_rectangle.color = "#424242"
                    gpu_core_value.color = "#BDBDBD"

                    gpu_ram_size_value_rectangle.color = "#424242"
                    gpu_ram_size_value.color = "#BDBDBD"

                    gpu_ram_speed_value_rectangle.color = "#424242"
                    gpu_ram_speed_value.color = "#BDBDBD"

                    gpu_flux_value_rectangle.color = "#424242"
                    gpu_flux_value.color = "#BDBDBD"

                    gpu_power_consumption_value_rectangle.color = "#424242"
                    gpu_power_consumption_value.color = "#BDBDBD"

                    gpu_price_value_rectangle.color = "#424242"
                    gpu_price_value.color = "#BDBDBD"

                    gpu_buy_link_value_rectangle.color = "#424242"
                    gpu_buy_link_value.color = "#BDBDBD"

                    gpu_image_link_value_rectangle.color = "#424242"
                    gpu_image_link_value.color = "#BDBDBD"


                    // STORAGE

                    storage_background.color = "#757575"
                    storage_background.border.color = "#9E9E9E"

                    storage_name_value_rectangle.color = "#424242"
                    storage_name_value.color = "#BDBDBD"

                    storage_read_speed_value_rectangle.color = "#424242"
                    storage_read_speed_value.color = "#BDBDBD"

                    storage_write_speed_value_rectangle.color = "#424242"
                    storage_write_speed_value.color = "#BDBDBD"

                    storage_capacity_value_rectangle.color = "#424242"
                    storage_capacity_value.color = "#BDBDBD"

                    storage_hdd_spindle_speed_value_rectangle.color = "#424242"
                    storage_hdd_spindle_speed_value.color = "#BDBDBD"

                    storage_price_value_rectangle.color = "#424242"
                    storage_price_value.color = "#BDBDBD"

                    storage_buy_link_value_rectangle.color = "#424242"
                    storage_buy_link_value.color = "#BDBDBD"

                    storage_image_link_value_rectangle.color = "#424242"
                    storage_image_link_value.color = "#BDBDBD"

                    // POWER SUPPLY
                    power_supply_background.color = "#757575"
                    power_supply_background.border.color = "#9E9E9E"

                    power_supply_name_value_rectangle.color = "#424242"
                    power_supply_name_value.color = "#BDBDBD"

                    power_supply_ATX24_value_rectangle.color = "#424242"
                    power_supply_ATX24_value.color = "#BDBDBD"

                    power_supply_molex4_value_rectangle.color = "#424242"
                    power_supply_molex4_value.color = "#BDBDBD"

                    power_supply_price_value_rectangle.color = "#424242"
                    power_supply_price_value.color = "#BDBDBD"

                    power_supply_ATX_4_value_rectangle.color = "#424242"
                    power_supply_ATX_4_value.color = "#BDBDBD"

                    power_supply_pcie6_2_value_rectangle.color = "#424242"
                    power_supply_pcie6_2_value.color = "#BDBDBD"

                    power_supply_sata_power_cable_value_rectangle.color = "#424242"
                    power_supply_sata_power_cable_value.color = "#BDBDBD"

                    power_supply_buy_link_value_rectangle.color = "#424242"
                    power_supply_buy_link_value.color = "#BDBDBD"

                    power_supply_image_link_value_rectangle.color = "#424242"
                    power_supply_image_link_value.color = "#BDBDBD"

                    // BUTTON AND VARIABLES
                    day_mode_button.text = "Night Mode"
                    day_mode = true
                }

            }
        }

        Button {
            id: create_componant_button
            width: 80

            anchors.right: parent.right
            anchors.rightMargin: 30
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

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
                            && storage_hdd_spindle_speed_value.text !== ""
                            && storage_price_value.text !== ""
                            && storage_buy_link_value.text !== ""
                            && storage_image_link_value.text !== "") {

                        create_item.create_storage(
                                    storage_name_value.text,
                                    storage_read_speed_value.text,
                                    storage_write_speed_value.text,
                                    storage_type_cbb.currentIndex,
                                    storage_capacity_cbb.currentIndex,
                                    storage_hdd_spindle_speed_value.text,
                                    storage_image_link_value.text,
                                    storage_price_value.text,
                                    storage_buy_link_value.text)

                        //reset value
                        storage_name_value.text = ""
                        storage_hdd_spindle_speed_value.text = ""
                        storage_price_value.text = ""
                        storage_buy_link_value.text = ""
                        storage_image_link_value.text = ""
                        storage_read_speed_value.text = ""
                        storage_write_speed_value.text = ""

                        storage_type_cbb.currentIndex = 0
                        storage_capacity_cbb.currentIndex = 0

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
    }

    Item {
        id: computer_case_rectangle

        height: 260
        anchors.top: main_rectangle.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0


        visible: true

        Rectangle {
            id: computer_case_background

            color: "#424242"
            anchors.fill: parent

            border.color: "#757575"
            border.width: 5
            radius: 20



            Text {
                id: computer_case_name_text
                x: 150

                width: 60
                height: 20

                text: qsTr("name :")
                font.pixelSize: 18

                anchors.left: parent.left
                anchors.leftMargin: (parent.width / 10)
                anchors.top: parent.top
                anchors.topMargin: 20
            }
            Rectangle {
                id: computer_case_name_value_rectangle
                height: 20

                anchors.right: parent.right
                anchors.rightMargin: (parent.width / 10)
                anchors.left: computer_case_name_text.right
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 20

                radius: 5
                color: "#757575"

                TextInput {
                    id: computer_case_name_value
                    text: qsTr("")
                    font.pixelSize: 18

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10

                    color: "black"
                }
            }

            Text {
                id: computer_case_supported_motherboard_format_text
                y: 64
                width: 340
                height: 20

                text: qsTr("SUPPORTED MOTHERBOARD FORMAT :")

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) - (width / 2) )

                font.pixelSize: 18

            }
            ComboBox {
                id: computer_case_supported_motherboard_cbb
                y: 90

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) - ( (width + computer_case_supported_motherboard_cbb.width) / 2) )

                model: ["ATX", "E_ATX", "Micro_ATX", "Mini_ATX"]
            }
            Button {
                id: computer_case_supported_motherboard_button
                x: 200
                y: 90
                text: qsTr("ADD")

                anchors.left: computer_case_supported_motherboard_cbb.right
                anchors.leftMargin: 10

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
                visible: false
                y: 140
                width: 60
                height: 40

                text: qsTr("ATX")
                leftPadding: 0
                font.pixelSize: 22

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.right: computer_case_supported_motherboard_E_ATX.left
                anchors.rightMargin: 20
            }
            Text {
                id: computer_case_supported_motherboard_E_ATX
                visible: false
                y: 140
                width: 80
                height: 40

                text: qsTr("E_ATX")
                leftPadding: 0
                font.pixelSize: 22

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) - (width + 10) )
            }
            Text {
                id: computer_case_supported_motherboard_Mini_ATX
                y: 140
                width: 120
                height: 40
                text: qsTr("Mini_ATX")
                visible: false
                verticalAlignment: Text.AlignVCenter
                leftPadding: 0
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) )

            }
            Text {
                id: computer_case_supported_motherboard_Micro_ATX
                visible: false
                y: 140
                width: 120
                height: 40
                text: qsTr("Micro_ATX")
                leftPadding: 0
                font.pixelSize: 22

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: computer_case_supported_motherboard_Mini_ATX.right
                anchors.leftMargin: 20
            }

            Text {
                id: computer_case_price_text
                height: 20

                text: qsTr("PRICE :")

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: computer_case_buy_link_text.top
                anchors.bottomMargin: 10

                font.pixelSize: 18
            }
            Rectangle {
                id: computer_case_price_value_rectangle
                height: 20
                width: 90

                anchors.left: computer_case_price_text.right
                anchors.leftMargin: 20
                anchors.bottom: computer_case_buy_link_value_rectangle.top
                anchors.bottomMargin: 10

                radius: 5
                color: "#757575"

                TextInput
                {
                    id: computer_case_price_value

                    color: "black"
                    font.pixelSize: 18
                    text: ""
                    maximumLength: 7
                    layer.enabled: true
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+\.[0-9]+/
                    }

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    anchors.fill: parent
                }
            }
            Text {
                id: computer_case_price_text_euro
                height: 20
                text: qsTr("€")
                font.pixelSize: 18

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                anchors.left: computer_case_price_value_rectangle.right
                anchors.leftMargin: 20
                anchors.bottom: computer_case_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: computer_case_buy_link_text
                height: 20

                text: qsTr("Buy link :")

                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: computer_case_image_link_text.top
                anchors.bottomMargin: 10


                font.pixelSize: 18
            }
            Rectangle {
                id: computer_case_buy_link_value_rectangle
                height: 20

                anchors.left: computer_case_buy_link_text.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.bottom: computer_case_image_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: computer_case_buy_link_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                }
            }

            Text {
                id: computer_case_image_link_text
                height: 20

                text: qsTr("Image link :")

                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20

                font.pixelSize: 18
            }
            Rectangle {
                id: computer_case_image_link_value_rectangle
                height: 20

                anchors.left: computer_case_image_link_text.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                radius: 5

                color: "#757575"

                TextInput
                {
                    id: computer_case_image_link_value

                    text: qsTr("")
                    color: "black"
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                }
            }
        }
    }

    Item {
        id: motherboard_rectangle

        anchors.top: main_rectangle.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

        visible: false

        Rectangle {
            id: motherboard_background

            color: "#424242"
            anchors.fill: parent

            border.color: "#757575"
            border.width: 5
            radius: 20

            Text {
                id: motherboard_name_text
                x: 150

                width: 60
                height: 20

                text: qsTr("name :")
                font.pixelSize: 18

                anchors.left: parent.left
                anchors.leftMargin: (parent.width / 10)
                anchors.top: parent.top
                anchors.topMargin: 20
            }
            Rectangle {
                id: motherboard_name_value_rectangle
                height: 20

                anchors.right: parent.right
                anchors.rightMargin: (parent.width / 10)
                anchors.left: motherboard_name_text.right
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 20

                radius: 5
                color: "#757575"

                TextInput {
                    id: motherboard_name_value
                    text: qsTr("")
                    font.pixelSize: 18

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10

                    color: "black"
                }
            }

            Text {
                id: motherboard_type_text
                width: motherboard_type_cbb.width
                height: 20
                text: qsTr("Format")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.right: motherboard_CPU_chipset_text.left
                anchors.rightMargin: 40
                anchors.bottom: motherboard_type_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: motherboard_type_cbb
                height: 30
                width: 120

                anchors.right: motherboard_CPU_chipset_cbb.left
                anchors.rightMargin: 40
                anchors.bottom: motherboard_power_pin_text.top
                anchors.bottomMargin: 10

                model: ["ATX", "E_ATX", "Micro_ATX", "Mini_ATX"]
            }

            Text {
                id: motherboard_CPU_chipset_text
                width: motherboard_CPU_chipset_cbb.width
                height: 20
                text: qsTr("CPU chipset")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.right: motherboard_RAM_type_text.left
                anchors.rightMargin: 40
                anchors.bottom: motherboard_CPU_chipset_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: motherboard_CPU_chipset_cbb
                height: 30
                width: 120

                anchors.right: motherboard_RAM_type_cbb.left
                anchors.rightMargin: 40
                anchors.bottom: ram_speed_supported_text_rectangle.top
                anchors.bottomMargin: 10

                model: ["AMD_A68H", "AMD_760G", "AMD_B350", "AMD_B450", "AMD_X399", "Intel_H110", "Intel_H270", "Intel_H310", "Intel_H370", "Intel_B150", "Intel_B250", "Intel_B360", "Intel_B365", "Intel_Z170", "Intel_Z270", "Intel_Z370", "Intel_Z390", "Intel_X99", "Intel_X299"]
            }

            Text {
                id: motherboard_RAM_type_text
                width: motherboard_RAM_type_cbb.width
                height: 20
                text: qsTr("RAM type")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) + 20)
                anchors.bottom: motherboard_RAM_type_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: motherboard_RAM_type_cbb
                height: 30
                width: 120

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) + 10)
                anchors.bottom: ram_speed_supported_text_rectangle.top
                anchors.bottomMargin: 10

                model: ["DDR3", "DDR4", "GDDR5", "GDDR5X", "GDDR6"]
            }

            Text {
                id: motherboard_CPU_socket_text
                width: motherboard_CPU_socket_cbb.width
                height: 20
                text: qsTr("CPU socket")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_RAM_type_text.right
                anchors.leftMargin: 40
                anchors.bottom: motherboard_CPU_socket_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: motherboard_CPU_socket_cbb
                height: 30
                width: 120

                anchors.left: motherboard_RAM_type_cbb.right
                anchors.leftMargin: 40
                anchors.bottom: ram_speed_supported_text_rectangle.top
                anchors.bottomMargin: 10

                model: ["AMD_AM2", "AMD_AM2_plus", "AMD_AM3", "AMD_AM3_plus", "AMD_AM4", "AMD_SP3", "AMD_sTR4", "AMD_sTRx4", "LGA_1150", "LGA_1151", "LGA_1155",
                    "LGA_1156", "LGA_1366", "LGA_2011", "LGA_2011_v3", "LGA_2066"]
            }

            Text {
                id: motherboard_power_pin_text
                width: motherboard_power_pin_cbb.width
                height: 20
                text: qsTr("POWER PIN")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: motherboard_power_pin_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: motherboard_power_pin_cbb
                height: 30
                width: 120

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: motherboard_RAM_slot_number_text.top
                anchors.bottomMargin: 10

                model: ["ATX 4 Pin", "ATX 4+4 Pin"]
            }

            Rectangle {
                id: ram_speed_supported_text_rectangle
                height: 50

                anchors.left: motherboard_power_pin_cbb.right
                anchors.leftMargin: 20
                anchors.right: parent.right
                anchors.rightMargin: 40
                anchors.top: motherboard_power_pin_text.top
                anchors.topMargin: 0
                anchors.bottom: motherboard_RAM_max_capacity_text.top
                anchors.bottomMargin: 10

                color: "#424242"
                radius: 5
                border.color: "#757575"
                border.width: 5

                Text
                {
                    id: ram_speed_supported_text

                    text: qsTr("Supported RAM speed : ")
                    font.pixelSize: 18
                    wrapMode: Text.WordWrap

                    anchors.fill: parent
                    anchors.margins: 10

                    color: "black"
                }

                MouseArea{
                    anchors.fill: parent

                    onClicked: {
                        motherboard_ram_speed_supported_rectangle.visible = true
                    }
                }
            }

            Text {
                id: motherboard_RAM_slot_number_text
                height: 20

                text: qsTr("RAM slot :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: motherboard_pcie20_slot_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: motherboard_RAM_slot_number_value_rectangle
                height: 20
                width: 30

                anchors.left: motherboard_RAM_slot_number_text.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_pcie20_16x_slot_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: motherboard_RAM_slot_number_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 1
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }


                    anchors.fill: parent
                }
            }

            Text {
                id: motherboard_RAM_max_capacity_text
                height: 20
                text: qsTr("MAX RAM :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_RAM_slot_number_value_rectangle.right
                anchors.leftMargin: 20
                anchors.bottom: motherboard_pcie20_16x_slot_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: motherboard_RAM_max_capacity_value_rectangle
                height: 20
                width: 40

                anchors.left: motherboard_RAM_max_capacity_text.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_pcie20_4x_slot_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: motherboard_RAM_max_capacity_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 3
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }


                    anchors.fill: parent
                }
            }
            Text {
                id: motherboard_RAM_max_capacity_Go_text
                height: 20
                text: qsTr("Go")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_RAM_max_capacity_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_pcie20_4x_slot_text.top
                anchors.bottomMargin: 10
            }

            Text {
                id: motherboard_RAM_max_per_slot_text
                height: 20
                text: qsTr("MAX RAM per slot :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_RAM_max_capacity_Go_text.right
                anchors.leftMargin: 20
                anchors.bottom: motherboard_pcie20_1x_slot_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: motherboard_RAM_max_per_slot_value_rectangle
                height: 20
                width: 40

                anchors.left: motherboard_RAM_max_per_slot_text.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_sata_slot_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: motherboard_RAM_max_per_slot_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 3
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }


                    anchors.fill: parent
                }
            }
            Text {
                id: motherboard_RAM_max_per_slot_Go_text
                height: 20
                text: qsTr("Go")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_RAM_max_per_slot_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_m2_slot_text.top
                anchors.bottomMargin: 10
            }

            Text {
                id: motherboard_pcie20_slot_text
                height: 20

                text: qsTr("PCIE 2.0 :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: motherboard_pcie30_slot_text.top
                anchors.bottomMargin: 10

            }
            Rectangle {
                id: motherboard_pcie20_16x_slot_value_rectangle
                height: 20
                width: 30

                anchors.left: motherboard_pcie20_slot_text.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_pcie30_16x_slot_value_rectangle.top
                anchors.bottomMargin: 10

                radius: 5

                color: "#757575"

                TextInput {
                    id: motherboard_pcie20_16x_slot_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 1
                    layer.enabled: true
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }

                    anchors.fill: parent

                }
            }
            Text {
                id: motherboard_pcie20_16x_slot_text
                height: 20
                text: qsTr("16x ")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_pcie20_16x_slot_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_pcie30_16x_slot_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: motherboard_pcie20_8x_slot_value_rectangle

                height: 20
                width: 30

                anchors.left: motherboard_pcie20_16x_slot_text.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_pcie30_8x_slot_value_rectangle.top
                anchors.bottomMargin: 10

                radius: 5

                color: "#757575"

                TextInput {
                    id: motherboard_pcie20_8x_slot_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 1
                    layer.enabled: true
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }

                    anchors.fill: parent

                }
            }
            Text {
                id: motherboard_pcie20_8x_slot_text
                height: 20
                text: qsTr("8x")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_pcie20_8x_slot_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_pcie30_8x_slot_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: motherboard_pcie20_4x_slot_value_rectangle

                height: 20
                width: 30

                anchors.left: motherboard_pcie20_8x_slot_text.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_pcie30_4x_slot_value_rectangle.top
                anchors.bottomMargin: 10

                radius: 5

                color: "#757575"

                TextInput {
                    id: motherboard_pcie20_4x_slot_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 1
                    layer.enabled: true
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }

                    anchors.fill: parent

                }
            }
            Text {
                id: motherboard_pcie20_4x_slot_text
                height: 20
                text: qsTr("4x")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_pcie20_4x_slot_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_pcie30_4x_slot_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: motherboard_pcie20_1x_slot_value_rectangle

                height: 20
                width: 30

                anchors.left: motherboard_pcie20_4x_slot_text.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_pcie30_1x_slot_value_rectangle.top
                anchors.bottomMargin: 10

                radius: 5

                color: "#757575"

                TextInput {
                    id: motherboard_pcie20_1x_slot_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 1
                    layer.enabled: true
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }

                    anchors.fill: parent

                }
            }
            Text {
                id: motherboard_pcie20_1x_slot_text
                height: 20
                text: qsTr("1x")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_pcie20_1x_slot_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_pcie30_1x_slot_text.top
                anchors.bottomMargin: 10
            }

            Text {
                id: motherboard_sata_slot_text
                height: 20
                text: qsTr("SATA slot :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_pcie20_1x_slot_text.right
                anchors.leftMargin: 20
                anchors.bottom: motherboard_price_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: motherboard_sata_slot_value_rectangle
                height: 20
                width: 30

                anchors.left: motherboard_sata_slot_text.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_price_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: motherboard_sata_slot_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 2
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }


                    anchors.fill: parent
                }
            }

            Text {
                id: motherboard_m2_slot_text
                height: 20
                text: qsTr("M.2 slot :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_sata_slot_value_rectangle.right
                anchors.leftMargin: 20
                anchors.bottom: motherboard_price_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: motherboard_m2_slot_value_rectangle
                height: 20
                width: 30

                anchors.left: motherboard_m2_slot_text.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 40
                anchors.bottom: motherboard_price_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: motherboard_m2_slot_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 1
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }


                    anchors.fill: parent
                }
            }

            Text {
                id: motherboard_pcie30_slot_text
                height: 20
                text: qsTr("PCIE 3.0 :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: motherboard_buy_link_text.top
                anchors.bottomMargin: 10

            }
            Rectangle {
                id: motherboard_pcie30_16x_slot_value_rectangle
                height: 20
                width: 30

                anchors.left: motherboard_pcie30_slot_text.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_buy_link_value_rectangle.top
                anchors.bottomMargin: 10

                radius: 5

                color: "#757575"

                TextInput {
                    id: motherboard_pcie30_16x_slot_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 1
                    layer.enabled: true
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }

                    anchors.fill: parent

                }
            }
            Text {
                id: motherboard_pcie30_16x_slot_text
                height: 20
                text: qsTr("16x ")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_pcie30_16x_slot_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: motherboard_pcie30_8x_slot_value_rectangle
                height: 20
                width: 30

                anchors.left: motherboard_pcie30_16x_slot_text.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_buy_link_value_rectangle.top
                anchors.bottomMargin: 10

                radius: 5

                color: "#757575"

                TextInput {
                    id: motherboard_pcie30_8x_slot_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 1
                    layer.enabled: true
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }

                    anchors.fill: parent

                }
            }
            Text {
                id: motherboard_pcie30_8x_slot_text
                height: 20
                text: qsTr("8x")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_pcie30_8x_slot_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: motherboard_pcie30_4x_slot_value_rectangle
                height: 20
                width: 30

                anchors.left: motherboard_pcie30_8x_slot_text.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_buy_link_value_rectangle.top
                anchors.bottomMargin: 10

                radius: 5

                color: "#757575"

                TextInput {
                    id: motherboard_pcie30_4x_slot_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 1
                    layer.enabled: true
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }

                    anchors.fill: parent

                }
            }
            Text {
                id: motherboard_pcie30_4x_slot_text
                height: 20
                text: qsTr("4x")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_pcie30_4x_slot_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: motherboard_pcie30_1x_slot_value_rectangle
                height: 20
                width: 30

                anchors.left: motherboard_pcie30_4x_slot_text.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_buy_link_value_rectangle.top
                anchors.bottomMargin: 10

                radius: 5

                color: "#757575"

                TextInput {
                    id: motherboard_pcie30_1x_slot_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 1
                    layer.enabled: true
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }

                    anchors.fill: parent

                }
            }
            Text {
                id: motherboard_pcie30_1x_slot_text
                height: 20
                text: qsTr("1x")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_pcie30_1x_slot_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: motherboard_price_text
                height: 20
                text: qsTr("PRICE :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_pcie30_1x_slot_text.right
                anchors.leftMargin: 30
                anchors.bottom: motherboard_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: motherboard_price_value_rectangle
                height: 20
                width: 90

                anchors.left: motherboard_price_text.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: motherboard_price_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 7
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+\.[0-9]+/
                    }

                    anchors.fill: parent
                }
            }
            Text {
                id: motherboard_price_euro_text
                height: 20
                text: qsTr("€")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_price_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: motherboard_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: motherboard_buy_link_text
                height: 20

                text: qsTr("Buy link :")

                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: motherboard_image_link_text.top
                anchors.bottomMargin: 10

                font.pixelSize: 18
            }
            Rectangle {
                id: motherboard_buy_link_value_rectangle
                height: 20

                anchors.left: motherboard_buy_link_text.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 40
                anchors.bottom: motherboard_image_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: motherboard_buy_link_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft
                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                }
            }

            Text {
                id: motherboard_image_link_text
                height: 20

                text: qsTr("Image link :")

                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20

                font.pixelSize: 18
            }
            Rectangle {
                id: motherboard_image_link_value_rectangle
                height: 20

                anchors.left: motherboard_image_link_text.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                radius: 5

                color: "#757575"

                TextInput
                {
                    id: motherboard_image_link_value

                    text: qsTr("")
                    color: "black"
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft
                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                }
            }

            Rectangle
            {
                id : motherboard_ram_speed_supported_rectangle

                anchors.fill: parent
                anchors.margins: 10

                visible: false

                color: motherboard_background.color

                // avoid to select item (like combobox) behind
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {

                    }
                }


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
    }

    Item {
        id: cpu_rectangle

        anchors.top: main_rectangle.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

        visible: false

        Rectangle {
            id: cpu_background

            color: "#424242"
            anchors.fill: parent

            border.color: "#757575"
            border.width: 5
            radius: 20

            Text {
                id: cpu_name_text
                x: 150

                width: 60
                height: 20

                text: qsTr("name :")
                font.pixelSize: 18

                anchors.left: parent.left
                anchors.leftMargin: (parent.width / 10)
                anchors.top: parent.top
                anchors.topMargin: 20
            }
            Rectangle {
                id: cpu_name_value_rectangle
                height: 20

                anchors.right: parent.right
                anchors.rightMargin: (parent.width / 10)
                anchors.left: cpu_name_text.right
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 20

                radius: 5
                color: "#757575"

                TextInput {
                    id: cpu_name_value
                    text: qsTr("")
                    font.pixelSize: 18

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10

                    color: "black"
                }
            }

            Text {
                id: cpu_socket_text
                width: cpu_socket_cbb.width
                height: 20
                text: qsTr("SOCKET")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.right: cpu_RAM_speed_text.left
                anchors.rightMargin: 40
                anchors.bottom: cpu_socket_cbb.top
                anchors.bottomMargin: 10

            }
            ComboBox {
                id: cpu_socket_cbb
                height: 30
                width: 120

                anchors.right: cpu_RAM_speed_cbb.left
                anchors.rightMargin: 40
                anchors.bottom: cpu_supported_chipset_text_rectangle.top
                anchors.bottomMargin: 20

                model: ["AMD_AM2", "AMD_AM2_plus", "AMD_AM3", "AMD_AM3_plus", "AMD_AM4", "AMD_SP3", "AMD_sTR4", "AMD_sTRx4", "LGA_1150", "LGA_1151", "LGA_1155",
                    "LGA_1156", "LGA_1366", "LGA_2011", "LGA_2011_v3", "LGA_2066"]
            }

            Text {
                id: cpu_RAM_speed_text
                width: cpu_RAM_speed_cbb.width
                height: 20
                text: qsTr("Max RAM Speed")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) - (width / 2) )
                anchors.bottom: cpu_RAM_speed_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: cpu_RAM_speed_cbb
                height: 30
                width: 120

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) - (width / 2) )
                anchors.bottom: cpu_supported_chipset_text_rectangle.top
                anchors.bottomMargin: 20

                model: ["1066 Mhz","1333 Mhz","1600 Mhz","1866 Mhz","2133 Mhz","2400 Mhz","2666 Mhz","2800 Mhz",
                    "2933 Mhz","3000 Mhz","3200 Mhz","3300 Mhz","3333 Mhz","3400 Mhz","3466 Mhz","3600 Mhz",
                    "3666 Mhz","3733 Mhz","3800 Mhz","3866 Mhz","4000 Mhz","4133 Mhz","4200 Mhz","4266 Mhz",
                    "4300 Mhz","4333 Mhz","4400 Mhz","4500 Mhz","4600 Mhz","4700 Mhz","4800 Mhz"]
            }

            Text {
                id: cpu_RAM_type_text
                width: cpu_RAM_type_cbb.width
                height: 20
                text: qsTr("RAM type")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cpu_RAM_speed_text.right
                anchors.leftMargin: 40
                anchors.bottom: cpu_RAM_type_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: cpu_RAM_type_cbb
                height: 30
                width: 120

                anchors.left: cpu_RAM_speed_cbb.right
                anchors.leftMargin: 40
                anchors.bottom: cpu_supported_chipset_text_rectangle.top
                anchors.bottomMargin: 20

                model: ["DDR3", "DDR4", "GDDR5", "GDDR5X", "GDDR6"]
            }

            Rectangle {
                id: cpu_supported_chipset_text_rectangle
                height: 70

                anchors.right: parent.right
                anchors.rightMargin: 75
                anchors.left: parent.left
                anchors.leftMargin: 75
                anchors.bottom: cpu_clock_speed_text.top
                anchors.bottomMargin: 20

                color: "#616161"
                radius: 5
                border.color: "#757575"
                border.width: 5


                Text{
                    id: cpu_supported_chipset_text

                    text: "Supported Chipset : "
                    font.pixelSize: 18
                    wrapMode: Text.WordWrap
                    color: "black"

                    anchors.fill: parent
                    anchors.margins: 10
                }


                MouseArea{
                    anchors.fill: parent

                    onClicked: {
                        cpu_supported_chipset_rectangle.visible = true
                    }
                }
            }

            Text {
                id: cpu_core_text
                height: 20
                text: qsTr("CORE :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.bottom: cpu_thread_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: cpu_core_value_rectangle

                height: 20
                width: 40

                anchors.left: cpu_core_text.right
                anchors.leftMargin: 10
                anchors.bottom: cpu_thread_text.top
                anchors.bottomMargin: 10

                radius: 5

                color: "#757575"

                TextInput {
                    id: cpu_core_value
                    text: qsTr("")
                    font.pixelSize: 18

                    color: "black"

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 3
                    layer.enabled: true
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }

                    anchors.fill: parent

                }
            }

            Text {
                id: cpu_clock_speed_text
                height: 20
                text: qsTr("CLK Speed :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cpu_core_value_rectangle.right
                anchors.leftMargin: 30
                anchors.bottom: cpu_thread_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: cpu_clock_speed_value_rectangle

                height: 20
                width: 60

                anchors.left: cpu_clock_speed_text.right
                anchors.leftMargin: 10
                anchors.bottom: cpu_thread_text.top
                anchors.bottomMargin: 10

                radius: 5

                color: "#757575"

                TextInput {
                    id: cpu_clock_speed_value
                    text: qsTr("")
                    font.pixelSize: 18

                    color: "black"

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 5
                    layer.enabled: true
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }

                    anchors.fill: parent

                }
            }
            Text {
                id: cpu_clock_speed_Mhz_text
                height: 20
                text: qsTr("Mhz")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cpu_clock_speed_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: cpu_thread_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: cpu_boosted_speed_text
                height: 20
                text: qsTr("Boosted speed :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cpu_clock_speed_Mhz_text.right
                anchors.leftMargin: 30
                anchors.bottom: cpu_price_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: cpu_boosted_speed_value_rectangle

                height: 20
                width: 60

                anchors.left: cpu_boosted_speed_text.right
                anchors.leftMargin: 10
                anchors.bottom: cpu_price_text.top
                anchors.bottomMargin: 10

                radius: 5

                color: "#757575"

                TextInput {
                    id: cpu_boosted_speed_value
                    text: qsTr("")
                    font.pixelSize: 18

                    color: "black"

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 5
                    layer.enabled: true
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }

                    anchors.fill: parent

                }
            }
            Text {
                id: cpu_boosted_speed_Mhz_text
                height: 20
                text: qsTr("Mhz")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cpu_boosted_speed_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: cpu_price_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: cpu_thread_text
                height: 20
                text: qsTr("THREAD :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: cpu_buy_link_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: cpu_thread_value_rectangle
                height: 20
                width: 40

                anchors.left: cpu_thread_text.right
                anchors.leftMargin: 10
                anchors.bottom: cpu_buy_link_value_rectangle.top
                anchors.bottomMargin: 10

                radius: 5

                color: "#757575"

                TextInput {
                    id: cpu_thread_value
                    text: qsTr("")
                    font.pixelSize: 18

                    color: "black"

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 3
                    layer.enabled: true
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }

                    anchors.fill: parent

                }
            }

            Text {
                id: cpu_cache_L3_text
                height: 20
                text: qsTr("CACHE L3 :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cpu_thread_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: cpu_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: cpu_cache_L3_value_rectangle
                height: 20
                width: 40

                anchors.left: cpu_cache_L3_text.right
                anchors.leftMargin: 10
                anchors.bottom: cpu_buy_link_value_rectangle.top
                anchors.bottomMargin: 10

                radius: 5

                color: "#757575"

                TextInput {
                    id: cpu_cache_L3_value
                    text: qsTr("")
                    font.pixelSize: 18

                    color: "black"

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 3
                    layer.enabled: true
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }

                    anchors.fill: parent

                }
            }
            Text {
                id: cpu_cache_L3_MB_text
                height: 20
                text: qsTr("MB")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cpu_cache_L3_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: cpu_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: cpu_TDP_text
                height: 20
                text: qsTr("TDP :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cpu_cache_L3_MB_text.right
                anchors.leftMargin: 10
                anchors.bottom: cpu_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: cpu_TDP_value_rectangle
                height: 20
                width: 40

                anchors.left: cpu_TDP_text.right
                anchors.leftMargin: 10
                anchors.bottom: cpu_buy_link_value_rectangle.top
                anchors.bottomMargin: 10

                radius: 5

                color: "#757575"

                TextInput {
                    id: cpu_TDP_value
                    text: qsTr("")
                    font.pixelSize: 18

                    color: "black"

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 3
                    layer.enabled: true
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }

                    anchors.fill: parent

                }
            }
            Text {
                id: cpu_TDP_W_text
                height: 20
                text: qsTr("W")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cpu_TDP_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: cpu_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: cpu_price_text
                height: 20
                text: qsTr("PRICE :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cpu_TDP_W_text.right
                anchors.leftMargin: 10
                anchors.bottom: cpu_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: cpu_price_value_rectangle
                height: 20
                width: 90

                anchors.left: cpu_price_text.right
                anchors.leftMargin: 5
                anchors.bottom: cpu_buy_link_value_rectangle.top
                anchors.bottomMargin: 10

                radius: 5

                color: "#757575"

                TextInput {
                    id: cpu_price_value
                    text: qsTr("")
                    font.pixelSize: 18

                    color: "black"

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    maximumLength: 7
                    layer.enabled: true
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+\.[0-9]+/
                    }

                    anchors.fill: parent

                }
            }
            Text {
                id: cpu_price_euro_text
                height: 20
                text: qsTr("€")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cpu_price_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: cpu_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: cpu_buy_link_text
                height: 20

                text: qsTr("Buy link :")

                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: cpu_image_link_text.top
                anchors.bottomMargin: 10


                font.pixelSize: 18
            }
            Rectangle {
                id: cpu_buy_link_value_rectangle
                height: 20

                anchors.left: cpu_buy_link_text.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.bottom: cpu_image_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: cpu_buy_link_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                }
            }

            Text {
                id: cpu_image_link_text
                height: 20

                text: qsTr("Image link :")

                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20

                font.pixelSize: 18
            }
            Rectangle {
                id: cpu_image_link_value_rectangle
                height: 20

                anchors.left: cpu_image_link_text.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                radius: 5

                color: "#757575"

                TextInput
                {
                    id: cpu_image_link_value

                    text: qsTr("")
                    color: "black"
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                }
            }


            Rectangle
            {
                id : cpu_supported_chipset_rectangle

                anchors.fill: parent
                anchors.margins: 10

                visible: false

                color: parent.color

                // avoid to select item (like combobox) behind
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {

                    }
                }

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
    }

    Item {
        id: cooling_rectangle
        height: 280

        anchors.top: main_rectangle.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        visible: false

        Rectangle {
            id: cooling_background

            color: "#424242"
            anchors.fill: parent

            border.color: "#757575"
            border.width: 5
            radius: 20

            Text {
                id: cooling_name_text
                x: 150

                width: 60
                height: 20

                text: qsTr("name :")
                font.pixelSize: 18

                anchors.left: parent.left
                anchors.leftMargin: (parent.width / 10)
                anchors.top: parent.top
                anchors.topMargin: 20
            }
            Rectangle {
                id: cooling_name_value_rectangle
                height: 20

                anchors.right: parent.right
                anchors.rightMargin: (parent.width / 10)
                anchors.left: cooling_name_text.right
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 20

                radius: 5
                color: "#757575"

                TextInput {
                    id: cooling_name_value
                    text: qsTr("")
                    font.pixelSize: 18

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10

                    color: "black"
                }
            }

            Text {
                id: cooling_fan_size_text
                width: cooling_fan_size_cbb.width
                height: 20
                text: qsTr("FAN Diameter")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: cooling_fan_size_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: cooling_fan_size_cbb
                height: 30
                width: 120

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: cooling_fan_min_sound_text.top
                anchors.bottomMargin: 20
                model: ["120mm", "140mm", "240mm", "280mm", "360mm", "420mm"]
            }

            Rectangle {
                id: cooling_supported_socket_text_rectangle
                height: 70

                anchors.right: parent.right
                anchors.rightMargin: 40
                anchors.left: cooling_fan_size_cbb.right
                anchors.leftMargin: 30
                anchors.bottom: cooling_fan_max_sound_text.top
                anchors.bottomMargin: 20

                color: "#616161"
                radius: 5
                border.color: "#757575"
                border.width: 5

                Text{
                    id: cooling_supported_socket_text
                    text: "Supported Socket : "
                    wrapMode: Text.WordWrap
                    font.pixelSize: 18
                    color: "black"

                    anchors.fill: parent
                    anchors.margins: 10
                }

                MouseArea{
                    anchors.fill: parent

                    onClicked: {
                        cooling_supported_socket_rectangle.visible = true
                    }
                }
            }

            Text {
                id: cooling_fan_min_sound_text
                width: 130
                height: 20
                text: qsTr("fan min sound :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.bottom: cooling_fan_min_speed_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: cooling_fan_min_sound_value_rectangle
                height: 20
                width: 60

                anchors.left: cooling_fan_min_sound_text.right
                anchors.leftMargin: 10
                anchors.bottom: cooling_fan_min_speed_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: cooling_fan_min_sound_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    maximumLength: 4
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+\.[0-9]+/
                    }

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: cooling_fan_min_sound_DB_text
                height: 20
                text: qsTr("DB")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cooling_fan_min_sound_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: cooling_fan_min_speed_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: cooling_fan_max_sound_text
                height: 20
                text: qsTr("fan max sound :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cooling_fan_min_sound_DB_text.right
                anchors.leftMargin: 20
                anchors.bottom: cooling_fan_max_speed_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: cooling_fan_max_sound_value_rectangle
                height: 20
                width: 60

                anchors.left: cooling_fan_max_sound_text.right
                anchors.leftMargin: 10
                anchors.bottom: cooling_fan_max_speed_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: cooling_fan_max_sound_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    maximumLength: 4
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+\.[0-9]+/
                    }

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: cooling_fan_max_sound_DB_text
                height: 20
                text: qsTr("DB")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cooling_fan_max_sound_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: cooling_air_flow_CFM_text.top
                anchors.bottomMargin: 10
            }

            Text {
                id: cooling_price_text
                height: 20
                text: qsTr("PRICE :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cooling_fan_max_sound_DB_text.right
                anchors.leftMargin: 20
                anchors.bottom: cooling_air_flow_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: cooling_price_value_rectangle
                height: 20
                width: 90

                anchors.left: cooling_price_text.right
                anchors.leftMargin: 10
                anchors.bottom: cooling_air_flow_text.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: cooling_price_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    maximumLength: 7
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+\.[0-9]+/
                    }

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: cooling_price_euro_text
                height: 20
                text: qsTr("€")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cooling_price_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: cooling_air_flow_text.top
                anchors.bottomMargin: 10
            }

            Text {
                id: cooling_fan_min_speed_text
                height: 20
                text: qsTr("fan min speed :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.bottom: cooling_buy_link_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: cooling_fan_min_speed_value_rectangle
                height: 20
                width: 60

                anchors.left: cooling_fan_min_speed_text.right
                anchors.leftMargin: 10
                anchors.bottom: cooling_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: cooling_fan_min_speed_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    maximumLength: 5
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: cooling_fan_min_speed_RPM_text
                x: 276
                y: 210
                height: 20
                text: qsTr("RPM")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cooling_fan_min_speed_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: cooling_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: cooling_fan_max_speed_text
                height: 20
                text: qsTr("fan max speed :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cooling_fan_min_speed_RPM_text.right
                anchors.leftMargin: 20
                anchors.bottom: cooling_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: cooling_fan_max_speed_value_rectangle
                height: 20
                width: 60

                anchors.left: cooling_fan_max_speed_text.right
                anchors.leftMargin: 10
                anchors.bottom: cooling_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: cooling_fan_max_speed_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    maximumLength: 5
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: cooling_fan_max_speed_RPM_text
                height: 20
                text: qsTr("RPM")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cooling_fan_max_speed_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: cooling_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: cooling_air_flow_text
                height: 20
                text: qsTr("AIR flow :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cooling_fan_max_speed_RPM_text.right
                anchors.leftMargin: 20
                anchors.bottom: cooling_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: cooling_air_flow_value_rectangle
                height: 20
                width: 60

                anchors.left: cooling_air_flow_text.right
                anchors.leftMargin: 10
                anchors.bottom: cooling_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: cooling_air_flow_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    maximumLength: 5
                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+\.[0-9]+/
                    }

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: cooling_air_flow_CFM_text
                height: 20
                text: qsTr("CFM")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: cooling_air_flow_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: cooling_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: cooling_buy_link_text
                height: 20

                text: qsTr("Buy link :")

                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: cooling_image_link_text.top
                anchors.bottomMargin: 10


                font.pixelSize: 18
            }
            Rectangle {
                id: cooling_buy_link_value_rectangle
                height: 20

                anchors.left: cooling_buy_link_text.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.bottom: cooling_image_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: cooling_buy_link_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                }
            }

            Text {
                id: cooling_image_link_text
                height: 20

                text: qsTr("Image link :")

                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20

                font.pixelSize: 18
            }
            Rectangle {
                id: cooling_image_link_value_rectangle
                height: 20

                anchors.left: cooling_image_link_text.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                radius: 5

                color: "#757575"

                TextInput
                {
                    id: cooling_image_link_value

                    text: qsTr("")
                    color: "black"
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                }
            }

            Rectangle
            {
                id : cooling_supported_socket_rectangle

                anchors.fill: parent
                anchors.margins: 10

                visible: false

                color: parent.color

                // avoid to select item (like combobox) behind
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {

                    }
                }

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
    }

    Item {
        id: ram_rectangle
        height: 250

        anchors.top: main_rectangle.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        visible: false

        Rectangle {
            id: ram_background

            color: "#424242"
            anchors.fill: parent

            border.color: "#757575"
            border.width: 5
            radius: 20

            Text {
                id: ram_name_text
                x: 150

                width: 60
                height: 20

                text: qsTr("name :")
                font.pixelSize: 18

                anchors.left: parent.left
                anchors.leftMargin: (parent.width / 10)
                anchors.top: parent.top
                anchors.topMargin: 20
            }
            Rectangle {
                id: ram_name_value_rectangle
                height: 20

                anchors.right: parent.right
                anchors.rightMargin: (parent.width / 10)
                anchors.left: ram_name_text.right
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 20

                radius: 5
                color: "#757575"

                TextInput {
                    id: ram_name_value
                    text: qsTr("")
                    font.pixelSize: 18

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10

                    color: "black"
                }
            }

            Text {
                id: ram_memory_type_text
                width: ram_memory_type_cbb.width
                height: 20
                text: qsTr("RAM type")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.right: ram_cas_latency_text.left
                anchors.rightMargin: 40
                anchors.bottom: ram_memory_type_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: ram_memory_type_cbb
                height: 30
                width: 120

                anchors.right: ram_cas_latency_cbb.left
                anchors.rightMargin: 40
                anchors.bottom: ram_module_number_text.top
                anchors.bottomMargin: 30

                model: ["DDR3", "DDR4", "GDDR5", "GDDR5X", "GDDR6"]
            }

            Text {
                id: ram_cas_latency_text
                width: ram_cas_latency_cbb.width
                height: 20
                text: qsTr("CAS latency")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) - (width / 2) )
                anchors.bottom: ram_cas_latency_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: ram_cas_latency_cbb
                height: 30
                width: 120

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) - (width / 2) )
                anchors.bottom: ram_memory_size_text.top
                anchors.bottomMargin: 30

                model: ["CL 22", "CL 21", "CL 20", "CL 19", "CL 18", "CL 17", "CL 16", "CL 15", "CL 14",
                    "CL 13", "CL 12", "CL 11", "CL 10"]
            }

            Text {
                id: ram_memory_speed_text
                width: ram_memory_speed_cbb.width
                height: 20
                text: qsTr("memory speed")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: ram_cas_latency_text.right
                anchors.leftMargin: 40
                anchors.bottom: ram_memory_speed_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: ram_memory_speed_cbb
                height: 30
                width: 120

                anchors.left: ram_cas_latency_cbb.right
                anchors.leftMargin: 40
                anchors.bottom: ram_price_text.top
                anchors.bottomMargin: 30

                model: ["1066Mhz","1333Mhz","1600Mhz","1866Mhz","2133Mhz","2400Mhz","2666Mhz","2800Mhz",
                    "2933Mhz","3000Mhz","3200Mhz","3300Mhz","3333Mhz","3400Mhz","3466Mhz","3600Mhz",
                    "3666Mhz","3733Mhz","3800Mhz","3866Mhz","4000Mhz","4133Mhz","4200Mhz","4266Mhz",
                    "4300Mhz","4333Mhz","4400Mhz","4500Mhz","4600Mhz","4700Mhz","4800Mhz"]
            }

            Text {
                id: ram_module_number_text
                height: 20
                text: qsTr("Number of Modules :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: ram_buy_link_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: ram_module_number_value_rectangle
                height: 20
                width: 30

                anchors.left: ram_module_number_text.right
                anchors.leftMargin: 10
                anchors.bottom: ram_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: ram_module_number_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }
                    maximumLength: 1

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }

            Text {
                id: ram_memory_size_text
                height: 20
                text: qsTr("Total Memory :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: ram_module_number_value_rectangle.right
                anchors.leftMargin: 20
                anchors.bottom: ram_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: ram_memory_size_value_rectangle
                height: 20
                width: 40

                anchors.left: ram_memory_size_text.right
                anchors.leftMargin: 10
                anchors.bottom: ram_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: ram_memory_size_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }
                    maximumLength: 3

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: ram_memory_size_GB_text
                height: 20
                text: qsTr("GB")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: ram_memory_size_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: ram_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: ram_price_text
                height: 20
                text: qsTr("PRICE :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: ram_memory_size_GB_text.right
                anchors.leftMargin: 20
                anchors.bottom: ram_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: ram_price_value_rectangle
                height: 20
                width: 90

                anchors.left: ram_price_text.right
                anchors.leftMargin: 10
                anchors.bottom: ram_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: ram_price_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+\.[0-9]+/
                    }
                    maximumLength: 7

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: ram_price_euro_text
                height: 20
                text: qsTr("€")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: ram_price_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: ram_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: ram_buy_link_text
                height: 20

                text: qsTr("Buy link :")

                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: ram_image_link_text.top
                anchors.bottomMargin: 10


                font.pixelSize: 18
            }
            Rectangle {
                id: ram_buy_link_value_rectangle
                height: 20

                anchors.left: ram_buy_link_text.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 40
                anchors.bottom: ram_image_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: ram_buy_link_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                }
            }

            Text {
                id: ram_image_link_text
                height: 20

                text: qsTr("Image link :")

                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20

                font.pixelSize: 18
            }
            Rectangle {
                id: ram_image_link_value_rectangle
                height: 20

                anchors.left: ram_image_link_text.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                radius: 5

                color: "#757575"

                TextInput
                {
                    id: ram_image_link_value

                    text: qsTr("")
                    color: "black"
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                }
            }

        }
    }

    Item {
        id: gpu_rectangle
        height: 310

        anchors.top: main_rectangle.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        visible: false

        Rectangle {
            id: gpu_background

            color: "#424242"
            anchors.fill: parent

            border.color: "#757575"
            border.width: 5
            radius: 20

            Text {
                id: gpu_name_text
                x: 150

                width: 60
                height: 20

                text: qsTr("name :")
                font.pixelSize: 18

                anchors.left: parent.left
                anchors.leftMargin: (parent.width / 10)
                anchors.top: parent.top
                anchors.topMargin: 20
            }
            Rectangle {
                id: gpu_name_value_rectangle
                height: 20

                anchors.right: parent.right
                anchors.rightMargin: (parent.width / 10)
                anchors.left: gpu_name_text.right
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 20

                radius: 5
                color: "#757575"

                TextInput {
                    id: gpu_name_value
                    text: qsTr("")
                    font.pixelSize: 18

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10

                    color: "black"
                }
            }

            Text {
                id: gpu_bus_text
                width: gpu_bus_cbb.width
                height: 20
                text: qsTr("GPU bus")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.right: gpu_power_cable_pin_text.left
                anchors.rightMargin: 40
                anchors.bottom: gpu_power_cable_pin_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: gpu_bus_cbb
                height: 30
                width: 130

                anchors.right: gpu_power_cable_pin_cbb.left
                anchors.rightMargin: 40
                anchors.bottom: gpu_boosted_clock_text.top
                anchors.bottomMargin: 30

                model: ["PCIE_2_0_16x", "PCIE_2_0_8x", "PCIE_2_0_4x", "PCIE_2_0_1x","PCIE_3_0_16x", "PCIE_3_0_8x", "PCIE_3_0_4x", "PCIE_3_0_1x"]
            }

            Text {
                id: gpu_power_cable_pin_text
                width: gpu_power_cable_pin_cbb.width
                height: 20
                text: qsTr("Power pin")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) - (width / 2) )
                anchors.bottom: gpu_power_cable_pin_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: gpu_power_cable_pin_cbb
                height: 30
                width: 120

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) - (width / 2) )
                anchors.bottom: gpu_boosted_clock_text.top
                anchors.bottomMargin: 30

                model: ["PCIE_8", "PCIE_8_8", "NONE"]
            }

            Text {
                id: gpu_RAM_type_text
                width: gpu_RAM_type_cbb.width
                height: 20
                text: qsTr("RAM type")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: gpu_power_cable_pin_text.right
                anchors.leftMargin: 40
                anchors.bottom: gpu_RAM_type_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: gpu_RAM_type_cbb
                height: 30
                width: 120

                anchors.left: gpu_power_cable_pin_cbb.right
                anchors.leftMargin: 40
                anchors.bottom: gpu_boosted_clock_text.top
                anchors.bottomMargin: 30

                model: ["DDR3", "DDR4", "GDDR5", "GDDR5X", "GDDR6"]
            }

            Text {
                id: gpu_clock_text
                height: 20
                text: qsTr("GPU clock :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: gpu_bus_text.x
                anchors.bottom: gpu_core_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: gpu_clock_value_rectangle
                height: 20
                width: 60

                anchors.left: gpu_clock_text.right
                anchors.leftMargin: 10
                anchors.bottom: gpu_core_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: gpu_clock_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }
                    maximumLength: 5

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: gpu_clock_Mhz_text
                height: 20
                text: qsTr("Mhz")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: gpu_clock_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: gpu_ram_size_text.top
                anchors.bottomMargin: 10
            }

            Text {
                id: gpu_boosted_clock_text
                height: 20
                text: qsTr("GPU boost clock :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: gpu_clock_Mhz_text.right
                anchors.leftMargin: 20
                anchors.bottom: gpu_ram_size_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: gpu_boosted_clock_value_rectangle
                height: 20
                width: 60

                anchors.left: gpu_boosted_clock_text.right
                anchors.leftMargin: 10
                anchors.bottom: gpu_ram_size_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: gpu_boosted_clock_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }
                    maximumLength: 5

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: gpu_boosted_clock_Mhz_text
                height: 20
                text: qsTr("Mhz")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: gpu_boosted_clock_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: gpu_ram_speed_text.top
                anchors.bottomMargin: 10
            }

            Text {
                id: gpu_core_text
                height: 20
                text: qsTr("GPU core :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: 70
                anchors.bottom: gpu_flux_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: gpu_core_value_rectangle
                height: 20
                width: 30

                anchors.left: gpu_core_text.right
                anchors.leftMargin: 10
                anchors.bottom: gpu_flux_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: gpu_core_value
                    color: "black"
                    text: qsTr("1")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }
                    maximumLength: 2

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }

            Text {
                id: gpu_ram_size_text
                height: 20
                text: qsTr("GPU RAM size :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: gpu_core_value_rectangle.right
                anchors.leftMargin: 20
                anchors.bottom: gpu_power_consumption_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: gpu_ram_size_value_rectangle
                height: 20
                width: 30

                anchors.left: gpu_ram_size_text.right
                anchors.leftMargin: 10
                anchors.bottom: gpu_power_consumption_text.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: gpu_ram_size_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }
                    maximumLength: 2

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: gpu_ram_size_GB_text
                height: 20
                text: qsTr("GB")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: gpu_ram_size_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: gpu_power_consumption_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: gpu_ram_speed_text
                height: 20
                text: qsTr("GPU RAM speed :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: gpu_ram_size_GB_text.right
                anchors.leftMargin: 20
                anchors.bottom: gpu_price_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: gpu_ram_speed_value_rectangle
                height: 20
                width: 60

                anchors.left: gpu_ram_speed_text.right
                anchors.leftMargin: 10
                anchors.bottom: gpu_price_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: gpu_ram_speed_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }
                    maximumLength: 5

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: gpu_ram_speed_Mhz_text
                height: 20
                text: qsTr("Mhz")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: gpu_ram_speed_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: gpu_price_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: gpu_flux_text
                height: 20
                text: qsTr("Flux :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: gpu_buy_link_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: gpu_flux_value_rectangle
                height: 20
                width: 60

                anchors.left: gpu_flux_text.right
                anchors.leftMargin: 10
                anchors.bottom: gpu_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: gpu_flux_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }
                    maximumLength: 5

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }

            Text {
                id: gpu_power_consumption_text
                height: 20
                text: qsTr("power consumption :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: gpu_flux_value_rectangle.right
                anchors.leftMargin: 20
                anchors.bottom: gpu_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: gpu_power_consumption_value_rectangle
                height: 20
                width: 40

                anchors.left: gpu_power_consumption_text.right
                anchors.leftMargin: 10
                anchors.bottom: gpu_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: gpu_power_consumption_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }
                    maximumLength: 3

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: gpu_power_consumption_W_text
                height: 20
                text: qsTr("W")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: gpu_power_consumption_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: gpu_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: gpu_price_text
                height: 20
                text: qsTr("PRICE :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: gpu_power_consumption_W_text.right
                anchors.leftMargin: 20
                anchors.bottom: gpu_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: gpu_price_value_rectangle
                height: 20
                width: 90

                anchors.left: gpu_price_text.right
                anchors.leftMargin: 10
                anchors.bottom: gpu_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: gpu_price_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+\.[0-9]+/
                    }
                    maximumLength: 7

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: gpu_price_euro_text
                height: 20
                text: qsTr("€")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: gpu_price_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: gpu_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: gpu_buy_link_text
                height: 20

                text: qsTr("Buy link :")

                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: gpu_image_link_text.top
                anchors.bottomMargin: 10


                font.pixelSize: 18
            }
            Rectangle {
                id: gpu_buy_link_value_rectangle
                height: 20

                anchors.left: gpu_buy_link_text.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 40
                anchors.bottom: gpu_image_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: gpu_buy_link_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                }
            }

            Text {
                id: gpu_image_link_text
                height: 20

                text: qsTr("Image link :")

                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20

                font.pixelSize: 18
            }
            Rectangle {
                id: gpu_image_link_value_rectangle
                height: 20

                anchors.left: gpu_image_link_text.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                radius: 5

                color: "#757575"

                TextInput
                {
                    id: gpu_image_link_value

                    text: qsTr("")
                    color: "black"
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                }
            }

        }
    }

    Item {
        id: storage_rectangle
        height: 280

        anchors.top: main_rectangle.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        visible: false

        Rectangle {
            id: storage_background

            color: "#424242"
            anchors.fill: parent

            border.color: "#757575"
            border.width: 5
            radius: 20

            Text {
                id: storage_name_text
                x: 150

                width: 60
                height: 20

                text: qsTr("name :")
                font.pixelSize: 18

                anchors.left: parent.left
                anchors.leftMargin: (parent.width / 10)
                anchors.top: parent.top
                anchors.topMargin: 20
            }
            Rectangle {
                id: storage_name_value_rectangle
                height: 20

                anchors.right: parent.right
                anchors.rightMargin: (parent.width / 10)
                anchors.left: storage_name_text.right
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 20

                radius: 5
                color: "#757575"

                TextInput {
                    id: storage_name_value
                    text: qsTr("")
                    font.pixelSize: 18

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10

                    color: "black"
                    clip: true
                }
            }

            Text {
                id: storage_type_text
                width: storage_type_cbb.width
                height: 20
                text: qsTr("Type")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.right: parent.right
                anchors.rightMargin: ( (parent.width / 2) + (width / 2) )
                anchors.bottom: storage_type_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: storage_type_cbb
                height: 30
                width: 120

                anchors.right: parent.right
                anchors.rightMargin: ( (parent.width / 2) + (width / 2) )
                anchors.bottom: storage_write_speed_text.top
                anchors.bottomMargin: 30

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
                        storage_hdd_spindle_speed_value_rectangle.visible = false
                    }
                }
            }

            Text {
                id: storage_capacity_text
                width: storage_capacity_cbb.width
                height: 20
                text: qsTr("Capacity :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) + (width / 2) )
                anchors.bottom: storage_capacity_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: storage_capacity_cbb
                height: 30
                width: 120

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) + (width / 2) )
                anchors.bottom: storage_write_speed_text.top
                anchors.bottomMargin: 30

                model: ["120GB","250GB","500GB","1TB", "2TB","4TB","8TB"]
            }

            Text {
                id: storage_read_speed_text
                height: 20
                text: qsTr("Read Speed :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: storage_hdd_spindle_speed_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: storage_read_speed_value_rectangle
                height: 20
                width: 60

                anchors.left: storage_read_speed_text.right
                anchors.leftMargin: 10
                anchors.bottom: storage_hdd_spindle_speed_text.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: storage_read_speed_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }
                    maximumLength: 5

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: storage_read_speed_GB_s_text
                height: 20
                text: qsTr("MB/s")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: storage_read_speed_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: storage_hdd_spindle_speed_text.top
                anchors.bottomMargin: 10
            }

            Text {
                id: storage_write_speed_text
                height: 20
                text: qsTr("Write Speed :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) + 30)
                anchors.bottom: storage_hdd_spindle_speed_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: storage_write_speed_value_rectangle
                height: 20
                width: 60

                anchors.left: storage_write_speed_text.right
                anchors.leftMargin: 10
                anchors.bottom: storage_hdd_spindle_speed_text.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: storage_write_speed_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }
                    maximumLength: 5

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: storage_write_speed_GB_s_text
                height: 20
                text: qsTr("MB/s")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: storage_write_speed_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: storage_hdd_spindle_speed_text.top
                anchors.bottomMargin: 10
            }

            Text {
                id: storage_hdd_spindle_speed_text
                height: 20
                text: qsTr("Spindle speed:")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: storage_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: storage_hdd_spindle_speed_value_rectangle
                height: 20
                width: 60

                anchors.left: storage_hdd_spindle_speed_text.right
                anchors.leftMargin: 10
                anchors.bottom: storage_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: storage_hdd_spindle_speed_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }
                    maximumLength: 5

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: storage_hdd_spindle_speed_RPM_text
                height: 20
                text: qsTr("RPM")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: storage_hdd_spindle_speed_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: storage_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: storage_price_text
                height: 20
                text: qsTr("PRICE :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) + 30)
                anchors.bottom: storage_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: storage_price_value_rectangle
                height: 20
                width: 90

                anchors.left: storage_price_text.right
                anchors.leftMargin: 10
                anchors.bottom: storage_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: storage_price_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+\.[0-9]+/
                    }
                    maximumLength: 7

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: storage_price_euro_text
                height: 20
                text: qsTr("€")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: storage_price_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: storage_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }

            Text {
                id: storage_buy_link_text
                height: 20

                text: qsTr("Buy link :")

                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: storage_image_link_text.top
                anchors.bottomMargin: 10


                font.pixelSize: 18
            }
            Rectangle {
                id: storage_buy_link_value_rectangle
                height: 20

                anchors.left: storage_buy_link_text.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 40
                anchors.bottom: storage_image_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: storage_buy_link_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                }
            }

            Text {
                id: storage_image_link_text
                height: 20

                text: qsTr("Image link :")

                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20

                font.pixelSize: 18
            }
            Rectangle {
                id: storage_image_link_value_rectangle
                height: 20

                anchors.left: storage_image_link_text.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                radius: 5

                color: "#757575"

                TextInput
                {
                    id: storage_image_link_value

                    text: qsTr("")
                    color: "black"
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                }
            }

        }
    }

    Item {
        id: power_supply_rectangle
        height: 280

        anchors.top: main_rectangle.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        visible: false

        Rectangle {
            id: power_supply_background

            color: "#424242"
            anchors.fill: parent

            border.color: "#757575"
            border.width: 5
            radius: 20

            Text {
                id: power_supply_name_text
                x: 150

                width: 60
                height: 20

                text: qsTr("name :")
                font.pixelSize: 18

                anchors.left: parent.left
                anchors.leftMargin: (parent.width / 10)
                anchors.top: parent.top
                anchors.topMargin: 20
            }
            Rectangle {
                id: power_supply_name_value_rectangle
                height: 20

                anchors.right: parent.right
                anchors.rightMargin: (parent.width / 10)
                anchors.left: power_supply_name_text.right
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 20

                radius: 5
                color: "#757575"

                TextInput {
                    id: power_supply_name_value
                    text: qsTr("")
                    font.pixelSize: 18

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10

                    color: "black"
                }
            }

            Text {
                id: power_supply_power_text
                width: power_supply_power_cbb.width
                height: 20
                text: qsTr("POWER")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.right: power_supply_standard_text.left
                anchors.rightMargin: 60
                anchors.bottom: power_supply_power_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: power_supply_power_cbb
                height: 30
                width: 120

                anchors.right: power_supply_standard_cbb.left
                anchors.rightMargin: 60
                anchors.bottom: power_supply_molex4_text.top
                anchors.bottomMargin: 30

                model: ["300 W", "350 W", "400 W", "450 W", "500 W", "550 W", "600 W", "650 W", "700 W", "750 W", "800 W", "850 W",
                    "900 W", "950 W", "1000 W", "1100 W", "1200 W", "1300 W", "1400 W", "1500 W", "1600 W"]
            }

            Text {
                id: power_supply_standard_text
                width: power_supply_standard_cbb.width
                height: 20
                text: qsTr("STANDARD")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) + 30 )
                anchors.bottom: power_supply_standard_cbb.top
                anchors.bottomMargin: 10
            }
            ComboBox {
                id: power_supply_standard_cbb
                height: 30
                width: 120

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) + 30 )
                anchors.bottom: power_supply_molex4_text.top
                anchors.bottomMargin: 30

                model: ["plus_80", "plus_80_bronze", "plus_80_silver", "plus_80_gold", "plus_80_platinium", "plus_80_titanium"]
            }

            Text {
                id: power_supply_ATX24_text
                height: 20
                text: qsTr("ATX 24 pin cable :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: power_supply_sata_power_cable_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: power_supply_ATX24_value_rectangle
                height: 20
                width: 30

                anchors.left: power_supply_ATX24_text.right
                anchors.leftMargin: 10
                anchors.bottom: power_supply_sata_power_cable_text.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: power_supply_ATX24_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }
                    maximumLength: 2

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }

            Text {
                id: power_supply_molex4_text
                height: 20
                text: qsTr("Molex 4 pin cable :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: power_supply_ATX24_value_rectangle.right
                anchors.leftMargin: 20
                anchors.bottom: power_supply_sata_power_cable_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: power_supply_molex4_value_rectangle
                height: 20
                width: 30

                anchors.left: power_supply_molex4_text.right
                anchors.leftMargin: 10
                anchors.bottom: power_supply_sata_power_cable_text.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: power_supply_molex4_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }
                    maximumLength: 2

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }

            Text {
                id: power_supply_price_text
                height: 20
                text: qsTr("PRICE :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: power_supply_molex4_value_rectangle.right
                anchors.leftMargin: 20
                anchors.bottom: power_supply_sata_power_cable_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: power_supply_price_value_rectangle
                height: 20
                width: 90

                anchors.left: power_supply_price_text.right
                anchors.leftMargin: 10
                anchors.bottom: power_supply_sata_power_cable_text.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: power_supply_price_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+\.[0-9]+/
                    }
                    maximumLength: 7

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            Text {
                id: power_supply_price_euro_text
                height: 20
                text: qsTr("€")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: power_supply_price_value_rectangle.right
                anchors.leftMargin: 10
                anchors.bottom: power_supply_sata_power_cable_text.top
                anchors.bottomMargin: 10
            }

            Text {
                id: power_supply_ATX_4_text
                height: 20
                text: qsTr("ATX 4 pin power cable :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: power_supply_buy_link_text.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: power_supply_ATX_4_value_rectangle
                height: 20
                width: 30

                anchors.left: power_supply_ATX_4_text.right
                anchors.leftMargin: 10
                anchors.bottom: power_supply_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: power_supply_ATX_4_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }
                    maximumLength: 2

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }

            Text {
                id: power_supply_pcie6_2_text
                height: 20
                text: qsTr("PCIE 6+2 cable :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: power_supply_ATX_4_value_rectangle.right
                anchors.leftMargin: 20
                anchors.bottom: power_supply_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: power_supply_pcie6_2_value_rectangle
                height: 20
                width: 30

                anchors.left: power_supply_pcie6_2_text.right
                anchors.leftMargin: 10
                anchors.bottom: power_supply_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: power_supply_pcie6_2_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }
                    maximumLength: 2

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }

            Text {
                id: power_supply_sata_power_cable_text
                height: 20
                text: qsTr("SATA Power cable :")
                font.pixelSize: 18

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: power_supply_pcie6_2_value_rectangle.right
                anchors.leftMargin: 20
                anchors.bottom: power_supply_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
            }
            Rectangle {
                id: power_supply_sata_power_cable_value_rectangle
                height: 20
                width: 30

                anchors.left: power_supply_sata_power_cable_text.right
                anchors.leftMargin: 10
                anchors.bottom: power_supply_buy_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: power_supply_sata_power_cable_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    validator: RegExpValidator {
                        regExp: /[1-9]+[0-9]+/
                    }
                    maximumLength: 2

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }

            Text {
                id: power_supply_buy_link_text
                height: 20

                text: qsTr("Buy link :")

                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: power_supply_image_link_text.top
                anchors.bottomMargin: 10


                font.pixelSize: 18
            }
            Rectangle {
                id: power_supply_buy_link_value_rectangle
                height: 20

                anchors.left: power_supply_buy_link_text.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 30
                anchors.bottom: power_supply_image_link_value_rectangle.top
                anchors.bottomMargin: 10
                radius: 5

                color: "#757575"

                TextInput{
                    id: power_supply_buy_link_value
                    color: "black"
                    text: qsTr("")
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                }
            }

            Text {
                id: power_supply_image_link_text
                height: 20

                text: qsTr("Image link :")

                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft

                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20

                font.pixelSize: 18
            }
            Rectangle {
                id: power_supply_image_link_value_rectangle
                height: 20

                anchors.left: power_supply_image_link_text.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 30
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                radius: 5

                color: "#757575"

                TextInput
                {
                    id: power_supply_image_link_value

                    text: qsTr("")
                    color: "black"
                    font.pixelSize: 18
                    layer.enabled: true

                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft

                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                }
            }

        }
    }


}

/*##^##
Designer {
    D{i:131;invisible:true}D{i:132;invisible:true}D{i:28;invisible:true}D{i:199;invisible:true}
D{i:200;invisible:true}D{i:133;invisible:true}D{i:258;invisible:true}D{i:259;invisible:true}
D{i:201;invisible:true}
}
##^##*/

