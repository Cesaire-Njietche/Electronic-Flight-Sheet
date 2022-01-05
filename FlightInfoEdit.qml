import QtQuick 2.0
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

Popup {
    width: 450
    height: 320
    property alias aircraft_id: aircraft_id
    property alias aircraft_type: aircraft_type
    property alias firstOff: firstOff
    property alias pic: pic
    property alias cancelFI: cancelFI
    property alias setFI: setFI
    property alias fi_edit: fi_edit
    id: fi_edit
    property color backgroundColor: "#d9dbdb"
    background: Rectangle {
        color: backgroundColor
        radius: 4
    }
    ColumnLayout{
        spacing: 15
        anchors.fill: parent
        anchors.margins: 5
        Label{
            text: qsTr("EDIT FLIGHT ") //Can add a unique Ref to this flight
            font.weight: Font.ExtraBold
            font.bold: true
            font.pixelSize: 12
            font.family: "Courier"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top

        }
        GroupBox {
            id: aircraft
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
                spacing: 100
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
                    CustomComboBox {
                        id: aircraft_id
                        font.pixelSize: 11
                        font.family: "Courier"
                        //anchors.bottom: parent.bottom
                        //textRole: "aircraft id"
                        Layout.preferredWidth: 150
                        Layout.preferredHeight: 30
                        //cBColor: backgroundColor
                    }
                }
                ColumnLayout {
                    spacing: 5
                    Label {
                        text: "TYPE "
                        font.pixelSize: 11
                        style: Text.Sunken
                        font {
                            family: "Courier"
                        }
                    }
                    CustomComboBox {
                        id: aircraft_type
                        font.pixelSize: 11
                        //anchors.bottom: parent.bottom
                        //textRole: "aircraft id"
                        Layout.preferredWidth: 150
                        Layout.preferredHeight: 30
                        //cBColor: backgroundColor
                    }
                }
            }
        }
        GroupBox {
            id: crew
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
                spacing: 100
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
                    CustomComboBox {
                        id: pic
                        font.pixelSize: 11
                        font.family: "Courier"
                        //anchors.bottom: parent.bottom
                        //textRole: "pilot in command"
                        Layout.preferredWidth: 150
                        Layout.preferredHeight: 30
                        //cBColor: backgroundColor
                    }
                }
                ColumnLayout {
                    spacing: 5
                    Label {
                        text: "CO-PILOT"
                        font.pixelSize: 11
                        style: Text.Sunken
                        font {
                            family: "Courier"
                        }
                    }
                    CustomComboBox {
                        id: firstOff
                        font.pixelSize: 11
                        font.family: "Courier"
                        //anchors.bottom: parent.bottom
                        //textRole: "aircraft id"
                        Layout.preferredWidth: 150
                        Layout.preferredHeight: 30
                        //cBColor: backgroundColor
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


