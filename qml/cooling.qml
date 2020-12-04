import QtQuick 2.10
import Image_qml 1.0


Item {

    id :    cooling_grid_element
    width: 400
    height: 440

    property bool day_mode: false
    property string component_name : "nom"
    property string component_image_link : ""
    property string component_buy_link : ""
    property int component_price : 0

    property string component_supported_socket : ""
    property string component_cooling_size : ""
    property double component_cooling_min_sound_dB : 0.0
    property double component_cooling_max_sound_dB : 0.0
    property int component_cooling_min_speed : 0
    property int component_cooling_max_speed : 0
    property double component_air_flow_CFM : 0.0

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
                main_script_object.selected_cooling(selected_border, cooling_grid_element, borderImage.source)
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
            id: component_cooling_size_text
            x: 140
            y: 80
            width: 240
            text: "Size : " + component_cooling_size.substring(0, component_cooling_size.length - 2)
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_air_flow_text
            x: 136
            y: 110
            width: 240
            text: "Air Flow : " + component_air_flow_CFM + " CFM"
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_supported_socket_text
            x: 20
            y: 140
            width: 360
            height: 110
            text: "Supported Socket : " + component_supported_socket.substring(0, component_supported_socket.length - 2)
            wrapMode: Text.WordWrap
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_min_sound_text
            x: 20
            y: 260
            width: 180
            text: "Min Sound : " + component_cooling_min_sound_dB + " dB"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_max_sound_text
            x: 200
            y: 260
            width: 180
            text: "Max Sound : " + component_cooling_max_sound_dB + " dB"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_min_fan_speed_text
            x: 20
            y: 290
            width: 360
            text: "Min Fan Speed : " + component_cooling_min_speed + " RPM"
            visible: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_max_fan_speed_text
            x: 20
            y: 320
            width: 360
            text: "Max Fan Speed : " + component_cooling_max_speed + " RPM"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_buy_link_text
            x: 20
            y: 350
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
        height: 490
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
