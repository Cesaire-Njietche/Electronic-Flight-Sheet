import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: window
    visible: true
    width: 1350
    height: 750
    property alias efs: efs
    title: qsTr("Electronic Flight Sheet")
    property bool first: true // Handle the open/close feature of the drawer
    property color secondaryColor: "#aee1f5"
    header: ToolBar {
        contentHeight: toolButton.implicitHeight
        id: toolBar
        property int w : (toolBar.width - toolButton.width)/2
        background: Rectangle {
            implicitHeight: 40
            //color: "#eeeeee"

            Canvas{
                id: c1
                width: toolBar.width/2
                x: toolButton.width
                height: toolBar.height
                contextType: "2d"
                onPaint: {
                    context.reset()
                    context.fillStyle = "#87CEFA"
                    context.moveTo(0,0)
                    context.lineTo(width, 0)
                    context.lineTo(width - 100, height)
                    context.lineTo(100, height)
                    context.closePath()
                    context.fill()
                }
            }
            Canvas{
                id: c2
                width: toolBar.width/2
                height: toolBar.height
                anchors.right: parent.right
                contextType: "2d"
                onPaint: {
                    context.reset()
                    context.fillStyle = "#a2a3a3"
                    //context.fillStyle = "#eb9021"
                    context.moveTo(100, 0)
                    context.lineTo(width - 100, 0)
                    context.lineTo(width, height)
                    context.lineTo(0, height)
                    context.closePath()
                    context.fill()
                }
            }

            /*Rectangle {
                    width: parent.width
                    height: 1
                    anchors.bottom: parent.bottom
                    color: "transparent"
                    border.color: "#21be2b"
                }*/
        }

        ToolButton {
            // property bool first: true // Handle the open/close feature of the drawer
            id: toolButton
            //text: efs.depth > 1 ? "\u25C0" : "\u2630"
            height: toolBar.height
            width: 40
            text:"\u2630"
            font.bold: true
            font.pixelSize: 25
            focus: true
            onClicked: {
                if (efs.depth > 1) {
                    //efs.pop()
                    first = false
                    drawer.open()
                } else {
                    if(first){
                        drawer.open()
                        first = false
                    }
                    else{
                        drawer.close()
                        first = true
                    }
                }
            }
            background: Rectangle{
                radius: toolButton.width/2
                border.color: "#87CEFA"
                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        parent.color = "#87CEFA"
                    }
                    onReleased: {
                        parent.color = "white"
                    }

                    onClicked: {
                        print('Yes')

                        if(first || !drawer.visible){
                            drawer.open()
                            first = false
                            print('Yes')
                        }
                        else{
                            drawer.close()
                            first = true
                        }
                    }

                }
            }
        }

        /*Label {
            text: efs.currentItem.title
            font.weight: Font.ExtraBold
            font.bold: true
            font.pointSize: 15
            font.family: "Courier"
            anchors.centerIn: parent

        }*/
    }

    Drawer {
        id: drawer
        width: window.width * 0.15
        height: window.height - toolBar.height
        y: toolBar.height

        background: Rectangle {
            Rectangle {
                x: parent.width - 1
                width: 1
                height: parent.height
                color: "#87CEFA"
            }
            Rectangle {
                width: parent.width
                height: 1
                color: "#87CEFA"
                visible: false
            }
        }

        Column {
            anchors.fill: parent
            //////
            //////Home
            //////
            ItemDelegate {
                id: home
                //property bool first: true
                text: qsTr(" HOME")
                font.weight: Font.Black
                font.pixelSize: 12
                width: parent.width
                font.bold: true
                icon.source: "home1.png"
                //font.family: "Century Schoolbook L"
                font.family: "Courier"
                topPadding: 20
                onClicked: {
                    efs.replace(efs.currentItem, "Home.qml")
                    flight_add.visible = false
                    flight_sheet.visible = false
                    flight_summary.visible = false
                    pilot_add.visible = false
                    pilot_sheet.visible = false
                    acft_add.visible = false
                    acft_sheet.visible = false
                    flight.first = true
                    pilot.first = true
                    acft.first = true
                    drawer.close()
                }
                highlighted: hovered
                background: Rectangle{

                    anchors.fill: home
                    color: home.highlighted? secondaryColor:"transparent"
                    onColorChanged: {
                        if(home.highlighted){
                            home.font.pixelSize = 15
                        }
                        else{
                            home.font.pixelSize = 12
                        }
                    }
                }
            }
            //////
            //////Flight
            //////
            ItemDelegate {
                id: flight
                property bool first: true
                text: qsTr(" FLIGHT")
                display: AbstractButton.TextBesideIcon
                font.weight: Font.Black
                font.pixelSize: 12
                font.bold: true
                //icon.source: "flight1.png"

                topPadding: 20
                //font.family: "Century Schoolbook L"
                font.family: "Courier"
                width: parent.width
                onClicked: {
                    //efs.push("Page1Form.ui.qml")
                    //drawer.close()

                        if(first){
                            flight_add.visible = true
                            flight_sheet.visible = true
                            flight_summary.visible = true
                            pilot_add.visible = false
                            pilot_sheet.visible = false
                            acft_add.visible = false
                            acft_sheet.visible = false
                            first = false
                            pilot.first = true
                            acft.first = true

                        }
                        else{
                            flight_add.visible = false
                            flight_sheet.visible = false
                            flight_summary.visible = false
                            first = true

                        }


                }
                highlighted: hovered
                background: Rectangle{
                    anchors.fill: flight
                    color: flight.highlighted? secondaryColor:"transparent"
                    onColorChanged: {
                        if(flight.highlighted){
                            flight.font.pixelSize = 15
                            //lab.color = "red"


                        }
                        else{
                            flight.font.pixelSize = 12
                            //lab.color = "black"
                        }
                    }
                }
                /*contentItem: Label{
                    id: lab
                    text: flight.text
                    verticalAlignment: Text.AlignVCenter

                    font.bold: true
                    font.weight: Font.Black
                    font.pointSize: 13
                    font.family: "Courier"
                }*/

            }

            ItemDelegate{
                id: flight_add
                visible: false
                text: qsTr(" New")
                font.weight: Font.Black
                font.bold: true
                font.pixelSize: 11

                //icon.source: "add2.png"
                width: parent.width
                font.family: "Courier"
                leftPadding: 30
                onClicked: {
                    efs.replace(efs.currentItem, "NewFlight.qml")
                    first = true
                    //efs.push("NewFlight.qml")
                    drawer.close()
                    acft_add.visible = false
                    acft_sheet.visible = false
                    pilot_add.visible = false
                    pilot_sheet.visible = false
                    flight_add.visible = false
                    flight_sheet.visible = false
                    flight_summary.visible = false
                    flight.first = true

                }
                highlighted: hovered
                background: Rectangle{
                    anchors.fill: flight_add
                    color: flight_add.highlighted? secondaryColor:"transparent"
                    onColorChanged: {
                        if(flight_add.highlighted){
                            flight_add.font.pixelSize = 15
                        }
                        else{
                            flight_add.font.pixelSize = 11
                        }
                    }
                }
            }

            ItemDelegate{
                id: flight_sheet
                visible: false
                text: qsTr(" Sheet")
                font.weight: Font.Black
                font.bold: true
                font.pixelSize: 11
                //icon.source: "list1.png"
                width: parent.width
                font.family: "Courier"
                leftPadding: 30
                onClicked: {
                    //efs.push("NewFlight.qml")
                    efs.replace(efs.currentItem, "FlightSheet.qml")
                    first = true
                    drawer.close()
                    acft_add.visible = false
                    acft_sheet.visible = false
                    pilot_add.visible = false
                    pilot_sheet.visible = false
                    flight_add.visible = false
                    flight_sheet.visible = false
                    flight_summary.visible = false
                    flight.first = true
                }
                highlighted: hovered
                background: Rectangle{
                    anchors.fill: flight_sheet
                    color: flight_sheet.highlighted? secondaryColor:"transparent"
                    onColorChanged: {
                        if(flight_sheet.highlighted){
                            flight_sheet.font.pixelSize = 15
                        }
                        else{
                            flight_sheet.font.pixelSize = 11
                        }
                    }
                }
            }
            ItemDelegate{
                id: flight_summary
                visible: false
                text: qsTr(" Summary")
                font.weight: Font.Black
                font.bold: true
                font.pixelSize: 11
                //icon.source: "info.png"
                width: parent.width
                font.family: "Courier"
                leftPadding: 30
                onClicked: {
                    //efs.push("NewFlight.qml")
                    efs.replace(efs.currentItem, "FlightSummary.qml")
                    first = true
                    drawer.close()
                    acft_add.visible = false
                    acft_sheet.visible = false
                    pilot_add.visible = false
                    pilot_sheet.visible = false
                    flight_add.visible = false
                    flight_sheet.visible = false
                    flight_summary.visible = false
                    flight.first = true
                }
                highlighted: hovered
                background: Rectangle{
                    anchors.fill: flight_summary
                    color: flight_summary.highlighted? secondaryColor:"transparent"
                    onColorChanged: {
                        if(flight_summary.highlighted){
                            flight_summary.font.pixelSize = 15
                        }
                        else{
                            flight_summary.font.pixelSize = 11
                        }
                    }
                }
            }
            //////
            //////Pilot
            //////

            ItemDelegate {
                id: pilot
                property bool first: true
                text: qsTr(" PILOT")
                font.weight: Font.Black
                font.pixelSize: 12
                //icon.source: "pilot.png"
                width: parent.width
                font.bold: true
                topPadding: 20
                //font.family: "Century Schoolbook L"
                font.family: "Courier"
                onClicked: {
                    //efs.push("Page2Form.ui.qml")
                    //drawer.close()
                        if(first){
                            pilot_add.visible = true
                            pilot_sheet.visible = true
                            flight_add.visible = false
                            flight_sheet.visible = false
                            flight_summary.visible = false
                            acft_add.visible = false
                            acft_sheet.visible = false
                            first = false
                            flight.first = true
                            acft.first = true

                        }
                        else{
                            pilot_add.visible = false
                            pilot_sheet.visible = false
                            first = true

                        }

                }
                highlighted: hovered
                background: Rectangle{
                    anchors.fill: pilot
                    color: pilot.highlighted? secondaryColor:"transparent"
                    onColorChanged: {
                        if(pilot.highlighted){
                            pilot.font.pixelSize = 15
                        }
                        else{
                            pilot.font.pixelSize = 12
                        }
                    }
                }
            }
            ItemDelegate{
                id: pilot_add
                visible: false
                text: qsTr(" Add")
                font.weight: Font.Black
                font.bold: true
                font.pixelSize: 11
                //icon.source: "add3.png"
                width: parent.width
                font.family: "Courier"
                leftPadding: 30
                onClicked: {
                    //efs.push("NewPilot.qml")
                    efs.replace(efs.currentItem, "NewPilot.qml")
                    first = true
                    drawer.close()
                    acft_add.visible = false
                    acft_sheet.visible = false
                    pilot_add.visible = false
                    pilot_sheet.visible = false
                    flight_add.visible = false
                    flight_sheet.visible = false
                    flight_summary.visible = false
                    pilot.first = true
                }
                highlighted: hovered
                background: Rectangle{
                    anchors.fill: pilot_add
                    color: pilot_add.highlighted? secondaryColor:"transparent"
                    onColorChanged: {
                        if(pilot_add.highlighted){
                            pilot_add.font.pixelSize = 15
                        }
                        else{
                            pilot_add.font.pixelSize = 11
                        }
                    }
                }
            }
            ItemDelegate{
                id: pilot_sheet
                visible: false
                text: qsTr(" Sheet")
                font.bold: true
                font.weight: Font.Black
                font.pixelSize: 11
                //icon.source: "list1.png"
                width: parent.width
                font.family: "Courier"
                leftPadding: 30
                onClicked: {
                    //efs.push("NewFlight.qml")
                    efs.replace(efs.currentItem, "PilotSheet.qml")
                    first = true
                    drawer.close()
                    acft_add.visible = false
                    acft_sheet.visible = false
                    pilot_add.visible = false
                    pilot_sheet.visible = false
                    flight_add.visible = false
                    flight_sheet.visible = false
                    flight_summary.visible = false
                    pilot.first = true
                }
                highlighted: hovered
                background: Rectangle{
                    anchors.fill: pilot_sheet
                    color: pilot_sheet.highlighted? secondaryColor:"transparent"
                    onColorChanged: {
                        if(pilot_sheet.highlighted){
                            pilot_sheet.font.pixelSize = 15
                        }
                        else{
                            pilot_sheet.font.pixelSize = 11
                        }
                    }
                }
            }

            //////
            //////Aircraft
            //////

            ItemDelegate {
                id: acft
                property bool first: true
                text: qsTr(" AIRCRAFT")
                font.weight: Font.Black
                font.pixelSize: 12
                //icon.source: "helicopter.png"
                width: parent.width
                topPadding: 20
                font.bold: true
                //font.family: "Century Schoolbook L"
                font.family: "Courier"
                onClicked: {
                    //efs.push("Page2Form.ui.qml")
                    //drawer.close()

                        if(first){
                            acft_add.visible = true
                            acft_sheet.visible = true
                            pilot_add.visible = false
                            pilot_sheet.visible = false
                            flight_add.visible = false
                            flight_sheet.visible = false
                            flight_summary.visible = false
                            first = false
                            flight.first = true
                            pilot.first = true
                        }
                        else{
                            acft_add.visible = false
                            acft_sheet.visible = false
                            first = true

                        }

                }
                highlighted: hovered
                background: Rectangle{
                    anchors.fill: acft
                    color: acft.highlighted? secondaryColor:"transparent"
                    onColorChanged: {
                        if(acft.highlighted){
                            acft.font.pixelSize = 15
                        }
                        else{
                            acft.font.pixelSize = 12
                        }
                    }
                }
            }
            ItemDelegate{
                id: acft_add
                visible: false
                text: qsTr(" Add")
                font.weight: Font.Black
                font.bold: true
                font.pixelSize: 11
                //icon.source: "add2.png"
                width: parent.width
                font.family: "Courier"
                leftPadding: 30
                onClicked: {
                    //efs.push("NewFlight.qml")
                    efs.replace(efs.currentItem, "main.qml")
                    first = true
                    drawer.close()
                    acft_add.visible = false
                    acft_sheet.visible = false
                    pilot_add.visible = false
                    pilot_sheet.visible = false
                    flight_add.visible = false
                    flight_sheet.visible = false
                    flight_summary.visible = false
                    acft.first = true
                }
                highlighted: hovered
                background: Rectangle{
                    anchors.fill: acft_add
                    color: acft_add.highlighted? secondaryColor:"transparent"
                    onColorChanged: {
                        if(acft_add.highlighted){
                            acft_add.font.pixelSize = 15
                        }
                        else{
                            acft_add.font.pixelSize = 11
                        }
                    }
                }
            }
            ItemDelegate{
                id: acft_sheet
                visible: false
                text: qsTr(" Sheet")
                font.weight: Font.Black
                font.bold: true
                //icon.source: "list2.png"
                font.pixelSize: 11
                width: parent.width
                font.family: "Courier"
                leftPadding: 30
                onClicked: {
                    efs.replace(efs.currentItem, "main.qml")
                    first = true
                    drawer.close()
                    acft_add.visible = false
                    acft_sheet.visible = false
                    pilot_add.visible = false
                    pilot_sheet.visible = false
                    flight_add.visible = false
                    flight_sheet.visible = false
                    flight_summary.visible = false
                    acft.first = true
                }
                highlighted: hovered
                background: Rectangle{
                    anchors.fill: acft_sheet
                    color: acft_sheet.highlighted? secondaryColor:"transparent"
                    onColorChanged: {
                        if(acft_sheet.highlighted){
                            acft_sheet.font.pixelSize = 15
                        }
                        else{
                            acft_sheet.font.pixelSize = 11
                        }
                    }
                }
            }


        }
    }

    StackView {
        id: efs
        initialItem: "Home.qml"
        anchors.fill: parent
        popEnter: Transition {
            XAnimator {
                from: (efs.mirrored ? -1 : 1) * -efs.width
                to: 0
                duration: 400
                easing.type: Easing.OutCubic
            }
        }

        popExit: Transition {
            XAnimator {
                from: 0
                to: (efs.mirrored ? -1 : 1) * efs.width
                duration: 400
                easing.type: Easing.OutCubic
            }
        }
        /*transform: Translate {
            x: drawer.position * efs.width * 0.33
        }*/
    }
    Component.onCompleted: {
        //drawer.open()
        //first = false
        //drawer.modal = false
        //drawer.position = 0.5
    }
}

/*##^##
Designer {
    D{i:0;height:700;width:1300}
}
##^##*/
