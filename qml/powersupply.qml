import QtQuick 2.0
import Image_qml 1.0


Item {

    id :    power_supply_grid_element
    width: 400
    height: 320

    property bool day_mode: false
    property string component_name : "nom"
    property string component_image_link : ""
    property string component_buy_link : ""
    property int component_price : 0

    property string component_standard : ""
    property string component_power_W : ""
    property int component_sata_power_cable : 0
    property int component_pcie6_2_power_cable : 0
    property int component_ATX_24_power_cable : 0
    property int component_ATX_4_power_cable : 0
    property int component_molex4_power_cable : 0

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
                main_script_object.selected_power_supply(selected_border, power_supply_grid_element, borderImage.source)
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
            id: component_standard_text
            x: 140
            y: 80
            width: 240
            text: "Standard : " + component_standard.substring(0, component_standard.length - 2)
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_power_text
            x: 140
            y: 110
            width: 240
            text: "Power : " + component_power_W.substring(0, component_power_W.length - 2)
            font.pixelSize: 18
            layer.enabled: true
        }


        Text {
            id: component_sata_text
            x: 20
            y: 140
            width: 180
            text: "SATA cables : " + component_sata_power_cable
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_pcie_6_2_text
            x: 200
            y: 140
            width: 180
            text: "PCIe 6+2 cables : " + component_pcie6_2_power_cable
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_atx24_text
            x: 20
            y: 170
            width: 180
            text: "ATX 24pin cables : " + component_ATX_24_power_cable
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_atx_4pin_text
            x: 200
            y: 170
            width: 180
            text: "ATX 4 pin cables : " + component_ATX_4_power_cable
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_molex_4_text
            x: 20
            y: 200
            width: 360
            text: "Molex 4 pin cables : " + component_molex4_power_cable
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }


        Text {
            id: component_buy_link_text
            x: 20
            y: 230
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

/*##^##
Designer {
    D{i:1;anchors_height:100;anchors_width:100;anchors_x:22;anchors_y:17}
}
##^##*/
