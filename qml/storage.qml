import QtQuick 2.0
import Image_qml 1.0


Item {

    id :    storage_grid_element
    width: 400
    height: 240

    property bool day_mode: false
    property string component_name : "nom"
    property string component_image_link : ""
    property string component_buy_link : ""
    property int component_price : 0

    property string component_type : ""
    property int component_capacity_GO : 0
    property int component_RPM : 0
    property int component_Read_speed : 0
    property int component_Write_speed : 0

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
                main_script_object.selected_storage(selected_border, storage_grid_element, borderImage.source)
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
            id: component_type_text
            x: 140
            y: 80
            width: 240
            text: "Type : " + component_type.substring(0, component_type.length - 2)
            font.pixelSize: 18
            layer.enabled: true

            onTextChanged:
            {
                if (component_type.substring(0, component_type.length - 2) === "HDD")
                {
                    component_rpm_text.visible = true
                }else
                {
                   component_rpm_text.visible = false
                }
            }
        }

        Text {
            id: component_capacity_text
            x: 140
            y: 110
            width: 240
            text: "Memory Size : " + component_capacity_GO + " GB"
            font.pixelSize: 18
            layer.enabled: true
        }

        Text {
            id: component_rpm_text
            x: 20
            y: 130
            width: 120
            height: 22
            text: "RPM : " + component_RPM
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true

            Component.onCompleted: {
                if (component_RPM === "HDD, "){
                    component_rpm_text.visible = false
                }


            }
        }

        Text {
            id: component_read_write_speed_text
            x: 140
            y: 130
            width: 240
            height: 22
            text: "R/W speed : " + component_Read_speed + "/" + component_Write_speed + " GB/s"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 18
            layer.enabled: true

            Component.onCompleted: {
                if (component_RPM === "HDD, "){
                    component_rpm_text.visible = false
                }


            }
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
