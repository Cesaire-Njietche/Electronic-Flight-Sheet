import QtQuick 2.14
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13

Rectangle {
    color: backgroundColor
    property alias edit_F_info: edit_F_info
    property alias firstOff: firstOff
    property alias pic: pic
    property alias aircraft_type: aircraft_type
    property alias aircraft_id: aircraft_id
    FlightInfoEdit{
        id: edit_F_info
        //x: pilot.width / 2 - 250
        //y: pilot.height / 2 - 800

        visible: false
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape|
                     Popup.CloseOnPressOutside


    }

    RowLayout {
        id: acftCrew
        anchors.fill: parent
        anchors.margins: 15

        //anchors.horizontalCenter: parent.horizontalCenter
        //anchors.centerIn: parent
        ColumnLayout{
            anchors.top: parent.top
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
                    spacing: 195
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
                        TextField {
                            id: aircraft_id
                            font.bold: true
                            font.weight: Font.ExtraBold
                            font.pixelSize: 11
                            font.family: "Courier"
                            enabled: false
                            //anchors.bottom: parent.bottom
                            //textRole: "aircraft id"
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 30
                            background: Rectangle{
                                border.width: 2
                                border.color: backgroundColor
                                color: "#ffffff"

                            }


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
                        TextField {
                            id: aircraft_type
                            font.weight: Font.ExtraBold
                            font.bold: true
                            font.pixelSize: 11
                            font.family: "Courier"
                            enabled: false
                            //anchors.bottom: parent.bottom
                            //textRole: "aircraft id"
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 30
                            background: Rectangle{
                                border.width: 2
                                border.color: backgroundColor
                                color: "#ffffff"

                            }
                            //cBColor: backgroundColor
                        }
                    }
                }
            }
            GroupBox {
                id: crew
                anchors.topMargin: 15
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
                    spacing: 195
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
                        TextField {
                            id: pic
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
                        TextField {
                            id: firstOff
                            font.bold: true
                            font.weight: Font.ExtraBold
                            font.pixelSize: 11
                            font.family: "Courier"
                            enabled: false
                            background: Rectangle{
                                border.width: 2
                                border.color: backgroundColor
                                color: "#ffffff"

                            }
                            //anchors.bottom: parent.bottom
                            //textRole: "aircraft id"
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 30
                            //cBColor: backgroundColor
                        }
                    }
                }
            }
        }
        Image {
            anchors.top: parent.top
            anchors.right: parent.right
            id: edit
            source: "pencil.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    edit_F_info.open()
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
