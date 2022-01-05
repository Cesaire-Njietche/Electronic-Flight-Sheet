import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.3

import EFS 1.0

Page {
    id: flight_sheet
    title: qsTr("Flight Sheet")

    //property alias calendar: calendar
    Layout.fillHeight: true
    Layout.fillWidth: true
    Layout.minimumHeight: parent.height
    Layout.minimumWidth: parent.width
    property color primaryColor: "#F1F8E9"
    property color primaryDarkColor: "#558B2F"
    property color buttonPressedColor: "#b5edf9"
    property color secondaryDarkColor: "#21a3b3"
    property color secondaryDarkColor2: "#009bd7"
    property color secondaryColor: "#e1f8fd"
    //property color secondaryColor: "#aee1f5"
    property color secondaryColor2: "#45c2e8"
    property color backgroundColor: "#d9dbdb"
    property alias flight_sheet: flight_sheet

    property alias table: table
    property alias start_date: start_date
    property alias start_dateB: start_dateB
    property alias end_date: end_date
    property alias end_dateB: end_dateB
    property alias role: role
    property alias canvas: canvas
    property alias pilot: pilot
    property alias totalFT: totalFT
    property alias control: control
    property alias filSearch: filSearch
    property alias prtClick: prtClick
    property alias dwlClick: dwlClick
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
            layer.textureSize.width: 1
            color: backgroundColor
            border.color: secondaryColor
        }
        RowLayout {
            id: display
            anchors.top: parent.top
            Layout.minimumWidth: parent.width
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Label {
                text: "FLIGHT SHEET"
                font.pixelSize: 15
                style: Text.Sunken
                wrapMode: Text.WordWrap
                font {
                    weight: Font.ExtraBold
                    capitalization: Font.AllUppercase
                    family: "Courier"
                }
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Image {
                id: dwl
                source: "download.png"
                anchors.right: prt.left
                anchors.rightMargin: 20
                MouseArea{
                    id: dwlClick
                    anchors.fill: parent
                }
            }
            Image {
                id: prt
                source: "print.png"
                anchors.right: parent.right
                anchors.rightMargin: 30
                MouseArea{
                    id: prtClick
                    anchors.fill: parent
                }
            }
        }
        Rectangle {
            id: rect
            anchors.top: display.bottom
            Layout.fillWidth: true
            Layout.preferredHeight: 2
            anchors.topMargin: 5
            Layout.leftMargin: 15
            Layout.rightMargin: 15
        }
        RowLayout {
            id: noFilter
            spacing: 0
            Layout.leftMargin: 15
            anchors.top: rect.bottom
            Label {
                text: "Filter ?"
                font.weight: Font.Bold
                font.pixelSize: 12
                Layout.rightMargin: 10
                anchors.verticalCenter: parent.horizontalCenter
                font {
                    family: "Courier"
                }
            }
            Label {
                text: "No"
                font.weight: Font.Bold
                font.pixelSize: 11
                anchors.verticalCenter: parent.horizontalCenter
                font {
                    family: "Courier"
                }
            }
            Switch {
                id: control
                leftPadding: 3
                rightPadding: 0
                //width: 60
                indicator: Rectangle {
                    implicitWidth: 48
                    implicitHeight: 26
                    x: control.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 13
                    color: control.checked ? secondaryColor : "#ffffff"
                    border.color: control.checked ? secondaryColor : "#cccccc"

                    Rectangle {
                        x: control.checked ? parent.width - width : 0
                        width: 26
                        height: 26
                        radius: 13
                        color: control.down ? "#cccccc" : "#ffffff"
                        border.color: control.checked ? (control.down ? "#17a81a" : "#21be2b") : "#999999"
                    }
                }

                contentItem: Text {
                    text: control.text
                    font: control.font
                    opacity: enabled ? 1.0 : 0.3
                    color: control.down ? "#17a81a" : "#21be2b"
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: control.indicator.width + control.spacing
                }
            }
            Label {
                text: "Yes"
                font.weight: Font.Bold
                font.pixelSize: 11
                //anchors.horizontalCenter: parent.horizontalCenter
                font {
                    family: "Courier"
                }
            }
        }

        RowLayout {
            id: filSearch
            anchors.top: noFilter.bottom
            Layout.fillWidth: true
            Layout.leftMargin: 15
            anchors.topMargin: 10
            enabled: false

            Label {
                anchors.top: parent.top
                id: filterby
                text: "Filter By: "
                font.weight: Font.Bold
                font.pixelSize: 12
                font {
                    family: "Courier"
                }
            }
            ColumnLayout {
                anchors.left: filterby.right
                spacing: 2
                anchors.leftMargin: 100


                /*Rectangle {
                    anchors.fill: parent
                    radius: 4
                }*/
                RowLayout {

                    Label {
                        text: qsTr("Name")
                        font.weight: Font.DemiBold
                        font.pixelSize: 11
                        font.family: "Courier"
                        Layout.rightMargin: 15
                    }
                    ComboBox {
                        id: pilot
                        font.pixelSize: 11
                        font.family: "Courier"
                        //anchors.bottom: parent.bottom
                        //textRole: "pilot in command"
                        Layout.preferredWidth: 175
                        Layout.preferredHeight: 30
                        //cBColor: backgroundColor
                        delegate: ItemDelegate {
                            width: pilot.width
                            contentItem: Text {
                                text: model.name + " " + model.surname
                                font.pixelSize: 11
                                font.family: "Courier"
                                elide: Text.ElideRight
                                verticalAlignment: Text.AlignVCenter
                            }
                            highlighted: pilot.highlightedIndex === index
                        }
                        indicator: Canvas {
                            id: canvas
                            x: pilot.width - width - pilot.rightPadding
                            y: pilot.topPadding + (pilot.availableHeight - height) / 2
                            width: 12
                            height: 8
                            contextType: "2d"
                        }

                        contentItem: Text {
                            leftPadding: 0
                            rightPadding: pilot.indicator.width + pilot.spacing

                            text: pilot.displayText
                            font: pilot.font
                            //color: control.pressed ? "#17a81a" : "#21be2b"
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                            horizontalAlignment: Text.AlignHCenter
                        }

                        background: Rectangle {
                            border.color: pilot.pressed ? secondaryDarkColor2 : secondaryColor2
                            border.width: pilot.visualFocus ? 2 : 1
                            radius: 2
                        }
                        textRole: "name"
                        model: PilotModel
                    }
                }
                RowLayout {

                    Label {
                        text: qsTr("Role")
                        font.weight: Font.Bold
                        font.pixelSize: 11
                        font.family: "Courier"
                        Layout.rightMargin: 16
                    }
                    CustomComboBox {
                        id: role
                        font.pixelSize: 11
                        model: ["All", "Pilot", "Co-Pilot"]
                        //textRole: "mission"
                        Layout.preferredWidth: 175
                        Layout.preferredHeight: 30
                        font {
                            family: "Courier"
                        }
                    }
                }
                GroupBox {
                    id: dateRange
                    //width: parent.width
                    //height: 150
                    label: Label {
                        text: dateRange.title
                        font.pixelSize: 11
                        textFormat: Text.PlainText
                        wrapMode: Text.NoWrap
                        bottomPadding: 0
                        font.weight: Font.DemiBold
                        font.bold: true
                        font.family: "Courier"
                    }

                    title: qsTr("Date")

                    RowLayout {
                        spacing: 30
                        RowLayout {
                            spacing: 5
                            Label {
                                text: "Start Date "
                                font.bold: false
                                font.weight: Font.DemiBold
                                font.pixelSize: 11
                                style: Text.Sunken
                                font {
                                    family: "Courier"
                                }
                            }
                            RowLayout {
                                TextField {
                                    id: start_date
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
                                    id: start_dateB
                                }
                            }
                        }
                        RowLayout {
                            spacing: 5
                            Label {
                                text: "End Date"
                                font.bold: false
                                font.weight: Font.DemiBold
                                font.pixelSize: 11
                                style: Text.Sunken
                                font {
                                    family: "Courier"
                                }
                            }
                            RowLayout {
                                TextField {
                                    id: end_date
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
                                    id: end_dateB
                                }
                            }
                        }
                    }
                }
            }
        }

        TableFlightSheet {
            id: table
            Layout.leftMargin: 15
            anchors.topMargin: 20
            anchors.top: filSearch.bottom
            //anchors.bottom: rect1.top
            height: 300
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            width: 1200
            //Layout.fillWidth: true
            Layout.rightMargin: 15
            listviewFS.model: FlightModel
        }

        RowLayout {
            anchors.top: table.bottom
            anchors.right: table.right
            anchors.topMargin: 20
            //width: 150
            height: 30

            Rectangle {
                anchors.fill: parent
                radius: 4
                color: secondaryColor
            }
            Label {
                text: qsTr("Total Flight Time :")
                font.weight: Font.Black
                font.bold: true
                font.pixelSize: 12
                font.family: "Courier"
                Layout.leftMargin: 5
            }
            Label {
                id: totalFT
                text: qsTr("0")
                font.bold: true
                font.pixelSize: 11
                Layout.rightMargin: 5
            }
        }

        Rectangle {
            id: rect1
            Layout.fillWidth: true
            Layout.preferredHeight: 2
            Layout.leftMargin: 15
            Layout.rightMargin: 15
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
        }
    }
    //Component.onComplete:
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:750;width:1350}
}
##^##*/

