import QtQuick 2.14
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13

Rectangle {
    color: backgroundColor
    property alias tft: tft
    property alias ift: ift
    property alias picft: picft
    property alias date_cempnExp: date_cempnExp
    property alias date_cempn: date_cempn
    property alias speciality: speciality
    property alias unit: unit
    property alias b_date: b_date
    property alias cpicft: cpicft
    property alias vft: vft
    property alias pilot_email: pilot_email
    property alias pilot_phone: pilot_phone
    property alias pilot_grade: pilot_grade
    property alias pilot_surname: pilot_surname
    property alias pilot_name: pilot_name
    property alias edit_G_info: edit_G_info
    GeneralInfoEdit{
        id: edit_G_info
        //x: pilot.width / 2 - 250
        //y: pilot.height / 2 - 800

        visible: false
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape|
                     Popup.CloseOnPressOutside


    }

    RowLayout {
        id: genTech
        anchors.fill: parent
        anchors.margins: 15
        anchors.top: parent.top
        //anchors.horizontalCenter: parent.horizontalCenter
        //anchors.centerIn: parent
        ColumnLayout{
            spacing: 30
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
                    rowSpacing: 10
                    RowLayout {
                        spacing: 5
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
                            font.bold: true
                            font.weight: Font.ExtraBold
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "pilot in command"
                            Layout.preferredWidth: 200
                            Layout.preferredHeight: 30
                            enabled: false
                            background: Rectangle{
                                border.width: 2
                                border.color: backgroundColor
                                color: "#ffffff"

                            }
                        }
                    }
                    RowLayout {
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
                            font.bold: true
                            font.weight: Font.ExtraBold
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "pilot in command"
                            Layout.preferredWidth: 200
                            Layout.preferredHeight: 30
                            enabled: false
                            background: Rectangle{
                                border.width: 2
                                border.color: backgroundColor
                                color: "#ffffff"

                            }
                        }
                    }
                    RowLayout {
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
                            font.bold: true
                            font.weight: Font.ExtraBold
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "pilot in command"
                            Layout.preferredWidth: 200
                            Layout.preferredHeight: 30
                            enabled: false
                            background: Rectangle{
                                border.width: 2
                                border.color: backgroundColor
                                color: "#ffffff"

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
                            font.bold: true
                            font.weight: Font.ExtraBold
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "pilot in command"
                            Layout.preferredWidth: 200
                            Layout.preferredHeight: 30
                            enabled: false
                            background: Rectangle{
                                border.width: 2
                                border.color: backgroundColor
                                color: "#ffffff"

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
                            font.bold: true
                            font.weight: Font.ExtraBold
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "pilot in command"
                            Layout.preferredWidth: 200
                            Layout.preferredHeight: 30
                            enabled: false
                            background: Rectangle{
                                border.width: 2
                                border.color: backgroundColor
                                color: "#ffffff"

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
                            font.weight: Font.ExtraBold
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "pilot in command"
                            Layout.preferredWidth: 200
                            Layout.preferredHeight: 30
                            enabled: false
                            background: Rectangle{
                                border.width: 2
                                border.color: backgroundColor
                                color: "#ffffff"

                            }
                        }
                    }
                }
            }
            GroupBox {
                id: technicalInfo
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
                    spacing: 15
                    RowLayout {
                        spacing: 196
                        ColumnLayout {
                            spacing: 5
                            Label {
                                text: "UNIT "
                                font.pixelSize: 11
                                style: Text.Sunken
                                font {
                                    family: "Courier"
                                }
                            }
                            TextField {
                                id: unit
                                font.bold: true
                                font.weight: Font.ExtraBold
                                font.pixelSize: 11
                                font.family: "Courier"
                                //anchors.bottom: parent.bottom
                                //textRole: "pilot in command"
                                Layout.preferredWidth: 200
                                Layout.preferredHeight: 30
                                enabled: false
                                background: Rectangle{
                                    border.width: 2
                                    border.color: backgroundColor
                                    color: "#ffffff"

                                }
                            }
                        }
                        ColumnLayout {
                            spacing: 5
                            Label {
                                text: "SPECIALITY "
                                font.pixelSize: 11
                                font.bold: false
                                style: Text.Sunken
                                font {
                                    family: "Courier"
                                }
                            }
                            TextField {
                                id: speciality
                                font.bold: true
                                font.weight: Font.ExtraBold
                                font.pixelSize: 11
                                font.family: "Courier"
                                //anchors.bottom: parent.bottom
                                //textRole: "pilot in command"
                                Layout.preferredWidth: 200
                                Layout.preferredHeight: 30
                                enabled: false
                                background: Rectangle{
                                    border.width: 2
                                    border.color: backgroundColor
                                    color: "#ffffff"

                                }
                            }
                        }
                    }
                    RowLayout{
                        spacing: 196
                        ColumnLayout {
                            spacing: 2
                            Label {
                                text: "DATE CEMPN "
                                font.pixelSize: 11
                                style: Text.Sunken
                                font {
                                    family: "Courier"
                                }
                            }
                            TextField {
                                id: date_cempn
                                font.bold: true
                                font.weight: Font.ExtraBold
                                font.pixelSize: 11
                                font.family: "Courier"
                                //anchors.bottom: parent.bottom
                                //textRole: "pilot in command"
                                Layout.preferredWidth: 200
                                Layout.preferredHeight: 30
                                enabled: false
                                background: Rectangle{
                                    border.width: 2
                                    border.color: backgroundColor
                                    color: "#ffffff"

                                }
                            }
                        }
                        ColumnLayout {
                            spacing: 2
                            Label {
                                text: "DATE CEMPN EXPIRATION"
                                font.pixelSize: 11
                                style: Text.Sunken
                                font {
                                    family: "Courier"
                                }
                            }
                            TextField {
                                id: date_cempnExp
                                font.bold: true
                                font.weight: Font.ExtraBold
                                font.pixelSize: 11
                                font.family: "Courier"
                                //anchors.bottom: parent.bottom
                                //textRole: "pilot in command"
                                Layout.preferredWidth: 200
                                Layout.preferredHeight: 30
                                enabled: false
                                background: Rectangle{
                                    border.width: 2
                                    border.color: backgroundColor
                                    color: "#ffffff"

                                }
                            }
                        }
                    }
                }
            }
        }
        GroupBox {
            id: flyingTime
            Layout.alignment: Qt.AlignTop
            label: Label {
                text: flyingTime.title
                font.pixelSize: 12
                bottomPadding: 2
                font.weight: Font.Black
                textFormat: Text.PlainText
                font.bold: true
                font.family: "Courier"
            }

            title: qsTr("TOTAL FLYING TIME")
            //anchors.centerIn: parent
            ColumnLayout {
                id: ft
                spacing: 10
                GridLayout {
                    rowSpacing: 10
                    columnSpacing: 25
                    columns: 2
                    RowLayout {
                        spacing: 5
                        Label {
                            text: "IFR FLIGHT"
                            font.pixelSize: 11
                            Layout.fillWidth: true
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }
                        TextField {
                            id: ift
                            font.bold: true
                            font.weight: Font.ExtraBold
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "pilot in command"
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 30
                            enabled: false
                            background: Rectangle{
                                border.width: 2
                                border.color: backgroundColor
                                color: "#ffffff"

                            }
                        }
                    }
                    RowLayout {
                        spacing: 5
                        Label {
                            text: "VFR FLIGHT"
                            font.pixelSize: 11
                            font.bold: false
                            Layout.fillWidth: true
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }
                        TextField {
                            id: vft
                            font.bold: true
                            font.weight: Font.ExtraBold
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "pilot in command"
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 30
                            enabled: false
                            background: Rectangle{
                                border.width: 2
                                border.color: backgroundColor
                                color: "#ffffff"

                            }
                        }
                    }
                    RowLayout {
                        spacing: 5
                        Label {
                            text: "PIC POSITION"
                            font.pixelSize: 11
                            Layout.fillWidth: true
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }
                        TextField {
                            id: picft
                            font.bold: true
                            font.weight: Font.ExtraBold
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "pilot in command"
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 30
                            enabled: false
                            background: Rectangle{
                                border.width: 2
                                border.color: backgroundColor
                                color: "#ffffff"

                            }
                        }
                    }
                    RowLayout {
                        spacing: 5
                        Label {
                            text: "COPILOT POSITION"
                            font.pixelSize: 11
                            Layout.fillWidth: true
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }
                        TextField {
                            id: cpicft
                            font.bold: true
                            font.weight: Font.ExtraBold
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "pilot in command"
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 30
                            enabled: false
                            background: Rectangle{
                                border.width: 2
                                border.color: backgroundColor
                                color: "#ffffff"

                            }
                        }
                    }
                }
                RowLayout {
                    Layout.alignment: Qt.AlignRight
                    spacing: 5
                    Label {
                        text: "TOTAL FLYING TIME"
                        font.pixelSize: 11
                        style: Text.Sunken
                        font {
                            family: "Courier"
                        }
                    }

                    RowLayout {
                        TextField {
                            id: tft
                            font.bold: true
                            font.weight: Font.ExtraBold
                            font.pixelSize: 11
                            font.family: "Courier"
                            //anchors.bottom: parent.bottom
                            //textRole: "pilot in command"
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 30
                            enabled: false
                            background: Rectangle{
                                border.width: 2
                                border.color: backgroundColor
                                color: "#ffffff"

                            }
                        }
                    }
                }
            }
        }
        Image {

            //anchors.top: parent.top
            //anchors.right: parent.right
            id: edit
            Layout.alignment: Qt.AlignRight | Qt.AlignTop
            source: "pencil.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    edit_G_info.open()
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
