import QtQuick 2.10
import Image_qml 1.0


Item {

    id :    cpu_grid_element
    width: 400
    height: 490

    property bool day_mode: false
    property string component_name : "nom"
    property string component_image_link : ""
    property string component_buy_link : ""
    property int component_price : 0

    property string component_socket : ""
    property string component_supported_chipset : ""
    property int component_clock_speed : 0
    property int component_boosted_speed : 0
    property int component_cache_L3_Mo : 0
    property int component_core_number : 0
    property int component_thread_number : 0
    property int component_TDP : 0
    property string component_supported_RAM_type : ""
    property string component_max_RAM_speed_MHZ : ""

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
                main_script_object.selected_cpu(selected_border, cpu_grid_element, borderImage.source)
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
            id: component_socket_text
            x: 140
            y: 80
            width: 240
            text: "Socket : " + component_socket.substring(0, component_socket.length - 2)
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_supported_chipset_text
            x: 20
            y: 130
            width: 360
            height: 84
            text: "Supported Chipset : " + component_supported_chipset.substring(0, component_supported_chipset.length - 2)
            wrapMode: Text.WordWrap
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_clock_speed_text
            x: 40
            y: 220
            width: 340
            height: 22
            text: "Clock speed : " + component_clock_speed + " Mhz"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_booster_clock_speed_text
            x: 40
            y: 250
            width: 340
            height: 22
            text: "Boosted clock speed : " + component_boosted_speed + " Mhz"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_core_text
            x: 40
            y: 280
            width: 160
            text: "Core : " + component_core_number
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_thread_text
            x: 200
            y: 280
            width: 180
            text: "Thread : " + component_thread_number
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_L3_cache_text
            x: 40
            y: 310
            width: 160
            height: 22
            text: "L3 cache : " + component_cache_L3_Mo + " MB"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_TDP_text
            x: 200
            y: 310
            width: 180
            text: "TDP : " + component_TDP
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_supported_ram_type_text
            x: 40
            y: 340
            width: 340
            height: 22
            text: "supported ram Type : " + component_supported_RAM_type.substring(0, component_supported_RAM_type.length - 2)
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_max_ram_speed_text
            x: 40
            y: 370
            width: 340
            height: 22
            text: "Max RAM speed : " + component_max_RAM_speed_MHZ.substring(0, component_max_RAM_speed_MHZ.length - 2)
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_buy_link_text
            x: 20
            y: 400
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
