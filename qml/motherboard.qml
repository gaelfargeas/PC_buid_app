import QtQuick 2.10
import Image_qml 1.0
import QtQuick.Controls 2.13

Item {

    id :    motherboard_grid_element
    width: 400
    height: 490

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
    property int component_pcie20_16x : 0
    property int component_pcie20_8x : 0
    property int component_pcie20_4x : 0
    property int component_pcie20_1x : 0
    property int component_pcie30_16x : 0
    property int component_pcie30_8x : 0
    property int component_pcie30_4x : 0
    property int component_pcie30_1x : 0
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
            x: 140
            y: 20
            width: 240
            text: component_name
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_price_text
            x: 140
            y: 50
            width: 240
            text: "price : " + component_price + " Euro"
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_size_text
            x: 140
            y: 80
            width: 240
            text: "motherboard size : " + component_size.substring(0, component_size.length - 2)
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_cpu_socket_text
            x: 140
            y: 110
            width: 240
            text: "CPU Socket : " + component_cpu_socket.substring(0, component_cpu_socket.length - 2)
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_cpu_chipset_text
            x: 20
            y: 140
            width: 210
            height: 22
            text: "CPU Shipset : " + component_cpu_chipset.substring(0, component_cpu_chipset.length - 2)
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_RAM_type_text
            x: 230
            y: 140
            width: 150
            height: 22
            text: "RAM Type : " + component_RAM_type.substring(0, component_RAM_type.length - 2)
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_RAM_speed_supported_text
            x: 20
            y: 170
            width: 360
            height: 70
            text: "RAM speed supported : " + component_RAM_speed_supported.substring(0, component_RAM_speed_supported.length - 2)
            wrapMode: Text.WordWrap
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_RAM_slot_text
            x: 20
            y: 250
            width: 120
            height: 22
            text: "RAM Slot : " + component_RAM_slot
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_RAM_max_text
            x: 20
            y: 280
            width: 180
            height: 22
            text: "Max RAM : " + component_RAM_max + " GB"
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_RAM_max_slot_text
            x: 140
            y: 250
            width: 240
            height: 22
            text: "Max RAM Per Slot : " + component_RAM_max + " GB"
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_pcie20_text
            x: 20
            y: 340
            text: "PCIE 2.0 :"
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_pcie30_text
            x: 20
            y: 310
            text: "PCIE 3.0 :"
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_pcie20_16x_value_text
            x: 105
            y: 340
            width: 20
            text: component_pcie20_16x
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_pcie30_16x_value_text
            x: 105
            y: 310
            width: 20
            text: component_pcie30_16x
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_pcie_16x_text
            x: 130
            y: 310
            height: 54
            text: "(16x)"
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_pcie20_8x_value_text
            x: 190
            y: 340
            width: 20
            text: component_pcie20_8x
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_pcie30_8x_value_text
            x: 190
            y: 310
            width: 20
            text: component_pcie30_8x
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_pcie20_8x_text
            x: 210
            y: 310
            height: 54
            text: "(8x)"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_pcie20_4x_value_text
            x: 260
            y: 340
            width: 20
            text: component_pcie20_4x
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_pcie30_4x_value_text
            x: 260
            y: 310
            width: 20
            text: component_pcie30_4x
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_pcie20_4x_text
            x: 280
            y: 310
            height: 54
            text: "(4x)"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_pcie20_1x_value_text
            x: 325
            y: 340
            width: 20
            text: component_pcie20_1x
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_pcie30_1x_value_text
            x: 325
            y: 310
            width: 20
            text: component_pcie30_1x
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_pcie20_1x_text
            x: 347
            y: 310
            height: 54
            text: "(1x)"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }


        Text {
            id: component_M2_slot_text
            x: 200
            y: 280
            width: 180
            text: "M.2 slot : " + component_M2_slot
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_sata_slot_text
            x: 20
            y: 370
            width: 150
            text: "SATA Slot : " + component_sata_slot
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_power_pin_text
            x: 170
            y: 370
            width: 210
            height: 22
            text: "POWER pin : " + component_power_pin.substring(0, component_power_pin.length - 2)
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            layer.enabled: true
            font.pixelSize: 18
        }


        Text {
            id: component_buy_link_text
            x: 20
            y: 398
            width: 360
            height: 70
            text: "buy link : " + component_buy_link
            wrapMode: Text.WrapAnywhere
            font.pixelSize: 18
            clip: true
        }

    }


    BorderImage {
        id: selected_border
        border.bottom: 0
        border.top: 0
        border.right: 0
        border.left: 0
        source: "../images/motherboard_selected_image.png"
        anchors.fill: parent
        visible: false
    }

}

