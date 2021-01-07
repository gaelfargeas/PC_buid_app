import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.13
import Main_class 1.0
import QtQuick.Dialogs 1.0
import Image_qml 1.0
import QtWebView 1.14


ApplicationWindow {
    id: main_window
    visible: true
    width: 1920
    height: 1000
    //title: qsTr("PC BUILDER APP")

    color: "#121212"

    property bool day_mode: false
    property int component_index: 0

    property string computer_case_selected_image_link: ""
    property BorderImage computer_case_selected_image_border: null
    property string computer_case_selected_name:""
    property string computer_case_selected_supporter_motherboard_size : ""


    property string motherboard_selected_image_link: ""
    property BorderImage motherboard_selected_image_border: null
    property string motherboard_selected_name : ""
    property string motherboard_selected_socket : ""
    property string motherboard_selected_chipset : ""
    property string motherboard_selected_ram_type : ""
    property string motherboard_selected_ram_supported_speed : ""
    property int motherboard_selected_ram_slot : 0
    property int motherboard_selected_ram_size_per_slot: 0
    property int motherboard_selected_pcie20_16x : 0
    property int motherboard_selected_pcie20_8x : 0
    property int motherboard_selected_pcie20_4x : 0
    property int motherboard_selected_pcie20_1x : 0
    property int motherboard_selected_pcie30_16x : 0
    property int motherboard_selected_pcie30_8x : 0
    property int motherboard_selected_pcie30_4x : 0
    property int motherboard_selected_pcie30_1x : 0
    property int motherboard_selected_M2_slot : 0
    property int motherboard_selected_sata_slot : 0
    property int motherboard_used_ram_slot: 0
    property int motherboard_used_sata_slot: 0
    property int motherboard_used_M2_slot: 0
    property int motherboard_used_pcie_16x: 0
    property int motherboard_used_pcie_8x: 0
    property int motherboard_used_pcie_4x: 0
    property int motherboard_used_pcie_1x: 0


    property string cpu_selected_image_link: ""
    property BorderImage cpu_selected_image_border: null
    property string cpu_selected_name: ""
    property string cpu_selected_supported_ram : ""


    property string cooling_selected_image_link: ""
    property BorderImage cooling_selected_image_border: null
    property string cooling_selected_name: ""


    property BorderImage ram_selected_image_border: null
    property var rams_selected_name: []
    property var rams_selected_image: []
    property var rams_selected_module: []


    property BorderImage gpu_selected_image_border: null
    property var gpus_selected_name: []
    property var gpus_selected_image: []
    property var gpus_selected_bus: []


    property BorderImage storage_selected_image_border: null
    property var storages_selected_name: []
    property var storages_selected_image: []
    property var storages_selected_type: []


    property string power_supply_selected_image_link: ""
    property BorderImage power_supply_selected_image_border: null
    property string power_supply_selected_name: ""

    menuBar: MenuBar {
        id: menubar
        Menu {
            title:  qsTr("Options")
            Action {
                id: menu_next
                text: qsTr("Next Component")
                onTriggered: function_object.next_component()


            }
            Action {
                id: menu_previous
                text: qsTr("Previous Component")
                enabled: false

                onTriggered: function_object.previous_component()
            }
            Action {
                id: menu_select
                text: qsTr("select Component")

                onTriggered: {
                    component_index = 8
                    function_object.load_component_grid(component_index)
                }
            }
            MenuSeparator { }
            Action {
                id: menu_clear_selected
                text: qsTr("Clear Selected Components")

                onTriggered:
                {
                    function_object.clear_current_build_grid()
                    function_object.clear_current_build()
                    function_object.set_component_index(8)
                    function_object.load_component_grid(8)

                    motherboard_used_M2_slot = 0
                    motherboard_used_sata_slot = 0
                    motherboard_used_ram_slot = 0

                }
            }
            MenuSeparator { }
            Action {
                text: qsTr("Quit")
                onTriggered: Qt.quit()
            }
        }

        Menu {
            title:  qsTr("Tools")
            Action {
                text: qsTr("Add component")
                onTriggered: create_new_component_window.visible = true
            }
            Action {
                text: qsTr("Import Components")
                onTriggered : import_fileDialog.open()
            }
            Action {
                text: qsTr("Export Components")
                onTriggered : export_fileDialog.open()
            }
            MenuSeparator { }
            Action {
                text: qsTr("Day Mode")

                onTriggered :
                {
                    function_object.change_day_mode()
                    if(day_mode === true)
                    {
                        text = "Dark Mode"
                    }
                    else
                    {
                        text = "Day Mode"
                    }

                    function_object.reload_current_build_grid()
                    function_object.load_component_grid(component_index)
                }
            }
            MenuSeparator { }
            Action {
                text: qsTr("test")
                onTriggered : test_window.visible = true
            }
        }
        Menu {
            title: qsTr("&Help")
            Action { text: qsTr("&About") }
        }
    }

    FileDialog {
        width: 0
        height: 0
        id: import_fileDialog
        title: "Please choose the import json file"
        folder: shortcuts.home
        selectMultiple : false
        nameFilters: [ "json (*.json)"]
        selectExisting : true
        visible : false
        onAccepted: {
            main_class.import_component(import_fileDialog.fileUrl)
            visible = false

        }
        onRejected:
        {
            visible = false
        }
    }

    FileDialog {
        width: 0
        height: 0
        id: export_fileDialog
        title: "Please choose the export json file"
        folder: shortcuts.home
        selectExisting : false
        selectMultiple : false
        nameFilters: [ "json (*.json)"]

        visible : false
        onAccepted: {
            main_class.export_component(export_fileDialog.fileUrl)
            visible = false

        }
        onRejected:
        {
            visible = false
        }

    }

    Main_class{
        id: main_class
    }

    Image_qml
    {
        id: image_qml
    }

    Rectangle {
        id: rectangle_main_title
        y: 20
        height: 50
        color: "#424242"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.leftMargin: 0

        Text {
            id: main_title
            text: qsTr("PC BUILDER")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            font.pixelSize: 28
            color: "#E0E0E0"
        }
    }

    Flickable{
        id : flickable_element
        x: 20
        y: 80
        width: 1880
        height: 220
        contentWidth: 200
        contentHeight: 200

        flickableDirection: Flickable.HorizontalFlick
        clip: true
        boundsMovement: Flickable.StopAtBounds

        ScrollBar.horizontal: ScrollBar {
            id: hbar
            parent: flickable_element.parent
            anchors.top: flickable_element.top
            anchors.left: flickable_element.left
            anchors.right: flickable_element.right
            policy: ScrollBar.AlwaysOn

        }

        Grid {
            id: current_build_grid
            anchors.topMargin: 20
            anchors.fill: parent
            rows: 1
            spacing: 10

            onChildrenChanged:
            {

                flickable_element.contentWidth = current_build_grid.children.length * 210
                hbar.setSize(1.0 / current_build_grid.children.length)
            }
        }


    }

    Rectangle {
        id: rectangle_current_component_type
        y: 300
        height: 50
        color: "#424242"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.leftMargin: 0

        Text {
            id: current_composent_type
            text: qsTr("COMPUTER CASE")
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 28
            color: "#E0E0E0"
        }

    }

    Rectangle
    {
        id: rectangle_error
        height: 30

        anchors.top: rectangle_current_component_type.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 50

        radius: 20

        color: "#424242"

        Text {
            id: rectangle_error_text
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 28
            color: "#FF0000"
        }
    }

    Rectangle {
        id: current_composent_option_rect
        height: 50
        color: "#424242"
        anchors.top: rectangle_error.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 50

        border.color: "#757575"
        border.width: 5
        radius: 20


        RoundButton {
            id: current_composent_option_finish_button
            width: current_composent_option_finish_textmetrics.advanceWidth + 40
            text: qsTr("make PDF")
            font.pointSize: 18

            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10

            radius: 20

            background: Rectangle {
                id : current_composent_option_finish_button_background
                radius: current_composent_option_finish_button.radius
                color: "#E0E0E0"
            }


            onClicked:
            {
                main_class.createPDF(computer_case_selected_name, motherboard_selected_name,cpu_selected_name,
                                     cooling_selected_name,rams_selected_name,gpus_selected_name,
                                     storages_selected_name,power_supply_selected_name)
            }

            TextMetrics{
                id: current_composent_option_finish_textmetrics
                font: current_composent_option_finish_button.font
                text: current_composent_option_finish_button.text
            }
        }

        RoundButton {
            id: current_composent_option_next_button
            width: current_composent_option_next_textmetrics.advanceWidth + 40
            text: qsTr("NEXT")
            font.pointSize: 18
            visible: false

            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: current_composent_option_finish_button.right
            anchors.leftMargin: 20

            radius: 20

            background: Rectangle {
                id : current_composent_option_next_button_background
                radius: current_composent_option_next_button.radius
                color: "#E0E0E0"
            }


            onClicked:
            {
                function_object.next_component()
            }

            TextMetrics{
                id: current_composent_option_next_textmetrics
                font: current_composent_option_next_button.font
                text: current_composent_option_next_button.text
            }
        }

        TextInput {
            id: current_composent_option_filter_name_value
            width: 410

            text: qsTr("")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft

            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: 10

            font.pixelSize: 24
            clip: true
            color: "#E0E0E0"

            onTextEdited:
            {
                function_object.load_component_grid(component_index)
            }
        }

        Text {
            id: current_composent_option_filter_name_text
            x: 1340
            width: 70
            text: qsTr("Name :")

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: current_composent_option_filter_name_value.left
            anchors.rightMargin: 10

            font.pixelSize: 18
            color: "#E0E0E0"
        }

        Rectangle{
            id: computer_case_filter_rectangle
            visible: true

            anchors.right: current_composent_option_filter_name_text.left
            anchors.rightMargin: 50
            anchors.left: current_composent_option_finish_button.right
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

            color: "transparent"


            Text {
                id: computer_case_motherboard_size_filter_text
                height: 50
                text: qsTr("Supported Motherboard Size : ")

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) - (width / 2) )
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                font.pixelSize: 18
                layer.enabled: true

                color: "#E0E0E0"

            }
            ComboBox{
                id: computer_case_motherboard_size_filter_cbb
                width: 140
                anchors.left: computer_case_motherboard_size_filter_text.right
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                model: ["","ATX","E_ATX","Micro_ATX","Mini_ATX"]

                onCurrentIndexChanged: function_object.load_component_grid(component_index)

                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    id : computer_case_motherboard_size_filter_cbb_background
                    color: "#E0E0E0"
                }
            }
        }

        Rectangle{
            id: motherboard_filter_rectangle
            visible: false

            anchors.right: current_composent_option_filter_name_text.left
            anchors.rightMargin: 50
            anchors.left: current_composent_option_finish_button.right
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

            color: "transparent"


            Text {
                id: motherboard_ram_filter_text
                text: qsTr("RAM : ")

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.right: motherboard_ram_filter_cbb.left
                anchors.rightMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                font.pixelSize: 18
                layer.enabled: true
                color: "#E0E0E0"

            }
            ComboBox{
                id: motherboard_ram_filter_cbb
                width: 140
                anchors.right: motherboard_socket_filter_text.left
                anchors.rightMargin: (parent.width / 10)
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                model: ["", "DDR3", "DDR4", "GDDR5", "GDDR5X", "GDDR6"]

                onCurrentIndexChanged: function_object.load_component_grid(component_index)

                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    id : motherboard_ram_filter_cbb_background
                    color: "#E0E0E0"
                }

            }

            Text {
                id: motherboard_socket_filter_text
                text: qsTr("Socket : ")

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.right: motherboard_socket_filter_cbb.left
                anchors.rightMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                font.pixelSize: 18
                layer.enabled: true
                color: "#E0E0E0"

            }
            ComboBox{
                id: motherboard_socket_filter_cbb
                width: 140
                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) - ( width / 2 ) )
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                model: ["","AMD_AM2", "AMD_AM2_plus", "AMD_AM3", "AMD_AM3_plus", "AMD_AM4", "AMD_SP3", "AMD_sTR4",
                    "AMD_sTRx4", "LGA_1150", "LGA_1151", "LGA_1155", "LGA_1156", "LGA_1366", "LGA_2011", "LGA_2011_v3",
                    "LGA_2066"]

                onCurrentIndexChanged: function_object.load_component_grid(component_index)

                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    id : motherboard_socket_filter_cbb_background
                    color: "#E0E0E0"
                }
            }

            Text {
                id: motherboard_chipset_filter_text
                text: qsTr("chipset : ")

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: motherboard_socket_filter_cbb.right
                anchors.leftMargin: (parent.width / 10)
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                font.pixelSize: 18
                layer.enabled: true
                color: "#E0E0E0"

            }
            ComboBox{
                id: motherboard_chipset_filter_cbb
                width: 140
                anchors.left: motherboard_chipset_filter_text.right
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                model: ["","AMD_A68H", "AMD_760G", "AMD_B350", "AMD_B450", "AMD_X399", "Intel_H110", "Intel_H270", "Intel_H310",
                    "Intel_H370", "Intel_B150", "Intel_B250", "Intel_B360", "Intel_B365", "Intel_Z170", "Intel_Z270",
                    "Intel_Z370", "Intel_Z390", "Intel_X99", "Intel_X299"]

                onCurrentIndexChanged: function_object.load_component_grid(component_index)

                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    id : motherboard_chipset_filter_cbb_background
                    color: "#E0E0E0"
                }

            }

        }

        Rectangle{
            id: cpu_filter_rectangle
            visible: false

            anchors.right: current_composent_option_filter_name_text.left
            anchors.rightMargin: 50
            anchors.left: current_composent_option_finish_button.right
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

            color: "transparent"

        }

        Rectangle{
            id: cooling_filter_rectangle
            visible: false

            anchors.right: current_composent_option_filter_name_text.left
            anchors.rightMargin: 50
            anchors.left: current_composent_option_finish_button.right
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

            color: "transparent"

            Text {
                id: cooling_fan_size_filter_text
                text: qsTr("Fan Size : ")

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) - (width / 2) )
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                font.pixelSize: 18
                layer.enabled: true
                color: "#E0E0E0"

            }
            ComboBox{
                id: cooling_fan_size_filter_cbb
                width: 140
                anchors.left: cooling_fan_size_filter_text.right
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                model: ["","120mm","140mm","240mm","280mm","360mm","420mm"]

                onCurrentIndexChanged: function_object.load_component_grid(component_index)

                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    id : cooling_fan_size_filter_cbb_background
                    color: "#E0E0E0"
                }
            }
        }

        Rectangle{
            id: ram_filter_rectangle
            visible: false

            anchors.right: current_composent_option_filter_name_text.left
            anchors.rightMargin: 50
            anchors.left: current_composent_option_finish_button.right
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

            color: "transparent"

            Text {
                id: ram_memory_size_filter_text
                text: qsTr("Total Memory Size : ")

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) - (width / 2) )
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                font.pixelSize: 18
                layer.enabled: true
                color: "#E0E0E0"

            }
            ComboBox{
                id: ram_memory_size_filter_cbb
                width: 140
                anchors.left: ram_memory_size_filter_text.right
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                model: ["","1","2","4","8","16","32","64","128"]

                onCurrentIndexChanged: function_object.load_component_grid(component_index)

                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    id : ram_memory_size_filter_cbb_background
                    color: "#E0E0E0"
                }


            }


        }

        Rectangle{
            id: gpu_filter_rectangle
            visible: false

            anchors.right: current_composent_option_filter_name_text.left
            anchors.rightMargin: 50
            anchors.left: current_composent_option_finish_button.right
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

            color: "transparent"

            Text {
                id: gpu_RAM_filter_text
                text: qsTr("RAM Type : ")

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.right: gpu_ram_filter_cbb.left
                anchors.rightMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                font.pixelSize: 18
                layer.enabled: true
                color: "#E0E0E0"

            }
            ComboBox{
                id: gpu_ram_filter_cbb
                width: 140
                anchors.right: gpu_power_cable_filter_text.left
                anchors.rightMargin: (parent.width / 10)
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                model: ["","DDR3","DDR4","GDDR5","GDDR5X","GDDR6"]

                onCurrentIndexChanged: function_object.load_component_grid(component_index)

                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    id : gpu_ram_filter_cbb_background
                    color: "#E0E0E0"
                }
            }

            Text {
                id: gpu_power_cable_filter_text
                text: "Power Cable Pin"

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) + (parent.width / 20) )
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                font.pixelSize: 18
                layer.enabled: true
                color: "#E0E0E0"

            }
            ComboBox{
                id: gpu_power_cable_filter_cbb
                width: 140
                anchors.left: gpu_power_cable_filter_text.right
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                model: ["","PCIE_8","PCIE_8_8","NONE"]

                onCurrentIndexChanged: function_object.load_component_grid(component_index)

                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    id : gpu_power_cable_filter_cbb_background
                    color: "#E0E0E0"
                }
            }
        }

        Rectangle{
            id: storage_filter_rectangle
            visible: false

            anchors.right: current_composent_option_filter_name_text.left
            anchors.rightMargin: 50
            anchors.left: current_composent_option_finish_button.right
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

            color: "transparent"

            Text {
                id: storage_type_filter_text
                text: qsTr("Storage Type : ")

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.right: storage_type_filter_cbb.left
                anchors.rightMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                font.pixelSize: 18
                layer.enabled: true
                color: "#E0E0E0"

            }
            ComboBox{
                id: storage_type_filter_cbb
                width: 140
                anchors.right: storage_capacity_filter_text.left
                anchors.rightMargin: (parent.width / 10)
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                model: ["","HDD","SSD","M_2"]

                onCurrentIndexChanged: function_object.load_component_grid(component_index)

                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    id : storage_type_filter_cbb_background
                    color: "#E0E0E0"
                }
            }

            Text {
                id: storage_capacity_filter_text
                text: qsTr("Storage Type : ")

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) + (parent.width / 20) )
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                font.pixelSize: 18
                layer.enabled: true
                color: "#E0E0E0"

            }
            ComboBox{
                id: storage_capacity_filter_cbb
                width: 140
                anchors.left: storage_capacity_filter_text.right
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                model: ["","120GB","250GB","500GB","1TB", "2TB","4TB","8TB"]

                onCurrentIndexChanged: function_object.load_component_grid(component_index)

                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    id : storage_capacity_filter_cbb_background
                    color: "#E0E0E0"
                }
            }

        }

        Rectangle{
            id: power_supply_filter_rectangle
            visible: false

            anchors.right: current_composent_option_filter_name_text.left
            anchors.rightMargin: 50
            anchors.left: current_composent_option_finish_button.right
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

            color: "transparent"

            Text {
                id: power_supply_standard_filter_text
                text: qsTr("STANDARD : ")

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.right: power_supply_standard_filter_cbb.left
                anchors.rightMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                font.pixelSize: 18
                layer.enabled: true
                color: "#E0E0E0"

            }
            ComboBox{
                id: power_supply_standard_filter_cbb
                width: 140
                anchors.right: power_supply_power_filter_text.left
                anchors.rightMargin: (parent.width / 10)
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                model: ["", "plus_80", "plus_80_bronze", "plus_80_silver", "plus_80_gold", "plus_80_platinium", "plus_80_titanium"]

                onCurrentIndexChanged: function_object.load_component_grid(component_index)

                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    id : power_supply_standard_filter_cbb_background
                    color: "#E0E0E0"
                }
            }

            Text {
                id: power_supply_power_filter_text
                text: "POWER (W)"

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                anchors.left: parent.left
                anchors.leftMargin: ( (parent.width / 2) + (parent.width / 20) )
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                font.pixelSize: 18
                layer.enabled: true
                color: "#E0E0E0"

            }
            ComboBox{
                id: power_supply_power_filter_cbb
                width: 140
                anchors.left: power_supply_power_filter_text.right
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2

                model: ["", "W300", "W350", "W400", "W450", "W500", "W550", "W600", "W650", "W700", "W750", "W800", "W850",
                    "W900", "W950", "W1000", "W1100", "W1200", "W1300", "W1400", "W1500", "W1600"]

                onCurrentIndexChanged: function_object.load_component_grid(component_index)

                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    id : power_supply_power_filter_cbb_background
                    color: "#E0E0E0"
                }
            }

        }

        Rectangle {
            id: build_finish_filter_rectangle
            visible: false

            anchors.right: current_composent_option_filter_name_text.left
            anchors.rightMargin: 50
            anchors.left: current_composent_option_finish_button.right
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

            color: "transparent"

        }

    }

    Grid {
        id: component_grid

        anchors.top: current_composent_option_rect.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50


    }

    Text {
        id: element1_todolist
        x: 50
        y: 868
        width: 1820
        height: 100
        enabled: false
        text: qsTr("cpu: chipset graphique ?.
if pas de item a load : passe au suivant (probleme : doit etre que si tous les slot son use)
pcie slot a refaire (dans add component)
power supply filter with sata power needed
power supply filter gpu power cable needed
power supply filter motherboard power cable needed
powersupply needed power system ( voir si c'est possible : du coup add dans add componant le needed power pour cpu/gpu)
motherboard power cable : defois 4 pin defois 8
pdf wiewer qml
image_buy web link (met internet link : si arrive pas a avoir : cherche image dans dossier image)
fenetre qui permet de verif la compatibilite entre 2 composant jor motherboard/cpu (3 colone 1mb, 2, cpu , 3 compatible ou pas) .
")
        wrapMode: Text.WordWrap
        font.pixelSize: 28
        color: "white"

        Image {
            // test image with url as source
            id: test_image
            anchors.fill: parent

            source: "https://www.corsair.com/medias/sys_master/images/images/he1/hf6/9110705307678/-CMK16GX4M2B3000C15-Gallery-VENG-LPX-BLK-00.png"
            //source: "https://images.pexels.com/photos/1115090/pexels-photo-1115090.jpeg?cs=srgb&dl=beautiful-flowers-bloom-blossom-1115090.jpg&fm=jpg"
            autoTransform: false
            fillMode : Image.Stretch

            //cache: true
            //asynchronous: true
        }
    }

    Window{
        id: create_new_component_window
        width: 740
        height: 520
        visible: false

        minimumHeight: 520
        maximumHeight: 520
        minimumWidth: 740
        maximumWidth: 740

        Loader {
            id: loader_add_component;
            anchors.fill: parent
            source:  "add_new_component_view.qml"
            onLoaded:
            {
                loader_add_component.item.main_class_object = main_class;
                loader_add_component.item.day_mode = day_mode;
            }
        }
    }

    Window{
        id: test_window
        width: 740
        height: 520
        visible: false

        minimumHeight: 520
        maximumHeight: 520
        minimumWidth: 740
        maximumWidth: 740

        Loader {
            id: loader_test;
            anchors.fill: parent
            source:  "pdf_viewer.qml"

        }
    }

    Item {
        id : function_object

        function set_component_index(int_value)
        {
            if (int_value >= 0)
            {
                if(int_value <= 8)
                {
                    component_index = int_value
                }
            }
        }

        function previous_component()
        {
            if (component_index > 0)
            {
                component_index -=1
            }

            load_component_grid(component_index)


            if (component_index === 0 )
            {
                menu_previous.enabled = false
            }
            if (component_index !== 8 )
            {
                menu_next.enabled = true
            }

        }

        function next_component()
        {
            if (component_index < 8)
            {
                component_index +=1

            }

            load_component_grid(component_index)

            if (component_index === 8 )
            {
                menu_next.enabled = false
            }
            if (component_index !== 0 )
            {
                menu_previous.enabled = true
            }
        }

        function load_component_grid(int_value)
        {
            function_object.clear_component_grid()
            var name_filter = current_composent_option_filter_name_value.text

            current_composent_option_next_button.visible = false

            if(int_value === 0)
            {
                // COMPUTER CASE
                current_composent_option_next_button.visible = false

                main_class.get_case_list(function_object, name_filter, computer_case_motherboard_size_filter_cbb.currentIndex)
                current_composent_type.text = "COMPUTER CASE"

                computer_case_filter_rectangle.visible = true
                motherboard_filter_rectangle.visible = false
                cpu_filter_rectangle.visible = false
                cooling_filter_rectangle.visible = false
                ram_filter_rectangle.visible = false
                gpu_filter_rectangle.visible = false
                storage_filter_rectangle.visible = false
                power_supply_filter_rectangle.visible = false
                build_finish_filter_rectangle.visible = false
            }
            else if(int_value === 1)
            {
                // MOTHERBOARD
                current_composent_option_next_button.visible = false

                if(computer_case_selected_supporter_motherboard_size !== "")
                {
                    main_class.get_motherboard_list(function_object, name_filter, computer_case_selected_supporter_motherboard_size,
                                                    motherboard_chipset_filter_cbb.currentIndex, motherboard_socket_filter_cbb.currentIndex, motherboard_ram_filter_cbb.currentIndex)

                }else
                {
                    main_class.get_motherboard_list(function_object, name_filter, "", motherboard_chipset_filter_cbb.currentIndex,
                                                    motherboard_socket_filter_cbb.currentIndex, motherboard_ram_filter_cbb.currentIndex)
                }

                current_composent_type.text = "MOTHERBOARD"

                computer_case_filter_rectangle.visible = false
                motherboard_filter_rectangle.visible = true
                cpu_filter_rectangle.visible = false
                cooling_filter_rectangle.visible = false
                ram_filter_rectangle.visible = false
                gpu_filter_rectangle.visible = false
                storage_filter_rectangle.visible = false
                power_supply_filter_rectangle.visible = false
                build_finish_filter_rectangle.visible = false

            }
            else if(int_value === 2)
            {
                // CPU
                current_composent_option_next_button.visible = false

                if(motherboard_selected_socket != "" && motherboard_selected_chipset != "" && motherboard_selected_ram_type != "")
                {
                    main_class.get_cpu_list(function_object, name_filter, motherboard_selected_socket, motherboard_selected_chipset, motherboard_selected_ram_type )
                }else
                {
                    main_class.get_cpu_list(function_object, name_filter)
                }


                current_composent_type.text = "CPU"

                computer_case_filter_rectangle.visible = false
                motherboard_filter_rectangle.visible = false
                cpu_filter_rectangle.visible = true
                cooling_filter_rectangle.visible = false
                ram_filter_rectangle.visible = false
                gpu_filter_rectangle.visible = false
                storage_filter_rectangle.visible = false
                power_supply_filter_rectangle.visible = false
                build_finish_filter_rectangle.visible = false
            }
            else if(int_value === 3)
            {
                // COOLING
                current_composent_option_next_button.visible = false
                main_class.get_cooling_list(function_object, name_filter, cooling_fan_size_filter_cbb.currentIndex)

                current_composent_type.text = "COOLING"

                computer_case_filter_rectangle.visible = false
                motherboard_filter_rectangle.visible = false
                cpu_filter_rectangle.visible = false
                cooling_filter_rectangle.visible = true
                ram_filter_rectangle.visible = false
                gpu_filter_rectangle.visible = false
                storage_filter_rectangle.visible = false
                power_supply_filter_rectangle.visible = false
                build_finish_filter_rectangle.visible = false
            }
            else if(int_value === 4)
            {
                // RAM
                current_composent_option_next_button.visible = true

                if(motherboard_selected_ram_supported_speed != ""
                        && motherboard_selected_ram_type != "" && motherboard_selected_ram_size_per_slot != 0
                        && motherboard_selected_ram_slot != 0 )
                {
                    main_class.get_ram_list(function_object, motherboard_selected_ram_supported_speed, name_filter,
                                            ram_memory_size_filter_cbb.currentIndex, motherboard_selected_ram_type,
                                            motherboard_selected_ram_size_per_slot, (motherboard_selected_ram_slot - motherboard_used_ram_slot))

                }else
                {
                    main_class.get_ram_list(function_object, "" , name_filter, ram_memory_size_filter_cbb.currentIndex)
                }


                current_composent_type.text = "RAM"

                computer_case_filter_rectangle.visible = false
                motherboard_filter_rectangle.visible = false
                cpu_filter_rectangle.visible = false
                cooling_filter_rectangle.visible = false
                ram_filter_rectangle.visible = true
                gpu_filter_rectangle.visible = false
                storage_filter_rectangle.visible = false
                power_supply_filter_rectangle.visible = false
                build_finish_filter_rectangle.visible = false
            }
            else if(int_value === 5)
            {
                // GPU
                current_composent_option_next_button.visible = true
                if(motherboard_selected_name === "")
                {
                    main_class.get_gpu_list(function_object, 1,name_filter, motherboard_selected_pcie20_16x, motherboard_selected_pcie20_8x,
                                            motherboard_selected_pcie20_4x, motherboard_selected_pcie20_1x, motherboard_selected_pcie30_16x,
                                            motherboard_selected_pcie30_8x, motherboard_selected_pcie30_4x, motherboard_selected_pcie30_1x,
                                            -1, -1, -1, -1,
                                            gpu_ram_filter_cbb.currentIndex, gpu_power_cable_filter_cbb.currentIndex)
                }


                else
                {
                    main_class.get_gpu_list(function_object, 0, name_filter, motherboard_selected_pcie20_16x, motherboard_selected_pcie20_8x,
                                            motherboard_selected_pcie20_4x, motherboard_selected_pcie20_1x, motherboard_selected_pcie30_16x,
                                            motherboard_selected_pcie30_8x, motherboard_selected_pcie30_4x, motherboard_selected_pcie30_1x,
                                            motherboard_used_pcie_16x, motherboard_used_pcie_8x, motherboard_used_pcie_4x, motherboard_used_pcie_1x,
                                            gpu_ram_filter_cbb.currentIndex, gpu_power_cable_filter_cbb.currentIndex)
                }

                current_composent_type.text = "GPU"

                computer_case_filter_rectangle.visible = false
                motherboard_filter_rectangle.visible = false
                cpu_filter_rectangle.visible = false
                cooling_filter_rectangle.visible = false
                ram_filter_rectangle.visible = false
                gpu_filter_rectangle.visible = true
                storage_filter_rectangle.visible = false
                power_supply_filter_rectangle.visible = false
                build_finish_filter_rectangle.visible = false
            }
            else if(int_value === 6)
            {
                // STORAGE
                current_composent_option_next_button.visible = true

                if(motherboard_selected_name !== "" && motherboard_selected_sata_slot !== 0)
                {

                    main_class.get_storage_list(function_object, 0, name_filter, storage_type_filter_cbb.currentIndex,
                                                storage_capacity_filter_cbb.currentIndex,
                                                (motherboard_selected_sata_slot - motherboard_used_sata_slot),
                                                (motherboard_selected_M2_slot - motherboard_used_M2_slot))
                }else
                {
                    main_class.get_storage_list(function_object, 1, name_filter,storage_type_filter_cbb.currentIndex,
                                                storage_capacity_filter_cbb.currentIndex)

                }

                current_composent_type.text = "STORAGE"

                computer_case_filter_rectangle.visible = false
                motherboard_filter_rectangle.visible = false
                cpu_filter_rectangle.visible = false
                cooling_filter_rectangle.visible = false
                ram_filter_rectangle.visible = false
                gpu_filter_rectangle.visible = false
                storage_filter_rectangle.visible = true
                power_supply_filter_rectangle.visible = false
                build_finish_filter_rectangle.visible = false
            }
            else if(int_value === 7)
            {
                // POWER SUPPLY
                current_composent_option_next_button.visible = false
                main_class.get_power_supply_list(function_object, name_filter, power_supply_standard_filter_cbb.currentIndex,
                                                 power_supply_power_filter_cbb.currentIndex, motherboard_used_sata_slot)
                current_composent_type.text = "POWER SUPPLY"

                computer_case_filter_rectangle.visible = false
                motherboard_filter_rectangle.visible = false
                cpu_filter_rectangle.visible = false
                cooling_filter_rectangle.visible = false
                ram_filter_rectangle.visible = false
                gpu_filter_rectangle.visible = false
                storage_filter_rectangle.visible = false
                power_supply_filter_rectangle.visible = true
                build_finish_filter_rectangle.visible = false

            }
            else if(int_value === 8)
            {
                create_build_finish_object()
                current_composent_type.text = "BUILD LIST COMPLETED"

                computer_case_filter_rectangle.visible = false
                motherboard_filter_rectangle.visible = false
                cpu_filter_rectangle.visible = false
                cooling_filter_rectangle.visible = false
                ram_filter_rectangle.visible = false
                gpu_filter_rectangle.visible = false
                storage_filter_rectangle.visible = false
                power_supply_filter_rectangle.visible = false
                build_finish_filter_rectangle.visible = true

            }
        }

        function clear_component_grid()
        {
            for(var i = component_grid.children.length; i > 0 ; i--)
            {
                component_grid.children[i-1].destroy()
            }
        }

        function selected_item_handler(item_name, int_value)
        {
            set_component_index(int_value)


            //destroy the clicked component
            if(int_value === 0)
            {
                computer_case_selected_image_link = ""
                computer_case_selected_image_border = null
                computer_case_selected_name = ""
                computer_case_selected_supporter_motherboard_size = ""

            }else if(int_value === 1)
            {
                motherboard_selected_image_link = ""
                motherboard_selected_image_border = null
                motherboard_selected_name = ""
                motherboard_selected_socket = ""
                motherboard_selected_chipset = ""
                motherboard_selected_ram_type = ""
                motherboard_selected_ram_supported_speed = ""
                motherboard_selected_ram_size_per_slot = 0
                motherboard_selected_pcie20_16x = 0
                motherboard_selected_pcie20_8x = 0
                motherboard_selected_pcie20_4x = 0
                motherboard_selected_pcie20_1x = 0
                motherboard_selected_pcie30_16x = 0
                motherboard_selected_pcie30_8x = 0
                motherboard_selected_pcie30_4x = 0
                motherboard_selected_pcie30_1x = 0
                motherboard_selected_M2_slot = 0

            }else if(int_value === 2)
            {
                cpu_selected_image_link = ""
                cpu_selected_image_border = null
                cpu_selected_name = ""
                cpu_selected_supported_ram = ""

            }else if(int_value === 3)
            {
                cooling_selected_image_link = ""
                cooling_selected_image_border = null
                cooling_selected_name = ""
            }else if(int_value === 4)
            {

                ram_selected_image_border = null

                //get index
                var index_ram_item = rams_selected_name.indexOf(item_name)
                //remove item at index
                rams_selected_image.splice(index_ram_item,1)
                rams_selected_name.splice(index_ram_item,1)
                rams_selected_module.splice(index_ram_item,1)

            }else if(int_value === 5)
            {
                gpu_selected_image_border = null

                //get index
                var index_gpu_item = gpus_selected_name.indexOf(item_name)
                //remove item at index
                gpus_selected_image.splice(index_gpu_item,1)
                gpus_selected_name.splice(index_gpu_item,1)
                gpus_selected_bus.splice(index_gpu_item,1)

            }else if(int_value === 6)
            {
                storage_selected_image_border = null
                //get index
                var index_storage_item = storages_selected_name.indexOf(item_name)
                //remove item at index
                storages_selected_image.splice(index_storage_item,1)
                storages_selected_name.splice(index_storage_item,1)
                storages_selected_type.splice(index_storage_item,1)

            }else if(int_value === 7)
            {
                power_supply_selected_image_link = ""
                power_supply_selected_image_border = null
                power_supply_selected_name = ""

            }

            reload_current_build_grid()
            load_component_grid(int_value)
        }

        function clear_current_build_grid()
        {
            for(var i = current_build_grid.children.length; i > 0 ; i--)
            {
                current_build_grid.children[i-1].destroy()
            }

        }

        function clear_current_build()
        {
            computer_case_selected_image_link = ""
            computer_case_selected_image_border = null
            computer_case_selected_name = ""
            computer_case_selected_supporter_motherboard_size = ""


            motherboard_selected_image_link = ""
            motherboard_selected_image_border = null
            motherboard_selected_name = ""
            motherboard_selected_socket = ""
            motherboard_selected_chipset = ""
            motherboard_selected_ram_type = ""
            motherboard_selected_ram_supported_speed = ""
            motherboard_selected_ram_size_per_slot = 0
            motherboard_selected_pcie20_16x = 0
            motherboard_selected_pcie20_8x = 0
            motherboard_selected_pcie20_4x = 0
            motherboard_selected_pcie20_1x = 0
            motherboard_selected_pcie30_16x = 0
            motherboard_selected_pcie30_8x = 0
            motherboard_selected_pcie30_4x = 0
            motherboard_selected_pcie30_1x = 0
            motherboard_selected_M2_slot = 0



            cpu_selected_image_link = ""
            cpu_selected_image_border = null
            cpu_selected_name = ""
            cpu_selected_supported_ram  = ""


            cooling_selected_image_link = ""
            cooling_selected_image_border = null
            cooling_selected_name = ""


            ram_selected_image_border = null
            rams_selected_name = []
            rams_selected_image = []


            gpu_selected_image_border = null
            gpus_selected_name = []
            gpus_selected_image = []
            gpus_selected_bus = []


            storage_selected_image_border = null
            storages_selected_name = []
            storages_selected_image = []

            power_supply_selected_image_link = ""
            power_supply_selected_image_border = null
            power_supply_selected_name = ""
        }

        function reload_current_build_grid()
        {
            // clean grid
            clear_current_build_grid()

            var current_items_component = Qt.createComponent("selected_item.qml")
            if (current_items_component.status === Component.Ready)
            {
                current_build_grid.visible = false
                // set case
                if (computer_case_selected_name !== "")
                {
                    current_items_component.createObject(current_build_grid,
                                                         {day_mode : day_mode, item_name : computer_case_selected_name, image_link : computer_case_selected_image_link,
                                                             item_index : 0,  main_script_object : function_object
                                                         });
                }

                // set motherboard
                if (motherboard_selected_name !== "")
                {
                    current_items_component.createObject(current_build_grid,
                                                         {day_mode : day_mode, item_name : motherboard_selected_name, image_link : motherboard_selected_image_link,
                                                             item_index : 1,  main_script_object : function_object
                                                         });
                }

                // set CPU
                if (cpu_selected_name !== "")
                {
                    current_items_component.createObject(current_build_grid,
                                                         {day_mode : day_mode, item_name : cpu_selected_name, image_link : cpu_selected_image_link,
                                                             item_index : 2,  main_script_object : function_object
                                                         });
                }

                // set cooling
                if (cooling_selected_name !== "")
                {
                    current_items_component.createObject(current_build_grid,
                                                         {day_mode : day_mode, item_name : cooling_selected_name, image_link : cooling_selected_image_link,
                                                             item_index : 3,  main_script_object : function_object
                                                         });
                }

                // set RAM
                if (rams_selected_name.length !== 0)
                {
                    motherboard_used_ram_slot = 0
                    for (var index_ram = 0; index_ram < rams_selected_name.length ; index_ram++)
                    {

                        current_items_component.createObject(current_build_grid,
                                                             {day_mode : day_mode, item_name : rams_selected_name[index_ram], image_link : rams_selected_image[index_ram],
                                                                 item_index : 4,  main_script_object : function_object
                                                             });

                        motherboard_used_ram_slot += rams_selected_module[index_ram]

                    }
                }

                // set GPU
                if ( gpus_selected_name.length !== 0)
                {
                    motherboard_used_pcie_16x = 0
                    motherboard_used_pcie_8x = 0
                    motherboard_used_pcie_4x = 0
                    motherboard_used_pcie_1x = 0

                    for (var index_gpu = 0; index_gpu < gpus_selected_name.length ; index_gpu++)
                    {
                        current_items_component.createObject(current_build_grid,
                                                             {day_mode : day_mode, item_name : gpus_selected_name[index_gpu], image_link : gpus_selected_image[index_gpu],
                                                                 item_index : 5,  main_script_object : function_object
                                                             });

                        //used slot
                        switch(gpus_selected_bus[index_gpu])
                        {
                        case "16x":
                            motherboard_used_pcie_16x += 1
                            break
                        case "8x":
                            motherboard_used_pcie_8x += 1
                            break
                        case "4x":
                            motherboard_used_pcie_4x += 1
                            break
                        case "1x":
                            motherboard_used_pcie_1x += 1
                            break
                        }
                    }
                }

                // set storage
                if ( storages_selected_name.length!== 0)
                {
                    motherboard_used_sata_slot = 0
                    motherboard_used_M2_slot = 0

                    for (var index_storage = 0; index_storage < storages_selected_name.length ; index_storage++)
                    {
                        current_items_component.createObject(current_build_grid,
                                                             {day_mode : day_mode, item_name : storages_selected_name[index_storage],
                                                                 image_link : storages_selected_image[index_storage],
                                                                 item_index : 6,  main_script_object : function_object
                                                             });

                        switch(storages_selected_type[index_storage])
                        {
                          case "M2":
                              motherboard_used_M2_slot += 1
                              break

                          case "SATA":
                              motherboard_used_sata_slot += 1
                              break
                        }


                    }
                }

                // set power supply
                if (power_supply_selected_name !== "")
                {
                    current_items_component.createObject(current_build_grid,
                                                         {day_mode : day_mode, item_name : power_supply_selected_name, image_link : power_supply_selected_image_link,
                                                             item_index : 7,  main_script_object : function_object
                                                         });
                }

                current_build_grid.visible = true
            }

        }



        function motherboard_size_str(int_value)
        {
            if (int_value === 0)
            {
                return "ATX, "

            }else if (int_value === 1)
            {
                return "E_ATX, "

            }else if (int_value === 2)
            {
                return "Micro_ATX, "
            }else if (int_value === 3)
            {
                return "Mini_ATX, "
            }
        }

        function motherboard_power_pin_str(int_value)
        {
            if (int_value === 0)
            {
                return "ATX 4 Pin, "

            }else if (int_value === 1)
            {
                return "ATX 4+4 Pin, "

            }
        }

        function ram_type_str(int_value)
        {
            if (int_value === 0)
            {
                return "DDR3, "

            }else if (int_value === 1)
            {
                return "DDR4, "

            }else if (int_value === 2)
            {
                return "GDDR5, "
            }else if (int_value === 3)
            {
                return "GDDR5X, "
            }
            else if (int_value === 4)
            {
                return "GDDR6, "
            }
        }

        function ram_speed_str(int_value)
        {
            if (int_value === 0)
            {
                return "1066Mhz, "
            }else if (int_value === 1)
            {
                return "1333Mhz, "

            }else if (int_value === 2)
            {
                return "1600Mhz, "
            }else if (int_value === 3)
            {
                return "1866Mhz, "
            }else if (int_value === 4)
            {
                return "2133Mhz, "
            }else if (int_value === 5)
            {
                return "2400Mhz, "
            }else if (int_value === 6)
            {
                return "2666Mhz, "
            }else if (int_value === 7)
            {
                return "2800Mhz, "
            }else if (int_value === 8)
            {
                return "2933Mhz, "
            }else if (int_value === 9)
            {
                return "3000Mhz, "
            }else if (int_value === 10)
            {
                return "3200Mhz, "

            }else if (int_value === 11)
            {
                return "3300Mhz, "
            }else if (int_value === 12)
            {
                return "3333Mhz, "
            }else if (int_value === 13)
            {
                return "3400Mhz, "
            }else if (int_value === 14)
            {
                return "3466Mhz, "

            }else if (int_value === 15)
            {
                return "3600Mhz, "
            }else if (int_value === 16)
            {
                return "3666Mhz, "
            }else if (int_value === 17)
            {
                return "3733Mhz, "
            }else if (int_value === 18)
            {
                return "3800Mhz, "
            }else if (int_value === 19)
            {
                return "3866Mhz, "
            }else if (int_value === 20)
            {
                return "4000Mhz, "
            }else if (int_value === 21)
            {
                return "4133Mhz, "
            }else if (int_value === 22)
            {
                return "4200Mhz, "
            }else if (int_value === 23)
            {
                return "4266Mhz, "
            }else if (int_value === 24)
            {
                return "4300Mhz, "
            }else if (int_value === 25)
            {
                return "4333Mhz, "
            }else if (int_value === 26)
            {
                return "4400Mhz, "
            }else if (int_value === 27)
            {
                return "4500Mhz, "
            }else if (int_value === 28)
            {
                return "4600Mhz, "
            }else if (int_value === 29)
            {
                return "4700Mhz, "
            }else if (int_value === 30)
            {
                return "4800Mhz, "
            }

        }

        function ram_cas_str(int_value)
        {
            if (int_value === 0)
            {
                return "CL 22, "

            }else if (int_value === 1)
            {
                return "CL 21, "

            }else if (int_value === 2)
            {
                return "CL 20, "
            }else if (int_value === 3)
            {
                return "CL 19, "
            }
            else if (int_value === 4)
            {
                return "CL 18, "
            }else if (int_value === 5)
            {
                return "CL 17, "

            }else if (int_value === 6)
            {
                return "CL 16, "
            }else if (int_value === 7)
            {
                return "CL 15, "
            }
            else if (int_value === 8)
            {
                return "CL 14, "
            }else if (int_value === 9)
            {
                return "CL 13, "

            }else if (int_value === 10)
            {
                return "CL 12, "
            }else if (int_value === 11)
            {
                return "CL 11, "
            }
            else if (int_value === 12)
            {
                return "CL 10, "
            }

        }

        function socket_str(int_value)
        {

            if (int_value === 0)
            {
                return "AMD_AM2, "

            }else if (int_value === 1)
            {
                return "AMD_AM2_plus, "

            }else if (int_value === 2)
            {
                return "AMD_AM3, "
            }else if (int_value === 3)
            {
                return "AMD_AM3_plus, "
            }
            else if (int_value === 4)
            {
                return "AMD_AM4, "
            }else if (int_value === 5)
            {
                return "AMD_SP3, "

            }else if (int_value === 6)
            {
                return "AMD_sTR4, "
            }else if (int_value === 7)
            {
                return "AMD_sTRx4, "
            }
            else if (int_value === 8)
            {
                return "LGA_1150, "
            }else if (int_value === 9)
            {
                return "LGA_1151, "

            }else if (int_value === 10)
            {
                return "LGA_1155, "
            }else if (int_value === 11)
            {
                return "LGA_1156, "
            }
            else if (int_value === 12)
            {
                return "LGA_1366, "
            }else if (int_value === 13)
            {
                return "LGA_2011, "
            }else if (int_value === 14)
            {
                return "LGA_2011_v3, "
            }
            else if (int_value === 15)
            {
                return "LGA_2066, "
            }
        }

        function chipset_str(int_value)
        {

            if (int_value === 0)
            {
                return "AMD_A68H, "

            }else if (int_value === 1)
            {
                return "AMD_760G, "

            }else if (int_value === 2)
            {
                return "AMD_B350, "
            }else if (int_value === 3)
            {
                return "AMD_B450, "
            }
            else if (int_value === 4)
            {
                return "AMD_X399, "
            }else if (int_value === 5)
            {
                return "Intel_H110, "

            }else if (int_value === 6)
            {
                return "Intel_H270, "
            }else if (int_value === 7)
            {
                return "Intel_H310, "
            }
            else if (int_value === 8)
            {
                return "Intel_H370, "
            }else if (int_value === 9)
            {
                return "Intel_B150, "

            }else if (int_value === 10)
            {
                return "Intel_B250, "
            }else if (int_value === 11)
            {
                return "Intel_B360, "
            }
            else if (int_value === 12)
            {
                return "Intel_B365, "
            }else if (int_value === 13)
            {
                return "Intel_Z170, "

            }else if (int_value === 14)
            {
                return "Intel_Z270, "
            }else if (int_value === 15)
            {
                return "Intel_Z370, "
            }
            else if (int_value === 16)
            {
                return "Intel_Z390, "
            }else if (int_value === 17)
            {
                return "Intel_X99, "
            }
            else if (int_value === 18)
            {
                return "Intel_X299, "
            }

        }

        function cooling_size_str(int_value)
        {
            if (int_value === 0)
            {
                return "120 mm, "

            }else if (int_value === 1)
            {
                return "140 mm, "

            }else if (int_value === 2)
            {
                return "240 mm, "
            }else if (int_value === 3)
            {
                return "280 mm, "
            }
            else if (int_value === 4)
            {
                return "360 mm, "
            }else if (int_value === 5)
            {
                return "420 mm , "
            }
        }

        function gpu_bus_str(int_value)
        {

            if (int_value === 0)
            {
                return "PCIE 2.0 16x, "

            }else if (int_value === 1)
            {
                return "PCIE 2.0 8x, "

            }else if (int_value === 2)
            {
                return "PCIE 2.0 4x, "
            }else if (int_value === 3)
            {
                return "PCIE 2.0 1x, "
            }else if (int_value === 4)
            {
                return "PCIE 3.0 16x, "

            }else if (int_value === 5)
            {
                return "PCIE 3.0 8x, "

            }else if (int_value === 6)
            {
                return "PCIE 3.0 4x, "
            }else if (int_value === 7)
            {
                return "PCIE 3.0 1x, "
            }
        }

        function gpu_power_cable_pin_str(int_value)
        {

            if (int_value === 0)
            {
                return "8 pin PCIe, "

            }else if (int_value === 1)
            {
                return "2x8 pin PCIe, "

            }else if (int_value === 2)
            {
                return "NONE, "
            }
        }

        function storage_type_str(int_value)
        {
            if (int_value === 0)
            {
                return "HDD, "

            }else if (int_value === 1)
            {
                return "SSD, "

            }else if (int_value === 2)
            {
                return "M_2, "
            }
        }

        function storage_capacity_str(int_value)
        {
            if (int_value === 0)
            {
                return "120GB, "

            }else if (int_value === 1)
            {
                return "250GB, "

            }else if (int_value === 2)
            {
                return "500GB, "

            }else if (int_value === 3)
            {
                return "1TB, "

            }else if (int_value === 4)
            {
                return "2TB, "

            }else if (int_value === 5)
            {
                return "4TB, "

            }else if (int_value === 6)
            {
                return "8TB, "

            }else
            {
                return "120GB, "
            }

        }

        function power_supply_standard_str(int_value)
        {
            if (int_value === 0)
            {
                return "plus 80, "

            }
            else if (int_value === 1)
            {
                return "plus 80 bronze, "

            }
            else if (int_value === 2)
            {
                return "plus 80 silver, "
            }
            else if (int_value === 3)
            {
                return "plus 80 gold, "
            }
            else if (int_value === 4)
            {
                return "plus 80 platinium, "
            }
            else if (int_value === 5)
            {
                return "plus 80 titanium, "
            }

        }

        function power_supply_power_str(int_value)
        {

            if (int_value === 0)
            {
                return "300W, "

            }
            else if (int_value === 1)
            {
                return "350W, "

            }
            else if (int_value === 2)
            {
                return "400W, "
            }
            else if (int_value === 3)
            {
                return "450W, "
            }
            else if (int_value === 4)
            {
                return "500W, "
            }
            else if (int_value === 5)
            {
                return "550W, "
            }
            else if (int_value === 6)
            {
                return "600W, "
            }
            else if (int_value === 7)
            {
                return "650W, "
            }
            else if (int_value === 8)
            {
                return "700W, "
            }
            else if (int_value === 9)
            {
                return "750W, "
            }
            else if (int_value === 10)
            {
                return "800W, "
            }
            else if (int_value === 11)
            {
                return "850W, "
            }
            else if (int_value === 12)
            {
                return "900W, "
            }
            else if (int_value === 13)
            {
                return "950W, "
            }
            else if (int_value === 14)
            {
                return "1000W, "
            }
            else if (int_value === 15)
            {
                return "1100W, "
            }
            else if (int_value === 16)
            {
                return "1200W, "
            }
            else if (int_value === 17)
            {
                return "1300W, "
            }
            else if (int_value === 18)
            {
                return "1400W, "
            }
            else if (int_value === 19)
            {
                return "1500W, "
            }
            else if (int_value === 20)
            {
                return "1600W, "
            }


        }



        function create_case_object(map)
        {
            for(var prop in map)
            {
                var case_component = Qt.createComponent("computer_case.qml")


                var list_supp_item = map[prop]["supported motherboard size"]
                var tmp = ""

                for (var i=0; i<list_supp_item.length; i++)
                {
                    tmp += motherboard_size_str(list_supp_item[i])
                }

                if (case_component.status === Component.Ready)
                    case_component.createObject(component_grid ,
                                                {day_mode : day_mode, component_name : map[prop]["name"], component_price : map[prop]["price"],
                                                    component_supported_motherboard_size : "supported motherboard size : " + tmp,
                                                    component_image_link : map[prop]["image link"], component_buy_link : qsTr(map[prop]["buy link"]),
                                                    main_script_object : function_object
                                                });
            }
        }

        function create_motherboard_object(map)
        {
            for(var prop in map)
            {
                var case_component = Qt.createComponent("motherboard.qml")

                var list_supp_item = map[prop]["RAM speed supported"]
                var tmp = ""

                for (var i=0; i<list_supp_item.length; i++)
                {
                    tmp += ram_speed_str(list_supp_item[i])
                }

                if (case_component.status === Component.Ready)
                    case_component.createObject(component_grid,
                                                {day_mode : day_mode, component_name : map[prop]["name"],
                                                    component_size : motherboard_size_str(map[prop]["motherboard type"]),
                                                    component_cpu_socket : socket_str(map[prop]["CPU socket"]),
                                                    component_cpu_chipset : chipset_str(map[prop]["CPU chipset"]),
                                                    component_RAM_type : ram_type_str(map[prop]["RAM type"]),
                                                    component_RAM_speed_supported : tmp, component_power_pin : motherboard_power_pin_str(map[prop]["POWER pin"]),
                                                    component_RAM_slot : map[prop]["RAM slot number"], component_RAM_max : map[prop]["RAM max capacity"],
                                                    component_RAM_max_slot : map[prop]["RAM max slot"], component_pcie20_16x : map[prop]["GPU pcie 2.0 16x number"],
                                                    component_pcie20_8x : map[prop]["GPU pcie 2.0 8x number"], component_pcie20_4x : map[prop]["GPU pcie 2.0 4x number"],
                                                    component_pcie20_1x : map[prop]["GPU pcie 2.0 1x number"], component_pcie30_16x : map[prop]["GPU pcie 3.0 16x number"],
                                                    component_pcie30_8x : map[prop]["GPU pcie 3.0 8x number"], component_pcie30_4x : map[prop]["GPU pcie 3.0 4x number"],
                                                    component_pcie30_1x : map[prop]["GPU pcie 3.0 1x number"], component_sata_slot : map[prop]["SATA slot number"],
                                                    component_M2_slot : map[prop]["M2 slot number"], component_price : map[prop]["price"],
                                                    component_image_link : map[prop]["image link"], component_buy_link : qsTr(map[prop]["buy link"]),
                                                    main_script_object : function_object
                                                });
            }
        }

        function create_cpu_object(map)
        {
            for(var prop in map)
            {
                var cpu_component = Qt.createComponent("cpu.qml")


                var list_supp_item = map[prop]["CPU chipset"]
                var supported_chipset_str = ""

                for (var i=0; i<list_supp_item.length; i++)
                {
                    supported_chipset_str += chipset_str(list_supp_item[i])
                }

                if (cpu_component.status === Component.Ready)
                    cpu_component.createObject(component_grid,
                                               {day_mode : day_mode, component_name : map[prop]["name"], component_price : map[prop]["price"],
                                                   component_socket : socket_str(map[prop]["CPU socket"]) , component_supported_chipset : supported_chipset_str,
                                                   component_clock_speed : map[prop]["clock speed"], component_boosted_speed : map[prop]["boosted clock speed"],
                                                   component_cache_L3_Mo : map[prop]["cache L3"], component_core_number : map[prop]["core number"],
                                                   component_thread_number : map[prop]["thread number"], component_TDP : map[prop]["TDP"],
                                                   component_supported_RAM_type : ram_type_str(map[prop]["supported RAM type"]),
                                                   component_max_RAM_speed_MHZ : ram_speed_str(map[prop]["max RAM speed"]),
                                                   component_image_link : map[prop]["image link"], component_buy_link : qsTr(map[prop]["buy link"]),
                                                   main_script_object : function_object
                                               });
            }
        }

        function create_cooling_object(map)
        {
            for(var prop in map)
            {
                var cooling_component = Qt.createComponent("cooling.qml")


                var list_supp_item = map[prop]["CPU socket"]
                var supported_socket_str = ""

                for (var i=0; i<list_supp_item.length; i++)
                {
                    supported_socket_str += socket_str(list_supp_item[i])
                }

                if (cooling_component.status === Component.Ready)
                    cooling_component.createObject(component_grid,
                                                   {day_mode : day_mode, component_name : map[prop]["name"], component_price : map[prop]["price"],
                                                       component_supported_socket : supported_socket_str, component_cooling_size : cooling_size_str(map[prop]["cooling size"]),
                                                       component_cooling_min_sound_dB : map[prop]["cooling min sound"],component_cooling_max_sound_dB : map[prop]["cooling max sound"],
                                                       component_cooling_min_speed : map[prop]["cooling min speed"], component_cooling_max_speed : map[prop]["cooling max speed"],
                                                       component_air_flow_CFM : map[prop]["air flow"],
                                                       component_image_link : map[prop]["image link"], component_buy_link : qsTr(map[prop]["buy link"]),
                                                       main_script_object : function_object
                                                   });

            }
        }

        function create_ram_object(map)
        {
            for(var prop in map)
            {
                var ram_component = Qt.createComponent("ram.qml")

                if (ram_component.status === Component.Ready)
                    ram_component.createObject(component_grid,
                                               {day_mode : day_mode, component_name : map[prop]["name"], component_price : map[prop]["price"],
                                                   component_RAM_type : ram_type_str(map[prop]["RAM type"]), component_memory_size : map[prop]["memory size"],
                                                   component_memory_speed : ram_speed_str(map[prop]["memory speed"]),
                                                   component_module_number : map[prop]["module number"],  component_cas_latency : ram_cas_str(map[prop]["CAS latency"]) ,
                                                   component_image_link : map[prop]["image link"], component_buy_link : qsTr(map[prop]["buy link"]),
                                                   main_script_object : function_object
                                               });
            }
        }

        function create_gpu_object(map)
        {
            for(var prop in map)
            {
                var gpu_component = Qt.createComponent("gpu.qml")

                if (gpu_component.status === Component.Ready)
                    gpu_component.createObject(component_grid,
                                               {day_mode : day_mode, component_name : map[prop]["name"], component_price : map[prop]["price"],
                                                   component_clock_speed : map[prop]["clock speed"], component_boost_clock : map[prop]["boosted clock speed"],
                                                   component_GPU_core_number : map[prop]["GPU core number"], component_GPU_bus : gpu_bus_str(map[prop]["GPU bus"]),
                                                   component_GPU_ram_type : ram_type_str(map[prop]["GPU RAM type"]), component_GPU_ram_size : map[prop]["GPU RAM size"],
                                                   component_GPU_ram_frequency_MHZ : map[prop]["GPU RAM frequency"], component_GPU_flux : map[prop]["GPU flux"],
                                                   component_power_consumption : map[prop]["power consumption"],
                                                   component_power_clable_pin : gpu_power_cable_pin_str(map[prop]["power cable pin"]),
                                                   component_image_link : map[prop]["image link"], component_buy_link : qsTr(map[prop]["buy link"]),
                                                   main_script_object : function_object
                                               });

            }
        }

        function create_storage_object(map)
        {
            for(var prop in map)
            {
                var storage_component = Qt.createComponent("storage.qml")

                if (storage_component.status === Component.Ready)
                    storage_component.createObject(component_grid,
                                                   {day_mode : day_mode, component_name : map[prop]["name"], component_price : map[prop]["price"],
                                                       component_type : storage_type_str(map[prop]["DD type"]) ,component_capacity : storage_capacity_str(map[prop]["capacity"]),
                                                       component_RPM : map[prop]["RPM"], component_Read_speed : map[prop]["Read Speed"],
                                                       component_Write_speed : map[prop]["Write Speed"],
                                                       component_image_link : map[prop]["image link"], component_buy_link : qsTr(map[prop]["buy link"]),
                                                       main_script_object : function_object
                                                   });
            }
        }

        function create_power_supply_object(map)
        {
            for(var prop in map)
            {
                var power_supply_component = Qt.createComponent("powersupply.qml")
                if (power_supply_component.status === Component.Ready)
                    power_supply_component.createObject(component_grid,
                                                        {day_mode : day_mode, component_name : map[prop]["name"], component_price : map[prop]["price"],
                                                            component_standard : power_supply_standard_str(map[prop]["Power supply standard"]),
                                                            component_power_W : power_supply_power_str(map[prop]["Power (W)"]),
                                                            component_sata_power_cable : map[prop]["Sata power cable"],
                                                            component_pcie6_2_power_cable : map[prop]["PCIE 6_2 power cable"],
                                                            component_ATX_24_power_cable : map[prop]["ATX 24 power cable"],
                                                            component_ATX_4_power_cable : map[prop]["ATX 4 pin"],
                                                            component_molex4_power_cable : map[prop]["Molex 4 power cable"],
                                                            component_image_link : map[prop]["image link"], component_buy_link : qsTr(map[prop]["buy link"]),
                                                            main_script_object : function_object
                                                        });
            }
        }

        function create_build_finish_object()
        {
            var build_finish_component = Qt.createComponent("build_finish.qml")
            if (build_finish_component.status === Component.Ready)
            {
                build_finish_component.createObject(component_grid,
                                                    {day_mode : day_mode, component_name : "COMPUTER CASE", type_index : 0,
                                                        main_script_object : function_object});

                build_finish_component.createObject(component_grid,
                                                    {day_mode : day_mode, component_name : "MOTHERBOARD", type_index : 1,
                                                        main_script_object : function_object});

                build_finish_component.createObject(component_grid,
                                                    {day_mode : day_mode, component_name : "CPU", type_index : 2,
                                                        main_script_object : function_object});

                build_finish_component.createObject(component_grid,
                                                    {day_mode : day_mode, component_name : "COOLING", type_index : 3,
                                                        main_script_object : function_object});

                build_finish_component.createObject(component_grid,
                                                    {day_mode : day_mode, component_name : "RAM", type_index : 4,
                                                        main_script_object : function_object});

                build_finish_component.createObject(component_grid,
                                                    {day_mode : day_mode, component_name : "GPU", type_index : 5,
                                                        main_script_object : function_object});

                build_finish_component.createObject(component_grid,
                                                    {day_mode : day_mode, component_name : "STORAGE", type_index : 6,
                                                        main_script_object : function_object});

                build_finish_component.createObject(component_grid,
                                                    {day_mode : day_mode, component_name : "POWER SUPPLY", type_index : 7,
                                                        main_script_object : function_object});


            }

        }



        function selected_computer_case(image_selected, item, current_item_image)
        {

            if(computer_case_selected_image_border === image_selected)
            {

                computer_case_selected_image_link = current_item_image
                computer_case_selected_name = item["component_name"]
                computer_case_selected_supporter_motherboard_size = item["component_supported_motherboard_size"]

                next_component()
                reload_current_build_grid()

            }else
            {
                if (computer_case_selected_image_border !== null)
                {
                    computer_case_selected_image_border.visible = false
                }

                computer_case_selected_image_border = image_selected
                image_selected.visible = true

            }


        }

        function selected_motherboard(image_selected, item, current_item_image)
        {

            if(motherboard_selected_image_border === image_selected)
            {

                motherboard_selected_image_link = current_item_image
                motherboard_selected_name = item["component_name"]
                motherboard_selected_chipset = item["component_cpu_chipset"]
                motherboard_selected_socket = item["component_cpu_socket"]
                motherboard_selected_ram_type = item["component_RAM_type"]
                motherboard_selected_ram_supported_speed = item["component_RAM_speed_supported"]
                motherboard_selected_ram_size_per_slot = item["component_RAM_max_slot"]
                motherboard_selected_pcie20_16x = item["component_pcie20_16x"]
                motherboard_selected_pcie20_8x = item["component_pcie20_8x"]
                motherboard_selected_pcie20_4x = item["component_pcie20_4x"]
                motherboard_selected_pcie20_1x = item["component_pcie20_1x"]
                motherboard_selected_pcie30_16x = item["component_pcie30_16x"]
                motherboard_selected_pcie30_8x = item["component_pcie30_8x"]
                motherboard_selected_pcie30_4x = item["component_pcie30_4x"]
                motherboard_selected_pcie30_1x = item["component_pcie30_1x"]
                motherboard_selected_M2_slot = item["component_M2_slot"]
                motherboard_selected_sata_slot = item["component_sata_slot"]
                motherboard_selected_ram_slot = item["component_RAM_slot"]

                next_component()
                reload_current_build_grid()

            }else
            {
                if (motherboard_selected_image_border !== null)
                {
                    motherboard_selected_image_border.visible = false
                }
                motherboard_selected_image_border = image_selected
                image_selected.visible = true
            }
        }

        function selected_cpu(image_selected, item, current_item_image)
        {
            if(cpu_selected_image_border === image_selected)
            {
                cpu_selected_image_link = current_item_image
                cpu_selected_name = item["component_name"]
                cpu_selected_supported_ram = item["component_supported_RAM_type"]

                next_component()
                reload_current_build_grid()

            }else
            {
                if (cpu_selected_image_border !== null)
                {
                    cpu_selected_image_border.visible = false
                }

                cpu_selected_image_border = image_selected
                image_selected.visible = true

            }
        }

        function selected_cooling(image_selected, item, current_item_image)
        {
            if(cooling_selected_image_border === image_selected)
            {
                cooling_selected_image_link = current_item_image
                cooling_selected_name = item["component_name"]

                next_component()
                reload_current_build_grid();

            }else
            {
                if (cooling_selected_image_border !== null)
                {
                    cooling_selected_image_border.visible = false
                }

                cooling_selected_image_border = image_selected
                image_selected.visible = true
            }




        }

        function selected_ram(image_selected, item, current_item_image)
        {
            if(ram_selected_image_border === image_selected)
            {

                rams_selected_image.push(current_item_image)
                rams_selected_name.push(item["component_name"])
                rams_selected_module.push(item["component_module_number"])

                reload_current_build_grid()
                load_component_grid(component_index)

            }else
            {
                if (motherboard_selected_ram_slot >= (motherboard_used_ram_slot + item["component_module_number"]))
                {
                    if (ram_selected_image_border !== null)
                    {
                        ram_selected_image_border.visible = false
                    }

                    ram_selected_image_border = image_selected
                    image_selected.visible = true

                    rectangle_error_text.text = ""
                }
                else
                {
                    rectangle_error_text.text = "Can't select this RAM : Not enough slot on motherboard"
                }
            }
        }

        function selected_gpu(image_selected, item, current_item_image)
        {
            if(gpu_selected_image_border === image_selected)
            {
                gpus_selected_image.push(current_item_image)
                gpus_selected_name.push(item["component_name"])
                gpus_selected_bus.push(item["component_GPU_bus"].substring(9, item["component_GPU_bus"].length - 2))

                reload_current_build_grid()
                load_component_grid(component_index)

            }else
            {

                    if (gpu_selected_image_border !== null)
                    {
                        gpu_selected_image_border.visible = false
                    }

                    gpu_selected_image_border = image_selected
                    image_selected.visible = true

            }
        }

        function selected_storage(image_selected, item, current_item_image)
        {
            if(storage_selected_image_border === image_selected)
            {
                storages_selected_image.push(current_item_image)
                storages_selected_name.push(item["component_name"])

                if(item["component_type"] === "M_2, ")
                {
                    storages_selected_type.push("M2")
                }
                else
                {
                   storages_selected_type.push("SATA")
                }

                reload_current_build_grid()
                load_component_grid(component_index)

            }else
            {
                if (storage_selected_image_border !== null)
                {
                    storage_selected_image_border.visible = false
                }

                storage_selected_image_border = image_selected
                image_selected.visible = true
            }

        }

        function selected_power_supply(image_selected, item, current_item_image)
        {
            if(power_supply_selected_image_border === image_selected)
            {
                power_supply_selected_name = item["component_name"]
                power_supply_selected_image_link = current_item_image

                next_component()
                reload_current_build_grid()

            }else
            {
                if (power_supply_selected_image_border !== null)
                {
                    power_supply_selected_image_border.visible = false
                }

                power_supply_selected_image_border = image_selected
                image_selected.visible = true

            }

        }


        function change_day_mode()
        {
            if(day_mode === true)
            {
                main_window.color = "#121212"

                // TITLE
                rectangle_main_title.color = "#424242"
                main_title.color = "#E0E0E0"

                // CURRENT COMPONENT TYPE
                rectangle_current_component_type.color = "#424242"
                current_composent_type.color = "#E0E0E0"

                // CURRENT COMPONENT FILTRE
                current_composent_option_rect.color = "#424242"
                current_composent_option_rect.border.color = "#757575"

                current_composent_option_finish_button_background.color = "#E0E0E0"

                current_composent_option_filter_name_value.color = "#E0E0E0"
                current_composent_option_filter_name_text.color = "#E0E0E0"

                computer_case_motherboard_size_filter_text.color = "#E0E0E0"
                computer_case_motherboard_size_filter_cbb_background.color = "#E0E0E0"

                motherboard_ram_filter_text.color = "#E0E0E0"
                motherboard_ram_filter_cbb_background.color = "#E0E0E0"
                motherboard_socket_filter_text.color = "#E0E0E0"
                motherboard_socket_filter_cbb_background.color = "#E0E0E0"
                motherboard_chipset_filter_text.color = "#E0E0E0"
                motherboard_chipset_filter_cbb_background.color = "#E0E0E0"

                cooling_fan_size_filter_text.color = "#E0E0E0"
                cooling_fan_size_filter_cbb_background.color = "#E0E0E0"

                ram_memory_size_filter_text.color = "#E0E0E0"
                ram_memory_size_filter_cbb_background.color = "#E0E0E0"

                gpu_RAM_filter_text.color = "#E0E0E0"
                gpu_ram_filter_cbb_background.color = "#E0E0E0"
                gpu_power_cable_filter_text.color = "#E0E0E0"
                gpu_power_cable_filter_cbb_background.color = "#E0E0E0"

                storage_type_filter_text.color = "#E0E0E0"
                storage_type_filter_cbb_background.color = "#E0E0E0"

                power_supply_standard_filter_text.color = "#E0E0E0"
                power_supply_standard_filter_cbb_background.color = "#E0E0E0"
                power_supply_power_filter_text.color = "#E0E0E0"
                power_supply_power_filter_cbb_background.color = "#E0E0E0"

                // CHANGE DAY_MODE VALUE
                day_mode = false
            }
            else
            {
                main_window.color = "#FAFAFA"

                // TITLE
                rectangle_main_title.color = "#757575"
                main_title.color = "#212121"

                // SELECTED COMPONENTS

                // CURRENT COMPONENT TYPE
                rectangle_current_component_type.color = "#757575"
                current_composent_type.color = "#212121"

                // CURRENT COMPONENT FILTRE
                current_composent_option_rect.color = "#757575"
                current_composent_option_rect.border.color = "#9E9E9E"

                current_composent_option_finish_button_background.color = "#BDBDBD"

                current_composent_option_filter_name_value.color = "#212121"
                current_composent_option_filter_name_text.color = "#212121"

                computer_case_motherboard_size_filter_text.color = "#212121"
                computer_case_motherboard_size_filter_cbb_background.color = "#BDBDBD"

                motherboard_ram_filter_text.color = "#212121"
                motherboard_ram_filter_cbb_background.color = "#BDBDBD"
                motherboard_socket_filter_text.color = "#212121"
                motherboard_socket_filter_cbb_background.color = "#BDBDBD"
                motherboard_chipset_filter_text.color = "#212121"
                motherboard_chipset_filter_cbb_background.color = "#BDBDBD"

                cooling_fan_size_filter_text.color = "#212121"
                cooling_fan_size_filter_cbb_background.color = "#BDBDBD"

                ram_memory_size_filter_text.color = "#212121"
                ram_memory_size_filter_cbb_background.color = "#BDBDBD"

                gpu_RAM_filter_text.color = "#212121"
                gpu_ram_filter_cbb_background.color = "#BDBDBD"
                gpu_power_cable_filter_text.color = "#212121"
                gpu_power_cable_filter_cbb_background.color = "#BDBDBD"

                storage_type_filter_text.color = "#212121"
                storage_type_filter_cbb_background.color = "#BDBDBD"

                power_supply_standard_filter_text.color = "#212121"
                power_supply_standard_filter_cbb_background.color = "#BDBDBD"
                power_supply_power_filter_text.color = "#212121"
                power_supply_power_filter_cbb_background.color = "#BDBDBD"

                // CHANGE DAY_MODE VALUE
                day_mode = true
            }

        }

    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
