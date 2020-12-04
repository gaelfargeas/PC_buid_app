import QtQuick 2.10
import Image_qml 1.0


Item {

    id :    computer_case_grid_element
    width: 400
    height: 240

    property bool day_mode: false
    property string component_name : "nom"
    property string component_supported_motherboard_size : ""
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
                main_script_object.selected_computer_case(selected_border, computer_case_grid_element, borderImage.source)
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
            id: component_supported_motherboard_size_text
            x: 140
            y: 94
            width: 240
            height: 58
            text: component_supported_motherboard_size.substring(0, component_supported_motherboard_size.length - 2)
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
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
            id: component_buy_link_text
            x: 20
            y: 158
            width: 360
            height: 74
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
