import QtQuick 2.12
import QtQuick.Controls 2.12
//import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
//import QtQuick.Dialogs.qml 1.0
import QtCharts 2.3
import QtQuick.Controls.Universal 2.0
//import QtQuick.Dialogs 1.3
import EFS 1.0

Page {
    id: pilot

    title: qsTr("New Pilot")

    //property alias calendar: calendar
    Layout.fillHeight: true
    Layout.fillWidth: true
    Layout.minimumHeight: parent.height
    Layout.minimumWidth: parent.width
    property color primaryColor: "#F1F8E9"
    property color primaryDarkColor: "#558B2F"
    property color buttonPressedColor: "#b5edf9"
    property color secondaryDarkColor: "#21a3b3"
    property color secondaryColor: "#e1f8fd"
    property color secondaryColor2: "#45c2e8"
    property color backgroundColor: "#d9dbdb"
    property alias pilot: pilot
    property alias selectPic: selectPic
    property alias bckg_selectPic: bckg_selectPic
    //property alias fileDialog: fileDialog
    property alias pilot_pic: pilot_pic
    property alias date_cempnExpB: date_cempnExpB
    property alias date_cempn: date_cempn
    property alias date_cempnB: date_cempnB
    property alias date_cempnExp: date_cempnExp
    property alias controlT: controlT
    property alias b_dateB: b_dateB
    property alias bckg_cancel: bckg_cancel
    property alias cancel: cancel
    property alias bckg_reset: bckg_reset
    property alias reset: reset
    property alias bckg_save: bckg_save
    property alias save: save
    property alias rectColor: rectColor
    property alias n_sims: n_sims
    property alias addSS: addSS
    property alias bckg_addSS: bckg_addSS
    property alias listviewL: listviewL
    property alias controlL: controlL
    property alias addL: addL
    property alias label: label
    property alias bckg_addL: bckg_addL
    property alias n_licence: n_licence
    property alias listviewSS: listviewSS
    property alias controlSS: controlSS
    property alias addT: addT
    property alias bckg_addT: bckg_addT
    property alias n_training: n_training
    property alias licenceModel: licenceModel
    property alias pilot_name: pilot_name
    property alias pilot_surname: pilot_surname
    property alias pilot_grade: pilot_grade
    property alias pilot_phone: pilot_phone
    property alias pilot_email: pilot_email
    property alias unit: unit
    property alias speciality: speciality
    property alias b_date: b_date
    property alias trainingModel: trainingModel
    property alias simsessionModel: simsessionModel
    property alias another: another
    property alias listviewT: listviewT

    background: Rectangle {


        /*AnimatedImage {
            speed: 0.05
            fillMode: Image.Tile
            source: "vid11.webp"
            anchors.fill: parent
            cache: true
        }*/
        id: rectColor
    }

    //FileDialog
    /*FileDialog {
        id: fileDialog
        visible: false
        modality: Qt.NonModal
        title: "Choose a file"
        selectExisting: true
        nameFilters: ["Image files (*.png *.jpg *.jpeg)", "All files (*)"]
        selectedNameFilter: "Image files (*.png *.jpg)"
        folder: fileDialog.shortcuts.pictures
    }*/

    PilotSaveBox {
        id: another
        visible: false
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    }

    //title: qsTr("Page 1")
    ColumnLayout {
        id: np
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
            text: "NEW PILOT"
            font.pixelSize: 15
            style: Text.Sunken
            id: new_pilot
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
            anchors.top: new_pilot.bottom
            Layout.fillWidth: true
            Layout.preferredHeight: 2
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.rightMargin: 15
        }
        RowLayout {

            spacing: 25
            anchors.top: rect.bottom
            anchors.topMargin: 5
            Layout.leftMargin: 15
            Layout.rightMargin: 15
            Layout.fillWidth: true
            id: info
            GroupBox {
                id: gen_info

                title: "GENERAL INFORMATION"
                label: Label {

                    textFormat: Text.PlainText
                    font.weight: Font.Black
                    font.bold: true
                    font.family: "Courier"
                    width: gen_info.availableWidth
                    text: gen_info.title
                    font.pixelSize: 12
                }
                GridLayout {
                    columns: 2
                    columnSpacing: 25
                    rowSpacing: 5
                    RowLayout {
                        spacing: 5
                        width: surname.width
                        Label {
                            text: "NAME "
                            font.pixelSize: 11
                            style: Text.Sunken
                            Layout.fillWidth: true
                            font {
                                family: "Courier"
                            }
                        }
                        TextField {
                            id: pilot_name
                            height: 25
                            font.bold: false
                            font.pixelSize: 11
                            font.family: "Courier"
                            font.weight: Font.Normal
                            Layout.preferredHeight: 25
                            Layout.preferredWidth: 250
                            anchors.right: parent.right
                            background: Rectangle {
                                //color: "transparent"
                                border.color: secondaryColor2
                            }
                        }
                    }
                    RowLayout {
                        width: surname.width
                        Label {
                            text: "PHONE "
                            wrapMode: Text.NoWrap
                            font.pixelSize: 11
                            style: Text.Sunken
                            Layout.fillWidth: true
                            font {
                                family: "Courier"
                            }
                        }
                        TextField {
                            id: pilot_phone
                            font.bold: false
                            font.pixelSize: 11
                            font.family: "Courier"
                            font.weight: Font.Normal
                            Layout.preferredHeight: 25
                            Layout.preferredWidth: 250
                            background: Rectangle {
                                //color: "transparent"
                                border.color: secondaryColor2
                            }
                        }
                    }
                    RowLayout {
                        id: surname
                        Label {
                            text: "SURNAME "
                            font.pixelSize: 11
                            style: Text.Sunken
                            Layout.fillWidth: true
                            font {
                                family: "Courier"
                            }
                        }
                        TextField {
                            id: pilot_surname
                            font.bold: false
                            font.pixelSize: 11
                            font.family: "Courier"
                            font.weight: Font.Normal
                            Layout.preferredHeight: 25
                            Layout.preferredWidth: 250
                            background: Rectangle {
                                //color: "transparent"
                                border.color: secondaryColor2
                            }
                        }
                    }
                    RowLayout {
                        Label {
                            text: "EMAIL "
                            font.pixelSize: 11
                            style: Text.Sunken
                            Layout.fillWidth: true
                            font {
                                family: "Courier"
                            }
                        }
                        TextField {
                            id: pilot_email
                            font.bold: false
                            font.pixelSize: 11
                            font.family: "Courier"
                            font.weight: Font.Normal
                            Layout.preferredHeight: 25
                            Layout.preferredWidth: 250
                            background: Rectangle {
                                //color: "transparent"
                                border.color: secondaryColor2
                            }
                        }
                    }
                    RowLayout {
                        Label {
                            text: "GRADE "
                            font.pixelSize: 11
                            style: Text.Sunken
                            Layout.fillWidth: true
                            font {
                                family: "Courier"
                            }
                        }
                        TextField {
                            id: pilot_grade
                            font.bold: false
                            font.pixelSize: 11
                            font.family: "Courier"
                            font.weight: Font.Normal
                            Layout.preferredHeight: 25
                            Layout.preferredWidth: 250
                            background: Rectangle {
                                //color: "transparent"
                                border.color: secondaryColor2
                            }
                        }
                    }
                    RowLayout {
                        Label {
                            text: "BIRTH DATE "
                            font.pixelSize: 11
                            style: Text.Sunken
                            Layout.fillWidth: true
                            font {
                                family: "Courier"
                            }
                        }
                        TextField {
                            id: b_date
                            font.bold: true
                            font.pixelSize: 11
                            font.weight: Font.Normal
                            font.family: "Courier"
                            placeholderText: "DD/MM/YEAR"
                            //Layout.fillHeight: true
                            Layout.preferredHeight: 25
                            Layout.preferredWidth: 215
                            enabled: false
                            background: Rectangle {
                                color: "transparent"
                                border.color: secondaryColor2
                            }
                        }

                        CalendarButton {
                            id: b_dateB
                            height: 25
                        }
                    }
                }
            }
            GroupBox {
                id: pic
                Layout.leftMargin: 15
                //anchors.top: parent.top
                anchors.right: parent.right
                title: "LOAD PICTURE"
                label: Label {

                    textFormat: Text.PlainText
                    font.weight: Font.Black
                    font.bold: true
                    font.family: "Courier"
                    width: pic.availableWidth
                    text: pic.title
                    font.pixelSize: 12
                }

                RowLayout {

                    Button {
                        id: selectPic
                        text: "Select Picture"
                        font.pixelSize: 16
                        font {
                            family: "Courier"
                        }
                        anchors.top: parent.top
                        contentItem: Label {
                            text: selectPic.text
                            font.pixelSize: 11

                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.bold: true
                            font.weight: Font.Black
                            font.family: "Courier"
                        }
                        background: Rectangle {
                            id: bckg_selectPic
                            radius: 2
                            color: secondaryColor
                        }
                    }
                    Image {
                        id: pilot_pic
                        fillMode: Image.PreserveAspectCrop
                        //clip: true
                        sourceSize.height: 70
                        sourceSize.width: 70
                    }
                }
            }
        }

        Rectangle {
            id: rect1
            anchors.top: info.bottom
            Layout.fillWidth: true
            Layout.preferredHeight: 2
            anchors.bottomMargin: 5
            anchors.topMargin: 5
            Layout.leftMargin: 15
            Layout.rightMargin: 15
        }
        GroupBox {
            id: technicalInfo
            height: 410
            //width: parent.width - 15
            anchors.topMargin: 5
            Layout.leftMargin: 15

            anchors.top: rect1.bottom
            Layout.preferredHeight: 410
            Layout.columnSpan: 0
            //anchors.horizontalCenter: parent.horizontalCenter
            //Layout.fillWidth: true
            //height: 400
            label: Label {
                text: technicalInfo.title
                font.pixelSize: 12
                bottomPadding: 2
                font.weight: Font.Black
                textFormat: Text.PlainText
                font.bold: true
                font.family: "Courier"
            }

            title: qsTr("TECHNICAL INFO")
            //anchors.centerIn: parent
            ColumnLayout {
                id: ft
                spacing: 2
                RowLayout {
                    spacing: 150
                    ColumnLayout {
                        spacing: 0
                        Label {
                            text: "UNIT "
                            font.pixelSize: 11
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }
                        CustomComboBox {
                            id: unit
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "flight rule"
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 30
                            //height: 35
                            // cBColor: backgroundColor
                            model: ["51ST FS", "52ND FS", "GMO"]
                        }
                    }
                    ColumnLayout {
                        spacing: 0
                        Label {
                            text: "SPECIALITY "
                            font.pixelSize: 11
                            font.bold: false
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }
                        CustomComboBox {
                            id: speciality
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "mission"
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 30
                            //cBColor: backgroundColor
                            model: ["HELICOPTER", "CARGO", "FIGHTER"]
                        }
                    }
                    ColumnLayout {
                        spacing: 0
                        Label {
                            text: "DATE CEMPN "
                            font.pixelSize: 11
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }

                        RowLayout {
                            TextField {
                                id: date_cempn
                                font.bold: true
                                font.pixelSize: 11
                                font.weight: Font.Normal
                                font.family: "Courier"
                                placeholderText: "DD/MM/YEAR"
                                //Layout.fillHeight: true
                                Layout.preferredHeight: 30
                                Layout.preferredWidth: 150
                                enabled: false
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: secondaryColor2
                                }
                            }

                            CalendarButton {
                                id: date_cempnB
                            }
                        }
                    }
                    ColumnLayout {
                        spacing: 0
                        Label {
                            text: "DATE CEMPN EXPIRATION"
                            font.pixelSize: 11
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }

                        RowLayout {
                            TextField {
                                id: date_cempnExp
                                font.bold: true
                                font.pixelSize: 11
                                font.weight: Font.Normal
                                font.family: "Courier"
                                placeholderText: "DD/MM/YEAR"
                                //Layout.fillHeight: true
                                Layout.preferredHeight: 30
                                Layout.preferredWidth: 150
                                enabled: false
                                background: Rectangle {
                                    color: "transparent"
                                    border.color: secondaryColor2
                                }
                            }

                            CalendarButton {
                                id: date_cempnExpB
                            }
                        }
                    }
                }
                RowLayout {
                    spacing: 2

                    GroupBox {
                        width: col.width
                        id: training
                        anchors.topMargin: 15
                        title: "TRAINING"
                        label: Label {
                            text: training.title
                            font.pixelSize: 12
                            bottomPadding: 2
                            font.weight: Font.Black
                            textFormat: Text.PlainText
                            font.bold: true
                            font.family: "Courier"
                        }
                        ColumnLayout {
                            spacing: 2
                            height: 90
                            width: 620
                            id: col
                            Row {
                                id: columnsHeaderT
                                z: 2
                                Repeater {
                                    model: ["Date", "Title", "Center", "Issuing Authority"]
                                    Label {
                                        width: 145
                                        height: 35
                                        text: modelData
                                        font.bold: true
                                        font.family: "Courier"
                                        color: '#cccccc'
                                        font.pixelSize: 12
                                        padding: 0
                                        verticalAlignment: Text.AlignVCenter

                                        background: Rectangle {
                                            color: "#333333"
                                        }
                                    }
                                }
                            }
                            ListView {
                                id: listviewT
                                clip: true
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom
                                anchors.top: columnsHeaderT.bottom
                                model: TrainingModel {
                                    id: trainingModel
                                    trainingManager: TM
                                }
                                delegate: Row {

                                    Rectangle {
                                        width: 145
                                        height: 25
                                        TextField {
                                            text: model.date
                                            font.pixelSize: 11
                                            font.family: "Courier"
                                            anchors.fill: parent
                                            onEditingFinished: model.date = text
                                        }
                                    }
                                    Rectangle {
                                        width: 145
                                        height: 25
                                        TextField {
                                            text: model.title
                                            font.pixelSize: 11
                                            font.family: "Courier"
                                            anchors.fill: parent
                                            onEditingFinished: model.title = text
                                        }
                                    }
                                    Rectangle {
                                        width: 145
                                        height: 25
                                        TextField {
                                            text: model.center
                                            font.pixelSize: 11
                                            font.family: "Courier"
                                            anchors.fill: parent
                                            onEditingFinished: model.center = text
                                        }
                                    }
                                    Rectangle {
                                        width: 145
                                        height: 25
                                        TextField {
                                            text: model.authority
                                            font.pixelSize: 11
                                            font.family: "Courier"
                                            anchors.fill: parent
                                            onEditingFinished: model.authority = text
                                        }
                                    }

                                    Image {
                                        source: "delete22.png"
                                        anchors.verticalCenter: parent.verticalCenter
                                        MouseArea {
                                            id: delT
                                            anchors.fill: parent
                                        }
                                    }
                                    Connections {
                                        target: delT
                                        onClicked: {
                                            TM.removeItemAt(index)
                                            if (listviewT.count < 3)
                                                controlT.visible = false
                                            else
                                                controlT.visible = true
                                        }
                                    }
                                }
                                ScrollIndicator.vertical: ScrollIndicator {
                                    id: controlT
                                    active: true
                                    orientation: Qt.Vertical
                                    anchors.leftMargin: 5

                                    contentItem: Rectangle {
                                        implicitWidth: 4
                                        implicitHeight: 40
                                        color: secondaryColor2
                                    }
                                }
                            }

                            Button {
                                id: addT
                                text: "Add"
                                font.pixelSize: 12
                                font {
                                    family: "Courier"
                                }
                                contentItem: Label {
                                    text: addT.text
                                    font.pixelSize: 11

                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.bold: true
                                    font.weight: Font.Black
                                    font.family: "Courier"
                                }
                                background: Rectangle {
                                    id: bckg_addT
                                    radius: 2
                                    color: secondaryColor
                                }
                                Training {
                                    id: n_training

                                    x: pilot.width / 2 - 250
                                    y: -250

                                    visible: false
                                    modal: true
                                    focus: true
                                    closePolicy: Popup.CloseOnEscape
                                                 | Popup.CloseOnPressOutsideParent
                                }
                            }
                        }
                    }
                    GroupBox {
                        id: licence
                        width: col.width
                        anchors.topMargin: 25
                        title: "LICENCES"
                        //Layout.fillHeight: true
                        label: Label {
                            text: "LICENCES"
                            font.pixelSize: 12
                            bottomPadding: 2
                            font.weight: Font.Black
                            textFormat: Text.PlainText
                            font.bold: true
                            font.family: "Courier"
                        }
                        ColumnLayout {
                            spacing: 2
                            height: 90
                            width: 620
                            Row {
                                id: columnsHeader
                                z: 2
                                Repeater {
                                    model: ["Date", "Title", "Issuing Authority", "  Licence Number"]
                                    Label {
                                        width: 145
                                        height: 35
                                        text: modelData
                                        //horizontalAlignment: Text.AlignHCenter
                                        font.bold: true
                                        font.family: "Courier"
                                        color: '#aaaaaa'
                                        font.pixelSize: 12
                                        padding: 0
                                        verticalAlignment: Text.AlignVCenter

                                        background: Rectangle {
                                            color: "#333333"
                                        }
                                    }
                                }
                            }
                            ListView {
                                id: listviewL
                                clip: true
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom
                                anchors.top: columnsHeader.bottom
                                model: LicenceModel {
                                    id: licenceModel
                                    licenceManager: LM
                                }
                                delegate: Row {
                                    id: root
                                    Rectangle {
                                        width: 145
                                        height: 25
                                        TextField {
                                            text: model.date
                                            font.pixelSize: 11
                                            font.family: "Courier"
                                            anchors.fill: parent
                                            onEditingFinished: model.date = text
                                        }
                                    }
                                    Rectangle {
                                        width: 145
                                        height: 25
                                        TextField {
                                            text: model.title
                                            font.pixelSize: 11
                                            font.family: "Courier"
                                            anchors.fill: parent
                                            onEditingFinished: model.name = text
                                        }
                                    }
                                    Rectangle {
                                        width: 145
                                        height: 25
                                        TextField {
                                            text: model.authority
                                            font.pixelSize: 11
                                            font.family: "Courier"
                                            anchors.fill: parent
                                            onEditingFinished: model.authority = text
                                        }
                                    }
                                    Rectangle {
                                        width: 145
                                        height: 25
                                        TextField {
                                            text: model.number
                                            font.pixelSize: 11
                                            font.family: "Courier"
                                            anchors.fill: parent
                                            onEditingFinished: model.rating = text
                                        }
                                    }
                                    Image {
                                        source: "delete22.png"
                                        anchors.verticalCenter: parent.verticalCenter
                                        MouseArea {
                                            id: delL
                                            anchors.fill: parent
                                        }
                                    }
                                    Connections {
                                        target: delL
                                        onClicked: {
                                            LM.removeItemAt(index)
                                            if (listviewL.count < 3)
                                                controlL.visible = false
                                            else
                                                controlL.visible = true
                                        }
                                    }
                                }
                                ScrollIndicator.vertical: ScrollIndicator {
                                    id: controlL
                                    active: true
                                    orientation: Qt.Vertical
                                    anchors.leftMargin: 5
                                    contentItem: Rectangle {
                                        implicitWidth: 4
                                        implicitHeight: 40
                                        color: secondaryColor2
                                    }
                                }
                            }

                            Button {
                                id: addL
                                text: "Add"
                                font.pixelSize: 12
                                font {
                                    family: "Courier"
                                }
                                contentItem: Label {
                                    id: label
                                    text: addL.text
                                    font.pixelSize: 11

                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.bold: true
                                    font.weight: Font.Black
                                    font.family: "Courier"
                                }
                                background: Rectangle {
                                    id: bckg_addL
                                    radius: 2
                                    color: secondaryColor
                                }
                                Licence {
                                    id: n_licence

                                    x: pilot.width / 2 - 900
                                    y: pilot.height / 2 - 550

                                    visible: false
                                    modal: true
                                    focus: true
                                    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
                                }
                            }
                        }
                    }
                }
                GroupBox {
                    id: simsession
                    height: 70
                    anchors.topMargin: 15
                    title: "SIMULATOR SESSION"
                    label: Label {
                        text: simsession.title
                        font.pixelSize: 12
                        bottomPadding: 2
                        font.weight: Font.Black
                        textFormat: Text.PlainText
                        font.bold: true
                        font.family: "Courier"
                    }
                    ColumnLayout {
                        spacing: 2
                        height: 70
                        width: 620
                        Row {
                            id: columnsHeaderSS
                            z: 2
                            Repeater {
                                model: ["Date", "Center", "Aircraft", "Sim Type"]
                                Label {
                                    width: 145
                                    height: 35
                                    text: modelData
                                    font.bold: true
                                    font.family: "Courier"
                                    color: '#cccccc'
                                    font.pixelSize: 12
                                    padding: 5
                                    verticalAlignment: Text.AlignVCenter

                                    background: Rectangle {
                                        color: "#333333"
                                    }
                                }
                            }
                        }
                        ListView {
                            id: listviewSS
                            clip: true
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            anchors.top: columnsHeaderSS.bottom
                            model: SimSessionModel {
                                id: simsessionModel
                                simSManager: SSM
                            }
                            delegate: Row {

                                Rectangle {
                                    width: 145
                                    height: 25
                                    TextField {
                                        text: model.date
                                        font.pixelSize: 11
                                        font.family: "Courier"
                                        anchors.fill: parent
                                        onEditingFinished: model.date = text
                                    }
                                }
                                Rectangle {
                                    width: 145
                                    height: 25
                                    TextField {
                                        text: model.tCenter
                                        font.pixelSize: 11
                                        font.family: "Courier"
                                        anchors.fill: parent
                                        onEditingFinished: model.tCenter = text
                                    }
                                }
                                Rectangle {
                                    width: 145
                                    height: 25
                                    TextField {
                                        text: model.acftType
                                        font.pixelSize: 11
                                        font.family: "Courier"
                                        anchors.fill: parent
                                        onEditingFinished: model.acftType = text
                                    }
                                }
                                Rectangle {
                                    width: 145
                                    height: 25
                                    TextField {
                                        text: model.simType
                                        font.pixelSize: 11
                                        font.family: "Courier"
                                        anchors.fill: parent
                                        onEditingFinished: model.simType = text
                                    }
                                }

                                Image {
                                    source: "delete22.png"
                                    anchors.verticalCenter: parent.verticalCenter
                                    MouseArea {
                                        id: delSS
                                        anchors.fill: parent
                                    }
                                }
                                Connections {
                                    target: delSS
                                    onClicked: {
                                        SSM.removeItemAt(index)
                                        if (listviewSS.count < 2)
                                            controlSS.visible = false
                                        else
                                            controlSS.visible = true
                                    }
                                }
                            }
                            ScrollIndicator.vertical: ScrollIndicator {
                                id: controlSS
                                active: true
                                orientation: Qt.Vertical
                                anchors.leftMargin: 5

                                contentItem: Rectangle {
                                    implicitWidth: 4
                                    implicitHeight: 40
                                    color: secondaryColor2
                                }
                            }
                        }

                        Button {
                            id: addSS
                            text: "Add"
                            font.pixelSize: 12
                            font {
                                family: "Courier"
                            }
                            contentItem: Label {
                                text: addSS.text
                                font.pixelSize: 13

                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                font.bold: true
                                font.weight: Font.Black
                                font.family: "Courier"
                            }
                            background: Rectangle {
                                id: bckg_addSS
                                radius: 2
                                color: secondaryColor
                            }
                            SimSession {
                                id: n_sims

                                x: pilot.width / 2 - 250
                                y: pilot.height / 2 - 700

                                visible: false
                                modal: true
                                focus: true
                                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            id: rect3
            anchors.top: technicalInfo.bottom
            Layout.fillWidth: true
            Layout.preferredHeight: 2
            anchors.topMargin: 5
            Layout.leftMargin: 15
            Layout.rightMargin: 15
        }
        RowLayout {

            anchors.right: parent.right
            spacing: 5
            anchors.rightMargin: 15
            //anchors.top: rect3.bottom
            anchors.top: rect3.bottom
            anchors.topMargin: 5
            Button {
                id: save
                text: "Save"
                Layout.preferredWidth: 80
                //Layout.fillWidth: true
                contentItem: Label {
                    text: save.text
                    font.pixelSize: 12

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
                    font.pixelSize: 12
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
                    font.pixelSize: 12
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

    CalendarButton {
        id: calendarButton
        x: -76
        y: 149
    }
    //Component.onComplete:
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:750;width:1350}
}
##^##*/

