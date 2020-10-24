import QtQuick 2.0

Item {
    id : selected_item
    width: 200
    height: 200


    property string item_name: ""
    property string image_link: ""
    property int item_index: 0

    property Item main_script_object

    Rectangle {
        id: background
        anchors.fill: parent
        anchors.margins: 5
        radius: 5
        color: "#EEEEEE"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                main_script_object.selected_item_handler(item_name, item_index)
            }
        }

        Text {
            id: selected_item_name_text

            height: 22
            text: item_name

            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

            font.pixelSize: 12
            layer.enabled: true
        }

        BorderImage {
            id: item_image
            anchors.topMargin: selected_item_name_text.height
            anchors.fill: parent

            border.left: 10
            border.top: 10
            border.bottom: 10
            border.right: 10

            source: image_link

        }
    }




}
