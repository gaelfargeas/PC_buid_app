import QtQuick 2.15
import QtQuick.Window 2.10
//import QtQuick.Controls 2.13
import Compare_componant 1.0
import QtQuick.Layouts 1.11
import Qt.labs.qmlmodels 1.0

// for TableView
import QtQuick.Controls 1.4



Item {
    id: compare
    width: 720
    height: 570

    property bool is_compare_init: false

    Compare_componant{
        id: compare_componant
    }

    BorderImage {
        id: background

        anchors.fill: parent

        // source: "qrc:/qtquickplugin/images/template_image.png"


        Text {
            id: windows_name_text
            text: qsTr("COMPARE componant window")
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            height: 50
            clip: true

            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
        }


        ComboBox {
            id: component_type_comboBox

            width: 100
            anchors.left: parent.left
            anchors.leftMargin: (parent.width/2) - (width/2)
            anchors.top: windows_name_text.bottom
            anchors.topMargin: 20

            currentIndex: 0
            model: ["computer case", "motherboard", "CPU", "cooling", "RAM", "GPU", "storage", "power supply"]

            Component.onCompleted: {

                var computer_case_name_array = compare_componant.get_computer_case_name_list()
                var computer_case_model = ["",]

                for(var computer_case_prop in computer_case_name_array)
                {
                    computer_case_model.push(computer_case_name_array[computer_case_prop])
                }
                componant_names_cbb_1.model = computer_case_model
                componant_names_cbb_2.model = computer_case_model
            }

            onCurrentIndexChanged: {

                if(function_object != null){
                    function_object.clear_tableview_model()
                }
                if(currentIndex === 0)
                {
                    var computer_case_name_array = compare_componant.get_computer_case_name_list()
                    var computer_case_model = ["",]

                    for(var computer_case_prop in computer_case_name_array)
                    {
                        computer_case_model.push(computer_case_name_array[computer_case_prop])
                    }

                    componant_names_cbb_1.model = computer_case_model
                    componant_names_cbb_2.model = computer_case_model
                }
                else if(currentIndex === 1)
                {
                    var motherboard_name_array = compare_componant.get_motherboard_name_list()
                    var motherboard_model = ["",]

                    for(var motherboard_prop in motherboard_name_array)
                    {
                        motherboard_model.push(motherboard_name_array[motherboard_prop])
                    }

                    componant_names_cbb_1.model = motherboard_model
                    componant_names_cbb_2.model = motherboard_model
                }
                else if(currentIndex === 2)
                {
                    var cpu_name_array = compare_componant.get_cpu_name_list()
                    var cpu_model = ["",]

                    for(var cpu_prop in cpu_name_array)
                    {
                        cpu_model.push(cpu_name_array[cpu_prop])
                    }

                    componant_names_cbb_1.model = cpu_model
                    componant_names_cbb_2.model = cpu_model
                }
                else if(currentIndex === 3)
                {
                    var cooling_name_array = compare_componant.get_cooling_name_list()
                    var cooling_model = ["",]

                    for(var cooling_prop in cooling_name_array)
                    {
                        cooling_model.push(cooling_name_array[cooling_prop])
                    }

                    componant_names_cbb_1.model = cooling_model
                    componant_names_cbb_2.model = cooling_model
                }
                else if(currentIndex === 4)
                {
                    var ram_name_array = compare_componant.get_ram_name_list()
                    var ram_model = ["",]

                    for(var ram_prop in ram_name_array)
                    {
                        ram_model.push(ram_name_array[ram_prop])
                    }

                    componant_names_cbb_1.model = ram_model
                    componant_names_cbb_2.model = ram_model
                }
                else if(currentIndex === 5)
                {
                    var gpu_name_array = compare_componant.get_gpu_name_list()
                    var gpu_model = ["",]

                    for(var gpu_prop in gpu_name_array)
                    {
                        gpu_model.push(gpu_name_array[gpu_prop])
                    }

                    componant_names_cbb_1.model = gpu_model
                    componant_names_cbb_2.model = gpu_model
                }
                else if(currentIndex === 6)
                {
                    var storage_name_array = compare_componant.get_storage_name_list()
                    var storage_model = ["",]

                    for(var storage_prop in storage_name_array)
                    {
                        storage_model.push(storage_name_array[storage_prop])
                    }

                    componant_names_cbb_1.model = storage_model
                    componant_names_cbb_2.model = storage_model
                }
                else if(currentIndex === 7)
                {
                    var power_supply_name_array = compare_componant.get_power_supply_name_list()
                    var power_supply_model = ["",]

                    for(var power_supply_prop in power_supply_name_array)
                    {
                        power_supply_model.push(power_supply_name_array[power_supply_prop])
                    }

                    componant_names_cbb_1.model = power_supply_model
                    componant_names_cbb_2.model = power_supply_model
                }
            }
        }


        Grid {
            id: componant_names_grid

            height: 50
            spacing: 10

            rows: 1
            columns: 2

            anchors.top: component_type_comboBox.bottom
            anchors.topMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10

            ComboBox{
                id: componant_names_cbb_1
                width: ((parent.width)/2 ) - 5

                clip: true

                onCurrentIndexChanged: {
                    if (is_compare_init)
                    {
                        function_object.set_tableview_model()
                    }
                    else
                    {
                        is_compare_init = true
                    }
                }
            }

            ComboBox{
                id: componant_names_cbb_2
                width: ((parent.width)/2 ) - 5

                clip: true

                onCurrentIndexChanged: {
                    if(is_compare_init)
                    {
                        function_object.set_tableview_model()
                    }

                }

            }

        }


        TableView {
            id: tableview_componant
            anchors.top: componant_names_grid.bottom
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

            clip: true


            TableViewColumn {
                role: "values_name"
                title: " "
                width: 150
            }
            TableViewColumn {
                role: "component_1"
                title: "Component 1"
                width: 250
            }
            TableViewColumn {
                role: "component_2"
                title: "Component 2"
                width: 250
            }
            TableViewColumn {
                role: "result"
                title: "Result"
                width: 50
            }

            model: compare_componant_model

            itemDelegate: Rectangle{
                id: item_delegate

                border.color: "black"
                border.width: 1

                color: ( styleData.row % 2 == 0 ) ? "white" : "lightgrey"

                // 25 * (1 + (parent.width / text_delegate.paintedWidth) )

                Text{

                    anchors.fill: parent
                    text: styleData.value
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WordWrap

                }
            }

            rowDelegate: Rectangle{
                id: height_delegated
                height: 20

            }

        }

        ListModel{
            id: compare_componant_model
        }

    }

    Item {
        id: function_object

        function set_tableview_model()
        {
            clear_tableview_model()

            var cbb_index = component_type_comboBox.currentIndex

            var values_names_array = []
            var componant_1_values_array = {}
            var componant_2_values_array = {}


            if( cbb_index === 0)
            {
                values_names_array = ["name", "price", "supported motherboard size"]

                if(componant_names_cbb_1.currentText !== "")
                {
                    componant_1_values_array = compare_componant.get_computer_case(componant_names_cbb_1.currentText)
                }
                else
                {
                    componant_1_values_array = {"name": "" , "price": "" , "supported motherboard size": ""}
                }

                if(componant_names_cbb_2.currentText !== "")
                {
                    componant_2_values_array = compare_componant.get_computer_case(componant_names_cbb_2.currentText)
                }
                else
                {
                    componant_2_values_array = {"name": "" , "price": "" , "supported motherboard size": ""}
                }

            }
            else if( cbb_index === 1)
            {

                values_names_array = ["name", "price", "motherboard type", "POWER pin", "CPU chipset", "RAM type", "RAM slot number", "RAM max capacity",
                                      "RAM max slot", "GPU pcie 16x number", "GPU pcie 8x number", "GPU pcie 4x number", "GPU pcie 1x number", "SATA slot number",
                                      "M2 slot number", "CPU socket", "RAM speed supported"]

                if(componant_names_cbb_1.currentText !== "")
                {
                    componant_1_values_array = compare_componant.get_motherboard(componant_names_cbb_1.currentText)
                }
                else
                {
                    componant_1_values_array = {"name": "" , "price": "" , "motherboard type": "", "POWER pin": "", "CPU chipset": "", "RAM type": "", "RAM slot number": "", "RAM max capacity": "",
                        "RAM max slot": "", "GPU pcie 16x number": "", "GPU pcie 8x number": "", "GPU pcie 4x number": "", "GPU pcie 1x number": "", "SATA slot number": "",
                        "M2 slot number": "", "CPU socket": "", "RAM speed supported": ""}
                }

                if(componant_names_cbb_2.currentText !== "")
                {
                    componant_2_values_array = compare_componant.get_motherboard(componant_names_cbb_2.currentText)
                }
                else
                {
                    componant_2_values_array = {"name": "" , "price": "" , "motherboard type": "", "POWER pin": "", "CPU chipset": "", "RAM type": "", "RAM slot number": "", "RAM max capacity": "",
                        "RAM max slot": "", "GPU pcie 16x number": "", "GPU pcie 8x number": "", "GPU pcie 4x number": "", "GPU pcie 1x number": "", "SATA slot number": "",
                        "M2 slot number": "", "CPU socket": "", "RAM speed supported": ""}
                }

            }
            else if( cbb_index === 2)
            {
                values_names_array = ["name", "price", "CPU socket", "clock speed", "boosted clock speed", "cache L3",
                                      "core number", "thread number", "TDP", "supported RAM type", "max RAM speed", "CPU chipset"]

                if(componant_names_cbb_1.currentText !== "")
                {
                    componant_1_values_array = compare_componant.get_cpu(componant_names_cbb_1.currentText)
                }
                else
                {
                    componant_1_values_array = {"name": "" , "price": "" , "CPU socket": "", "clock speed": "", "boosted clock speed": "", "cache L3": "",
                        "core number": "", "thread number": "", "TDP": "", "supported RAM type": "", "max RAM speed": "", "CPU chipset": ""}
                }

                if(componant_names_cbb_2.currentText !== "")
                {
                    componant_2_values_array = compare_componant.get_cpu(componant_names_cbb_2.currentText)
                }
                else
                {
                    componant_2_values_array = {"name": "" , "price": "" , "CPU socket": "", "clock speed": "", "boosted clock speed": "", "cache L3": "",
                        "core number": "", "thread number": "", "TDP": "", "supported RAM type": "", "max RAM speed": "", "CPU chipset": ""}
                }

            }
            else if( cbb_index === 3)
            {
                values_names_array = ["name", "price", "cooling size", "cooling min sound", "cooling max sound",
                                      "cooling min speed", "cooling max speed", "air flow", "CPU socket"]

                if(componant_names_cbb_1.currentText !== "")
                {
                    componant_1_values_array = compare_componant.get_cooling(componant_names_cbb_1.currentText)
                }
                else
                {
                    componant_1_values_array = {"name": "" , "price": "" , "cooling size": "" , "cooling min sound": "" , "cooling max sound": ""
                        , "cooling min speed": "" , "cooling max speed": "" , "air flow": "" , "CPU socket": ""}
                }

                if(componant_names_cbb_2.currentText !== "")
                {
                    componant_2_values_array = compare_componant.get_cooling(componant_names_cbb_2.currentText)
                }
                else
                {
                    componant_2_values_array = {"name": "" , "price": "" , "cooling size": "" , "cooling min sound": "" , "cooling max sound": ""
                        , "cooling min speed": "" , "cooling max speed": "" , "air flow": "" , "CPU socket": ""}
                }

            }
            else if( cbb_index === 4)
            {
                values_names_array = ["name", "price", "RAM type", "memory size", "memory speed", "module number"]

                if(componant_names_cbb_1.currentText !== "")
                {
                    componant_1_values_array = compare_componant.get_ram(componant_names_cbb_1.currentText)
                }
                else
                {
                    componant_1_values_array = {"name": "" , "price": "" , "RAM type": "" , "memory size": "" , "memory speed": "" , "module number": ""}
                }

                if(componant_names_cbb_2.currentText !== "")
                {
                    componant_2_values_array = compare_componant.get_ram(componant_names_cbb_2.currentText)
                }
                else
                {
                    componant_2_values_array = {"name": "" , "price": "" , "RAM type": "" , "memory size": "" , "memory speed": "" , "module number": ""}
                }

            }
            else if( cbb_index === 5)
            {
                values_names_array = ["name", "price", "clock speed", "boosted clock speed", "GPU core number", "GPU bus",
                                      "GPU RAM type", "GPU RAM size", "GPU RAM frequency", "GPU flux", "power consumption", "power cable pin"]

                if(componant_names_cbb_1.currentText !== "")
                {
                    componant_1_values_array = compare_componant.get_gpu(componant_names_cbb_1.currentText)
                }
                else
                {
                    componant_1_values_array = {"name": "" , "price": "" , "clock speed": "" , "boosted clock speed": "" , "GPU core number": "" , "GPU bus": "",
                        "GPU RAM type": "" , "GPU RAM size": "" , "GPU RAM frequency": "" , "GPU flux": "" , "power consumption": "" , "power cable pin": ""}
                }

                if(componant_names_cbb_2.currentText !== "")
                {
                    componant_2_values_array = compare_componant.get_gpu(componant_names_cbb_2.currentText)
                }
                else
                {
                    componant_2_values_array = {"name": "" , "price": "" , "clock speed": "" , "boosted clock speed": "" , "GPU core number": "" , "GPU bus": "",
                        "GPU RAM type": "" , "GPU RAM size": "" , "GPU RAM frequency": "" , "GPU flux": "" , "power consumption": "" , "power cable pin": ""}
                }

            }
            else if( cbb_index === 6)
            {
                values_names_array = ["name", "price", "Read Speed", "Write Speed", "DD type", "capacity", "RPM"]

                if(componant_names_cbb_1.currentText !== "")
                {
                    componant_1_values_array = compare_componant.get_storage(componant_names_cbb_1.currentText)
                }
                else
                {
                    componant_1_values_array = {"name": "" , "price": "" , "Read Speed": "" , "Write Speed": "" , "DD type": "" , "capacity": "" , "RPM": ""}
                }

                if(componant_names_cbb_2.currentText !== "")
                {
                    componant_2_values_array = compare_componant.get_storage(componant_names_cbb_2.currentText)
                }
                else
                {
                    componant_2_values_array = {"name": "" , "price": "" , "Read Speed": "" , "Write Speed": "" , "DD type": "" , "capacity": "" , "RPM": ""}
                }

            }
            else if( cbb_index === 7)
            {
                values_names_array = ["name", "price", "Power supply standard", "Power (W)", "Sata power cable", "PCIE 6_2 power cable",
                                      "ATX 24 power cable", "ATX 4 pin", "Molex 4 power cable"]

                if(componant_names_cbb_1.currentText !== "")
                {
                    componant_1_values_array = compare_componant.get_power_supply(componant_names_cbb_1.currentText)
                }
                else
                {
                    componant_1_values_array = {"name": "" , "price": "" , "Power supply standard": "" , "Power (W)": "" , "Sata power cable": "" , "PCIE 6_2 power cable": "",
                        "ATX 24 power cable": "" , "ATX 4 pin": "" , "Molex 4 power cable": ""}
                }

                if(componant_names_cbb_2.currentText !== "")
                {
                    componant_2_values_array = compare_componant.get_power_supply(componant_names_cbb_2.currentText)
                }
                else
                {
                    componant_2_values_array = {"name": "" , "price": "" , "Power supply standard": "" , "Power (W)": "" , "Sata power cable": "" , "PCIE 6_2 power cable": "",
                        "ATX 24 power cable": "" , "ATX 4 pin": "" , "Molex 4 power cable": ""}
                }

            }

            for(var values_name_index in values_names_array)
            {

                compare_componant_model.append({"values_name": values_names_array[values_name_index],
                                                   "component_1": qsTr(componant_1_values_array[values_names_array[values_name_index]]),
                                                   "component_2": qsTr(componant_2_values_array[values_names_array[values_name_index]]),
                                                   "result": "test"})
            }

        }

        function clear_tableview_model()
        {
            compare_componant_model.clear()
        }

    }

}



