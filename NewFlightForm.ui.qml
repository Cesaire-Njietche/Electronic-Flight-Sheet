import QtQuick 2.12
import QtQuick.Controls 2.12
//import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
//import QtQuick.Dialogs.qml 1.0
import QtCharts 2.3
import QtQuick.Controls.Universal 2.0

Page {
    id: page
    title: qsTr("New Flight")
    //property alias calendar: calendar
    property bool pageOnCompleted: false
    property alias page: page
    Layout.fillHeight: true
    Layout.fillWidth: true
    property color primaryColor: "#F1F8E9"
    property color primaryDarkColor: "#558B2F"
    property color buttonPressedColor: "#b5edf9"
    property color secondaryDarkColor: "#21a3b3"
    property color secondaryDarkColor2: "#009bd7"
    property color secondaryColor: "#e1f8fd"
    property color secondaryColor2: "#45c2e8"
    property color backgroundColor: "#d9dbdb"
    property alias cancel: cancel
    property alias reset: reset
    property alias save: save
    property alias bckg_save: bckg_save
    property alias bckg_reset: bckg_reset
    property alias bckg_cancel: bckg_cancel
    property alias takeoffTime: takeoffTime
    property alias takeoff_time: takeoff_time
    property alias landing_time: landing_time
    property alias landingTime: landingTime
    property alias flightRegime: flightRegime
    property alias aircraft_id: aircraft_id
    property alias aircraft_type: aircraft_type
    property alias canvas: canvas
    property alias canvasfoff: canvasfoff
    property alias canvasPic: canvasPic
    property alias firstOff: firstOff
    property alias pic: pic
    property alias arrival_loc: arrival_loc
    property alias depart_loc: depart_loc
    property alias flightRule: flightRule
    property alias mission: mission
    property alias route: route
    property alias observation: observation
    property alias grade: grade
    property alias another: another
    property alias filling_date: filling_date
    property alias filling_dateB: filling_dateB
    background: Rectangle {
        /*AnimatedImage {
            speed: 0.05
            fillMode: Image.Tile
            source: "vid11.webp"
            anchors.fill: parent
            cache: true
        }*/
    }

    FlightSaveBox {
        id: another
        visible: false
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    }

    //title: qsTr("Page 1")
    ColumnLayout {
        anchors {
            margins: 5
            fill: parent
        }
        //spacing: 2
        Rectangle {
            anchors.fill: parent
            radius: 5
            color: backgroundColor
            border.color: secondaryColor
        }

        Label {
            text: "NEW FLIGHT"
            font.pixelSize: 15
            style: Text.Sunken
            id: new_flight
            wrapMode: Text.WordWrap
            font {
                weight: Font.ExtraBold
                capitalization: Font.AllUppercase
                family: "Courier"
            }
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Rectangle {
            id: rect
            anchors.top: new_flight.bottom
            Layout.fillWidth: true
            Layout.preferredHeight: 2
            //anchors.bottomMargin: 10
            anchors.topMargin: 10
            Layout.leftMargin: 15
            Layout.rightMargin: 15
        }
        RowLayout {
            id: acftCrew
            width: 1070
            anchors.top: rect.bottom
            spacing: 10
            anchors.topMargin: 10
            Layout.leftMargin: 15
            //anchors.horizontalCenter: parent.horizontalCenter
            //anchors.centerIn: parent
            RowLayout {
                spacing: 10
                    Label {
                        text: "Filling Date:"
                        font.pixelSize: 11
                        style: Text.Sunken
                        font {
                            family: "Courier"
                        }
                    }
                    TextField {
                        id: filling_date
                        font.bold: true
                        font.pixelSize: 11
                        font.weight: Font.Normal
                        font.family: "Courier"
                        placeholderText: "DD/MM/YEAR"
                        //Layout.fillHeight: true
                        Layout.preferredHeight: 25
                        Layout.preferredWidth: 145
                        enabled: false
                        background: Rectangle {
                            color: "transparent"
                            border.color: secondaryColor2
                        }
                    }

                    CalendarButton {
                        id: filling_dateB
                        height: 25
                    }

            }
            GroupBox {
                id: aircraft

                //width: parent.width
                height: 400
                title: "AIRCRAFT"
                label: Label {

                    textFormat: Text.PlainText
                    bottomPadding: 2
                    font.weight: Font.Black
                    font.bold: true
                    font.family: "Courier"
                    width: aircraft.availableWidth
                    text: aircraft.title
                    font.pixelSize: 12
                }
                RowLayout {
                    spacing: 50
                    ColumnLayout {
                        spacing: 5
                        Label {
                            text: "REGISTRATION "
                            font.pixelSize: 11
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }
                        ComboBox {
                            id: aircraft_id
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "aircraft id"
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 30
                            //cBColor: backgroundColor
                            delegate: ItemDelegate {
                                width: aircraft_id.width
                                contentItem: Text {
                                    text: model.Registration
                                    font.pixelSize: 14
                                    font.family: "Courier"
                                    elide: Text.ElideRight
                                    verticalAlignment: Text.AlignVCenter
                                }
                                highlighted: aircraft_id.highlightedIndex === index
                            }
                            indicator: Canvas {
                                id: canvas
                                x: aircraft_id.width - width - aircraft_id.rightPadding
                                y: aircraft_id.topPadding
                                   + (aircraft_id.availableHeight - height) / 2
                                width: 12
                                height: 8
                                contextType: "2d"


                                /*Connections {
                                    target: aircraft_id
                                    function onPressedChanged() {
                                        canvas.requestPaint()
                                    }
                                }

                                onPaint: {
                                    var ctxt = canvas.getContext("2d")
                                    ctxt.reset()
                                    ctxt.moveTo(0, 0)
                                    ctxt.lineTo(width, 0)
                                    ctxt.lineTo(width / 2, height)
                                    ctxt.closePath()
                                    ctxt.fillStyle = aircraft_id.pressed ? secondaryDarkColor2 : secondaryColor2
                                    ctxt.fill()
                                }*/
                            }

                            contentItem: Text {
                                leftPadding: 0
                                rightPadding: aircraft_id.indicator.width + aircraft_id.spacing

                                text: aircraft_id.displayText
                                font: aircraft_id.font
                                //color: control.pressed ? "#17a81a" : "#21be2b"
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                                horizontalAlignment: Text.AlignHCenter
                            }

                            background: Rectangle {
                                id: recta
                                border.color: aircraft_id.pressed ? secondaryDarkColor2 : secondaryColor2
                                border.width: aircraft_id.visualFocus ? 2 : 1
                                radius: 2
                            }
                            textRole: "Registration"
                            model: AircraftModel
                        }
                    }
                    ColumnLayout {
                        spacing: 5
                        Label {
                            text: "TYPE "
                            font.pixelSize: 13
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }
                        TextField {
                            id: aircraft_type
                            font.pixelSize: 11
                            font.family: "Courier"
                            //text: aircraft_id.model.get(
                            //        aircraft_id.currentIndex).Type
                            horizontalAlignment: Text.AlignHCenter
                            Layout.preferredHeight: 30
                            Layout.preferredWidth: 150

                            background: Rectangle {
                                //color: "transparent"
                                border.color: secondaryColor2
                            }
                        }
                    }
                }
            }
            GroupBox {
                id: crew
                //width: parent.width
                height: 200
                label: Label {
                    text: crew.title
                    font.pixelSize: 12
                    textFormat: Text.PlainText
                    wrapMode: Text.NoWrap
                    bottomPadding: 0
                    font.weight: Font.Black
                    font.bold: true
                    font.family: "Courier"
                }

                title: qsTr("CREW")

                RowLayout {
                    spacing: 50
                    ColumnLayout {
                        spacing: 5
                        Label {
                            text: "PILOT IN COMMAND "
                            font.pixelSize: 11
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }
                        ComboBox {
                            id: pic
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "pilot in command"
                            Layout.preferredWidth: 200
                            Layout.preferredHeight: 30
                            //cBColor: backgroundColor
                            delegate: ItemDelegate {
                                width: pic.width
                                contentItem: Text {
                                    text: model.name + " " + model.surname
                                    font.pixelSize: 14
                                    font.family: "Courier"
                                    elide: Text.ElideRight
                                    verticalAlignment: Text.AlignVCenter
                                }
                                highlighted: pic.highlightedIndex === index
                            }
                            indicator: Canvas {
                                id: canvasPic
                                x: pic.width - width - pic.rightPadding
                                y: pic.topPadding + (pic.availableHeight - height) / 2
                                width: 12
                                height: 8
                                contextType: "2d"


                                /*Connections {
                                    target: aircraft_id
                                    function onPressedChanged() {
                                        canvas.requestPaint()
                                    }
                                }

                                onPaint: {
                                    var ctxt = canvas.getContext("2d")
                                    ctxt.reset()
                                    ctxt.moveTo(0, 0)
                                    ctxt.lineTo(width, 0)
                                    ctxt.lineTo(width / 2, height)
                                    ctxt.closePath()
                                    ctxt.fillStyle = aircraft_id.pressed ? secondaryDarkColor2 : secondaryColor2
                                    ctxt.fill()
                                }*/
                            }

                            contentItem: Text {
                                leftPadding: 0
                                rightPadding: pic.indicator.width + pic.spacing

                                text: pic.displayText
                                font: pic.font
                                //color: control.pressed ? "#17a81a" : "#21be2b"
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                                horizontalAlignment: Text.AlignHCenter
                            }

                            background: Rectangle {
                                id: rectpic
                                border.color: pic.pressed ? secondaryDarkColor2 : secondaryColor2
                                border.width: pic.visualFocus ? 2 : 1
                                radius: 2
                            }
                            textRole: "name"
                            model: PilotModel
                        }
                    }
                    ColumnLayout {
                        spacing: 5
                        Label {
                            text: "CO-PILOT"
                            font.pixelSize: 13
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }
                        ComboBox {
                            id: firstOff
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "aircraft id"
                            Layout.preferredWidth: 200
                            Layout.preferredHeight: 30
                            //cBColor: backgroundColor
                            delegate: ItemDelegate {
                                width: firstOff.width
                                contentItem: Text {
                                    text: model.name + " " + model.surname
                                    font.pixelSize: 14
                                    font.family: "Courier"
                                    elide: Text.ElideRight
                                    verticalAlignment: Text.AlignVCenter
                                }
                                highlighted: firstOff.highlightedIndex === index
                            }
                            indicator: Canvas {
                                id: canvasfoff
                                x: firstOff.width - width - firstOff.rightPadding
                                y: firstOff.topPadding + (firstOff.availableHeight - height) / 2
                                width: 12
                                height: 8
                                contextType: "2d"


                                /*Connections {
                                    target: aircraft_id
                                    function onPressedChanged() {
                                        canvas.requestPaint()
                                    }
                                }

                                onPaint: {
                                    var ctxt = canvas.getContext("2d")
                                    ctxt.reset()
                                    ctxt.moveTo(0, 0)
                                    ctxt.lineTo(width, 0)
                                    ctxt.lineTo(width / 2, height)
                                    ctxt.closePath()
                                    ctxt.fillStyle = aircraft_id.pressed ? secondaryDarkColor2 : secondaryColor2
                                    ctxt.fill()
                                }*/
                            }

                            contentItem: Text {
                                leftPadding: 0
                                rightPadding: firstOff.indicator.width + firstOff.spacing

                                text: firstOff.displayText
                                font: firstOff.font
                                //color: control.pressed ? "#17a81a" : "#21be2b"
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                                horizontalAlignment: Text.AlignHCenter
                            }

                            background: Rectangle {
                                id: rectfoff
                                border.color: firstOff.pressed ? secondaryDarkColor2 : secondaryColor2
                                border.width: firstOff.visualFocus ? 2 : 1
                                radius: 2
                            }
                            textRole: "name"
                            model: PilotModel
                        }
                    }
                }
            }
        }

        Rectangle {
            id: rect2
            anchors.top: acftCrew.bottom
            Layout.fillWidth: true
            Layout.preferredHeight: 2
            //anchors.bottomMargin: 5
            anchors.topMargin: 10
            Layout.leftMargin: 15
            Layout.rightMargin: 15
        }

        GroupBox {
            id: flightDetail
            //width: parent.width - 15
            anchors.topMargin: 10
            Layout.leftMargin: 15

            anchors.top: rect2.bottom
            //anchors.horizontalCenter: parent.horizontalCenter
            //Layout.fillWidth: true
            //height: 400
            label: Label {
                text: flightDetail.title
                font.pixelSize: 12
                bottomPadding: 2
                font.weight: Font.Black
                textFormat: Text.PlainText
                font.bold: true
                font.family: "Courier"
            }

            title: qsTr("FLIGHT DETAIL")
            //anchors.centerIn: parent
            ColumnLayout {
                spacing: 10
                GroupBox {
                    id: depart_field
                    //width: parent.width
                    height: 200
                    label: Label {
                        text: depart_field.title
                        font.pixelSize: 12
                        textFormat: Text.PlainText
                        wrapMode: Text.NoWrap
                        bottomPadding: 0
                        font.weight: Font.Black
                        font.bold: true
                        font.family: "Courier"
                    }

                    title: qsTr("DEPARTURE/ARRIVAL AIRFIELD")

                    RowLayout {
                        spacing: 150
                        ColumnLayout {
                            spacing: 5
                            Label {
                                text: "DEPARTURE AIRFIELD "
                                font.pixelSize: 11
                                style: Text.Sunken
                                font {
                                    family: "Courier"
                                }
                            }
                            TextField {
                                id: depart_loc
                                font.bold: false
                                font.pixelSize: 11
                                font.family: "Courier"
                                font.weight: Font.Normal
                                Layout.preferredHeight: 30
                                Layout.preferredWidth: 150
                                background: Rectangle {
                                    //color: "transparent"
                                    border.color: secondaryColor2
                                }
                            }
                        }
                        ColumnLayout {
                            spacing: 5
                            Label {
                                text: "TAKEOFF TIME "
                                font.pixelSize: 11
                                style: Text.Sunken
                                font {
                                    family: "Courier"
                                }
                            }
                            RowLayout {
                                TextField {
                                    id: takeoff_time
                                    font.pixelSize: 11
                                    font.bold: true
                                    font.family: "Courier"
                                    placeholderText: "HH:SS AM/PM"
                                    //Layout.fillHeight: true
                                    Layout.preferredHeight: 30
                                    Layout.preferredWidth: 150
                                    enabled: false
                                    background: Rectangle {
                                        color: "transparent"
                                        border.color: secondaryColor2
                                    }
                                }

                                TimeButtonAMPM {
                                    id: takeoffTime
                                }
                            }
                        }
                        ColumnLayout {
                            spacing: 5
                            Label {
                                text: "ARRIVAL AIRFIELD "
                                font.pixelSize: 11
                                style: Text.Sunken
                                font {
                                    family: "Courier"
                                }
                            }
                            TextField {
                                id: arrival_loc
                                font.bold: false
                                font.pixelSize: 11
                                font.family: "Courier"
                                font.weight: Font.Normal
                                Layout.preferredHeight: 30
                                Layout.preferredWidth: 150
                                background: Rectangle {
                                    //color: "transparent"
                                    border.color: secondaryColor2
                                }
                            }
                        }
                        ColumnLayout {
                            spacing: 5
                            Label {
                                text: "LANDING TIME "
                                font.pixelSize: 11
                                style: Text.Sunken
                                font {
                                    family: "Courier"
                                }
                            }
                            RowLayout {
                                TextField {
                                    id: landing_time
                                    font.pixelSize: 11
                                    font.bold: true
                                    font.family: "Courier"
                                    placeholderText: "HH:SS AM/PM"
                                    //Layout.fillHeight: true
                                    Layout.preferredHeight: 30
                                    Layout.preferredWidth: 150
                                    enabled: false
                                    background: Rectangle {
                                        color: "transparent"
                                        border.color: secondaryColor2
                                    }
                                }

                                TimeButtonAMPM {
                                    id: landingTime
                                }
                            }
                        }
                    }
                }
                RowLayout {
                    Layout.leftMargin: 10
                    spacing: 185

                    ColumnLayout {
                        spacing: 5
                        Label {
                            text: "FLIGHT RULE "
                            font.pixelSize: 11
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }
                        CustomComboBox {
                            id: flightRule
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "flight rule"
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 30
                            //height: 35
                            // cBColor: backgroundColor
                            model: ["VFR", "IFR"]
                        }
                    }
                    ColumnLayout {
                        spacing: 5
                        Label {
                            text: "FLIGHT REGIME "
                            font.pixelSize: 11
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }
                        CustomComboBox {
                            id: flightRegime
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "flight rule"
                            Layout.preferredWidth: 200
                            Layout.preferredHeight: 30
                            //height: 35
                            // cBColor: backgroundColor
                            model: ["GENERAL AVIATION", "MILITARY OPS"]
                        }
                    }
                    ColumnLayout {
                        spacing: 5
                        Label {
                            text: "MISSION "
                            font.pixelSize: 11
                            font.bold: false
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }
                        CustomComboBox {
                            id: mission
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "mission"
                            Layout.preferredWidth: 250
                            Layout.preferredHeight: 30
                            model: ["VIP HELISTANSPORT", "CASIVAC OPS EMERGENCE 2", "CASIVAC OPS EMERGENCE 5", "PILOT TRAINING", "RECURENT PILOT TRAINING", "TACTICAL FLIGHT", "LOGISTIC SUPPORT OPS EME 2", "LOGISTIC SUPPORT OPS EME 5", "IFR TRAINING", "TACTICAL TRAINING", "CROSS COUNTRY NAVIGATION", "MAINTENANCE TEST FLIGHT", "CREW QUALIFICATION", "ADMINISTRATIVE SUPPORT"]
                            //cBColor: backgroundColor
                        }
                    }
                }
                ColumnLayout {
                    Layout.leftMargin: 10
                    spacing: 5
                    //anchors.top: ft.bottom
                    anchors.topMargin: 10
                    Label {
                        text: "ROUTE "
                        font.pixelSize: 11
                        font.weight: Font.Normal
                        style: Text.Sunken
                        font.bold: false
                        font {
                            family: "Courier"
                        }
                    }
                    TextArea {
                        id: route
                        text: ""
                        font.bold: false
                        Layout.leftMargin: 0
                        font.pixelSize: 11
                        textFormat: Text.AutoText
                        placeholderText: "Route ..."
                        font.weight: Font.Black
                        font.wordSpacing: 1.3
                        font.family: "Courier"
                        anchors.rightMargin: 20
                        Layout.fillWidth: true
                        background: Rectangle {
                            //implicitWidth: 200
                            implicitHeight: 40
                            border.color: route.activeFocus ? secondaryDarkColor : secondaryColor2
                        }

                        //anchors.bottom: parent.bottom
                        //Layout.preferredWidth: flightDetail.width - 24
                        //Layout.preferredHeight: 30
                    }
                }
                GroupBox {
                    id: assess
                    //width: parent.width
                    height: 200
                    label: Label {
                        text: assess.title
                        font.pixelSize: 12
                        textFormat: Text.PlainText
                        wrapMode: Text.NoWrap
                        bottomPadding: 0
                        font.weight: Font.Black
                        font.bold: true
                        font.family: "Courier"
                    }
                    Layout.fillWidth: true
                    title: qsTr(" FLIGHT ASSESSMENT")

                    RowLayout {
                        spacing: 195
                        width: parent.width
                        ColumnLayout {
                            spacing: 5
                            Label {
                                text: "FLIGHT SAFETY "
                                font.pixelSize: 11
                                style: Text.Sunken
                                font {
                                    family: "Courier"
                                }
                            }
                            CustomComboBox {
                                id: grade
                                font.pixelSize: 11
                                font.family: "Courier"
                                //anchors.bottom: parent.bottom
                                //textRole: "pilot in command"
                                Layout.preferredWidth: 150
                                Layout.preferredHeight: 30
                                //cBColor: backgroundColor
                                model: ["Poor", "Fair", "Good", "Very Good"]
                            }
                        }
                        ColumnLayout {
                            spacing: 5
                            Layout.fillWidth: true
                            Label {
                                text: "OBSERVATION "
                                font.pixelSize: 11
                                style: Text.Sunken
                                font {
                                    family: "Courier"
                                }
                            }
                            ScrollView {
                                implicitHeight: 60
                                Layout.fillWidth: true
                                clip: true
                                ScrollBar.vertical.policy: ScrollBar.AlwaysOn
                                TextArea {
                                    id: observation
                                    text: ""
                                    font.bold: false
                                    font.pixelSize: 11
                                    textFormat: Text.AutoText
                                    placeholderText: "observation ..."
                                    font.weight: Font.Black
                                    font.wordSpacing: 1.3
                                    font.family: "Courier"
                                    //anchors.rightMargin: 20
                                    //Layout.fillWidth: true
                                    background: Rectangle {
                                        //implicitWidth: 200
                                        //implicitHeight: 60
                                        border.color: route.activeFocus ? secondaryDarkColor : secondaryColor2
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            id: rect3
            anchors.top: flightDetail.bottom
            Layout.fillWidth: true
            Layout.preferredHeight: 2
            anchors.topMargin: 10
            Layout.leftMargin: 15
            Layout.rightMargin: 15
        }
        RowLayout {

            anchors.right: parent.right
            spacing: 5
            anchors.rightMargin: 15
            //anchors.top: rect3.bottom
            anchors.top: rect3.bottom
            anchors.topMargin: 10
            Button {
                id: save
                text: "Save"
                Layout.preferredWidth: 80
                contentItem: Label {
                    text: save.text
                    font.pixelSize: 14

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_save
                    radius: 2
                    color: secondaryColor
                }
            }
            Button {
                id: reset
                text: "Reset"
                Layout.preferredWidth: 80
                contentItem: Label {
                    text: reset.text
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_reset
                    radius: 2
                    color: secondaryColor
                }
            }
            Button {
                id: cancel
                text: "Cancel"
                Layout.preferredWidth: 80
                contentItem: Label {
                    text: cancel.text
                    font.pixelSize: 14
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_cancel
                    radius: 2
                    color: secondaryColor
                }
            }
        }
    }
    Component.onCompleted: pageOnCompleted = true
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:750;width:1350}
}
##^##*/

