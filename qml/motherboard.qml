import QtQuick 2.10
import Image_qml 1.0
import QtQuick.Controls 2.13

Item {

    id :    motherboard_grid_element
    width: 400
    height: 470

    property bool day_mode: false
    property string component_name : ""
    property string component_size : ""
    property string component_cpu_socket : ""
    property string component_cpu_chipset : ""
    property string component_RAM_type : ""
    property string component_RAM_speed_supported : ""
    property string component_RAM_slot : ""
    property string component_RAM_max : ""
    property int component_RAM_max_slot : 0
    property int component_pcie_16x : 0
    property int component_pcie_8x : 0
    property int component_pcie_4x : 0
    property int component_pcie_1x : 0
    property int component_sata_slot : 0
    property int component_M2_slot : 0
    property string component_power_pin : ""
    property string component_image_link : ""
    property string component_buy_link : ""
    property int component_price : 0

    property Item main_script_object

    Image_qml
    {
        id: image_qml
    }



    Rectangle {
        id: background
        anchors.fill: parent
        anchors.margins: 5
        radius: 5
        Component.onCompleted:
        {
            if (day_mode === true)
            {
                background.color = "#BDBDBD"
            }
            else
            {
                background.color = "#EEEEEE"
            }
        }

        MouseArea{
            anchors.fill: parent
                    onClicked: {
                        main_script_object.selected_motherboard(selected_border, motherboard_grid_element, borderImage.source)
                    }
        }

        BorderImage {
            id: borderImage
            x: 20
            y: 20
            width: 100
            height: 100
            source: image_qml.get_image_link(component_image_link)
        }

        Text {
            id: component_name_text
            text: component_name
            height:  22
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: borderImage.right
            anchors.leftMargin: 20
        }

        Text {
            id: component_price_text
            text: "price : " + component_price + " Euro"
            height:  22
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_name_text.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: borderImage.right
            anchors.leftMargin: 20
        }

        Text {
            id: component_size_text
            text: "motherboard size : " + component_size.substring(0, component_size.length - 2)
            height:  22
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_price_text.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: borderImage.right
            anchors.leftMargin: 20
        }

        Text {
            id: component_cpu_socket_text
            text: "CPU Socket : " + component_cpu_socket.substring(0, component_cpu_socket.length - 2)
            height:  22
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_size_text.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: borderImage.right
            anchors.leftMargin: 20
        }

        Text {
            id: component_cpu_chipset_text
            width: 210
            height: 22
            text: "CPU Shipset : " + component_cpu_chipset.substring(0, component_cpu_chipset.length - 2)
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_cpu_socket_text.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 20

        }

        Text {
            id: component_RAM_type_text
            height: 22
            text: "RAM Type : "
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_cpu_socket_text.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: component_cpu_chipset_text.right
            anchors.leftMargin: 5
        }

        Text {
            id: component_RAM_speed_supported_text
            height: 70
            text: "RAM speed supported : " + component_RAM_speed_supported.substring(0, component_RAM_speed_supported.length - 2)
            wrapMode: Text.WordWrap
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_RAM_type_text.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20

        }

        Text {
            id: component_RAM_slot_text
            width: 120
            height: 22
            text: "RAM Slot : " + component_RAM_slot
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_RAM_speed_supported_text.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 20
        }

        Text {
            id: component_RAM_max_text
            height: 22
            text: "Max RAM : " + component_RAM_max + " GB"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_RAM_speed_supported_text.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.left: component_RAM_slot_text.right
            anchors.leftMargin: 5
        }

        Text {
            id: component_RAM_max_slot_text
            width: 240
            height: 22
            text: "Max RAM Per Slot : " + component_RAM_max + " GB"
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_RAM_max_text.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 20
        }

        Text {
            id: component_M2_slot_text
            text: "M.2 slot : " + component_M2_slot
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_RAM_max_text.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.left: component_RAM_max_slot_text.right
            anchors.leftMargin: 5
        }


        Text {
            id: component_pcie_text
            height:  22
            text: "PCIE 3.0 :"

            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_M2_slot_text.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 20
        }

        Text {
            id: component_pcie_16x_value_text
            x: 105
            y: 310
            width: 20
            text: component_pcie_16x
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_M2_slot_text.bottom
            anchors.topMargin: 10
            anchors.left: component_pcie_text.right
            anchors.leftMargin: 10
        }

        Text {
            id: component_pcie_16x_text
            x: 130
            y: 310
            height: 22
            text: "(16x)"
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_M2_slot_text.bottom
            anchors.topMargin: 10
            anchors.left: component_pcie_16x_value_text.right
            anchors.leftMargin: 2
        }

        Text {
            id: component_pcie_8x_value_text
            x: 190
            y: 310
            width: 20
            text: component_pcie_8x
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_M2_slot_text.bottom
            anchors.topMargin: 10
            anchors.left: component_pcie_16x_text.right
            anchors.leftMargin: 10
        }

        Text {
            id: component_pcie_8x_text
            x: 210
            y: 310
            height: 22
            text: "(8x)"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_M2_slot_text.bottom
            anchors.topMargin: 10
            anchors.left: component_pcie_8x_value_text.right
            anchors.leftMargin: 2
        }

        Text {
            id: component_pcie_4x_value_text
            x: 260
            y: 310
            width: 20
            text: component_pcie_4x
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_M2_slot_text.bottom
            anchors.topMargin: 10
            anchors.left: component_pcie_8x_text.right
            anchors.leftMargin: 10
        }

        Text {
            id: component_pcie_4x_text
            x: 280
            y: 310
            height: 22
            text: "(4x)"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_M2_slot_text.bottom
            anchors.topMargin: 10
            anchors.left: component_pcie_4x_value_text.right
            anchors.leftMargin: 2
        }

        Text {
            id: component_pcie_1x_value_text
            x: 325
            y: 310
            width: 20
            text: component_pcie_1x
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_M2_slot_text.bottom
            anchors.topMargin: 10
            anchors.left: component_pcie_4x_text.right
            anchors.leftMargin: 10
        }

        Text {
            id: component_pcie_1x_text
            x: 347
            y: 310
            height: 22
            text: "(1x)"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_M2_slot_text.bottom
            anchors.topMargin: 10
            anchors.left: component_pcie_1x_value_text.right
            anchors.leftMargin: 2
        }

        Text {
            id: component_sata_slot_text
            width: 150
            height: 22
            text: "SATA Slot : " + component_sata_slot
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true

            anchors.top: component_pcie_1x_text.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 20

        }

        Text {
            id: component_power_pin_text
            height: 22
            text: "POWER pin : " + component_power_pin.substring(0, component_power_pin.length - 2)
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            layer.enabled: true
            font.pixelSize: 18

            anchors.top: component_pcie_1x_text.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.left: component_sata_slot_text.right
            anchors.leftMargin: 5
        }


        Text {
            id: component_buy_link_text
            height: 70

            text: "buy link : " + component_buy_link

            wrapMode: Text.WrapAnywhere
            font.pixelSize: 18

            anchors.top: component_power_pin_text.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20

            clip: true
        }

    }


    BorderImage {
        id: selected_border
        height: 450
        border.bottom: 0
        border.top: 0
        border.right: 0
        border.left: 0
        source: "../images/motherboard_selected_image.png"
        anchors.fill: parent
        visible: false
    }

}

