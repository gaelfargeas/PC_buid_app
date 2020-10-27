import QtQuick 2.0
import Image_qml 1.0


Item {

    id :    gpu_grid_element
    width: 400
    height: 380

    property bool day_mode: false
    property string component_name : "nom"
    property string component_image_link : ""
    property string component_buy_link : ""
    property int component_price : 0

    property int component_clock_speed : 0
    property int component_boost_clock : 0
    property int component_GPU_core_number : 0
    property string component_GPU_bus : ""
    property string component_GPU_ram_type : ""
    property int component_GPU_ram_size : 0
    property int component_GPU_ram_frequency_MHZ : 0
    property int component_GPU_flux : 0
    property int component_power_consumption : 0
    property string component_power_clable_pin : ""

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
                main_script_object.selected_gpu(selected_border, gpu_grid_element, borderImage.source)
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
            id: component_clock_speed_text
            x: 140
            y: 80
            width: 240
            text: "Clock Speed : " + component_clock_speed + " Mhz"
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_boosted_clock_speed_text
            x: 140
            y: 110
            width: 240
            text: "Boosted Clock : " + component_boost_clock + " Mhz"
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_gpu_core_text
            x: 20
            y: 140
            width: 120
            height: 22
            text: "Core : " + component_GPU_core_number
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_gpu_bus_slot_text
            x: 140
            y: 140
            width: 240
            height: 22
            text: "Bus Slot : " + component_GPU_bus.substring(0, component_GPU_bus.length - 2)
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_ram_type_text
            x: 20
            y: 170
            width: 180
            text: "ram type : " + component_GPU_ram_type.substring(0, component_GPU_ram_type.length - 2)
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_ram_size_text
            x: 220
            y: 170
            width: 160
            text: "ram size : " + component_GPU_ram_size + " GB"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_RAM_speed_text
            x: 20
            y: 200
            width: 200
            height: 22
            text: "RAM speed : " + component_GPU_ram_frequency_MHZ + " Mhz"
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_flux_text
            x: 220
            y: 200
            width: 160
            text: "Flux : " + component_GPU_flux
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_power_consumption_text
            x: 20
            y: 230
            width: 360
            text: "Power Consumption : " + component_power_consumption
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_power_clable_pin_text
            x: 20
            y: 260
            width: 360
            text: "Power Cable : " + component_power_clable_pin.substring(0, component_GPU_ram_type.length - 2)
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_buy_link_text
            x: 20
            y: 290
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
