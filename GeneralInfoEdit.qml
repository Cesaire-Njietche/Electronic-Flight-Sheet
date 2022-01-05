import QtQuick 2.0
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

Popup {
    width: 700
    height: 370
    property alias label1: label1
    property alias label: label
    property alias date_cempnExpB: date_cempnExpB
    property alias date_cempnExp: date_cempnExp
    property alias date_cempnB: date_cempnB
    property alias date_cempn: date_cempn
    property alias speciality: speciality
    property alias unit: unit
    property alias b_dateB: b_dateB
    property alias b_date: b_date
    property alias pilot_email: pilot_email
    property alias pilot_phone: pilot_phone
    property alias pilot_grade: pilot_grade
    property alias pilot_surname: pilot_surname
    property alias pilot_name: pilot_name

    id: fi_edit
    property color backgroundColor: "#d9dbdb"
    background: Rectangle {
        color: backgroundColor
        radius: 4
    }
    ColumnLayout{
        spacing: 10
        anchors.fill: parent
        anchors.margins: 5
        Label{
            text: qsTr("EDIT PILOT INFORMATION ") //Can add a unique Ref to this flight
            font.weight: Font.ExtraBold
            font.bold: true
            font.pixelSize: 12
            font.family: "Courier"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top

        }
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
                columnSpacing: 62
                rowSpacing: 10
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
                        font.bold: true
                        font.pixelSize: 11
                        font.family: "Courier"
                        font.weight: Font.Normal
                        Layout.preferredHeight: 30
                        Layout.preferredWidth: 200
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
                        font.bold: true
                        font.pixelSize: 11
                        font.family: "Courier"
                        font.weight: Font.Normal
                        Layout.preferredHeight: 30
                        Layout.preferredWidth: 200
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
                        font.bold: true
                        font.pixelSize: 11
                        font.family: "Courier"
                        font.weight: Font.Normal
                        Layout.preferredHeight: 30
                        Layout.preferredWidth: 200
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
                        font.bold: true
                        font.pixelSize: 11
                        font.family: "Courier"
                        font.weight: Font.Normal
                        Layout.preferredHeight: 30
                        Layout.preferredWidth: 200
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
                        font.bold: true
                        font.pixelSize: 11
                        font.family: "Courier"
                        font.weight: Font.Normal
                        Layout.preferredHeight: 30
                        Layout.preferredWidth: 200
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
                        Layout.preferredHeight: 30
                        Layout.preferredWidth: 165
                        enabled: false
                        background: Rectangle {
                            color: "transparent"
                            border.color: secondaryColor2
                        }
                    }

                    CalendarButton {
                        id: b_dateB
                    }
                }
            }
        }
        GroupBox {
            id: technicalInfo
            label: Label {
                text: technicalInfo.title
                font.pixelSize: 12
                textFormat: Text.PlainText
                wrapMode: Text.NoWrap
                bottomPadding: 0
                font.weight: Font.Black
                font.bold: true
                font.family: "Courier"
            }

            title: qsTr("TECHNICAL INFORMATION")
            RowLayout {
                spacing: 16
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
                    CustomComboBox {
                        id: unit
                        font.pixelSize: 11
                        font.family: "Courier"
                        //anchors.bottom: parent.bottom
                        //textRole: "flight rule"
                        Layout.preferredWidth: 125
                        Layout.preferredHeight: 30
                        //height: 35
                        // cBColor: backgroundColor
                        model: ["51ST FS", "52ND FS", "GMO"]
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
                    CustomComboBox {
                        id: speciality
                        font.pixelSize: 11
                        font.family: "Courier"
                        //anchors.bottom: parent.bottom
                        //textRole: "mission"
                        Layout.preferredWidth: 125
                        Layout.preferredHeight: 30
                        //cBColor: backgroundColor
                        model: ["CARGO", "FIGHTER", "HELICOPTER"]
                    }
                }
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
                            Layout.preferredWidth: 125
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
                    spacing: 2
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
                            Layout.preferredWidth: 125
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
        }
        RowLayout {
            spacing: 20
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            Button {
                id: setFI
                Layout.preferredWidth: 80
                text: qsTr("Set")
                contentItem: Label {
                    id: label
                    text: setFI.text
                    font.pixelSize: 11
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_setFI
                    radius: 2
                    color: secondaryColor
                }
                /*onClicked: {
                    getDate(selectedDate)
                    datePickerRoot.close()
                }*/

                onPressed: {
                    bckg_setFI.color = buttonPressedColor
                }
                onReleased: {
                    bckg_setFI.color = secondaryColor
                }

            } // cancel button
            Button {
                Layout.preferredWidth: 80
                text: qsTr("Cancel")
                id: cancelFI
                contentItem: Label {
                    id: label1
                    text: cancelFI.text
                    font.pixelSize: 11
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_cancelFI
                    radius: 2
                    color: secondaryColor
                }
                onClicked: {
                    fi_edit.close()
                }
                onPressed: {
                    bckg_cancelFI.color = buttonPressedColor
                }
                onReleased: {
                    bckg_cancelFI.color = secondaryColor
                }
            } // cancel button
        }
    }

}




