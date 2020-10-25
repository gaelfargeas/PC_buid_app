import QtQuick 2.0
import Image_qml 1.0


Item {

    id :    ram_grid_element
    width: 400
    height: 240

    property string component_name : "nom"
    property string component_image_link : ""
    property string component_buy_link : ""
    property int component_price : 0

    property string component_RAM_type : ""
    property int component_memory_size : 0
    property string component_memory_speed : ""
    property int component_module_number : 0
    property string component_cas_latency : ""


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
        color: "#EEEEEE"


        MouseArea{
            anchors.fill: parent
            onClicked: {
                main_script_object.selected_ram(selected_border, ram_grid_element, borderImage.source)
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
            id: component_ram_type_text
            x: 140
            y: 80
            width: 240
            text: "RAM type : " + component_RAM_type.substring(0, component_RAM_type.length - 2)
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_memory_size_text
            x: 140
            y: 110
            width: 240
            text: "Total Memory : "+component_memory_size + "GB ("+ component_module_number + "x" + component_memory_size/component_module_number + "GB)"
            layer.enabled: true
            font.pixelSize: 18
        }

        Text {
            id: component_memory_speed_text
            x: 20
            y: 140
            width: 360
            text: "Memory Speed : " + component_memory_speed.substring(0, component_memory_speed.length - 2)
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            layer.enabled: true
            font.pixelSize: 18
        }


        Text {
            id: component_buy_link_text
            x: 20
            y: 170
            width: 360
            height: 50
            text: "buy link : " + component_buy_link
            wrapMode: Text.WrapAnywhere
            font.pixelSize: 18
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
