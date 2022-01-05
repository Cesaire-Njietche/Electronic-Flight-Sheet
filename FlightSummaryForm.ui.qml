import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.3

import EFS 1.0

Page {
    id: flight_summary

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
    property color secondaryColor: "#e1f8fd"
    property color secondaryColor2: "#45c2e8"
    property color backgroundColor: "#d9dbdb"
    property alias table: table
    property alias flight_summary: flight_summary
    property alias fiTab: fiTab
    property alias fdTab: fdTab
    property alias faTab: faTab
    property alias dwlClick: dwlClick
    property alias prtClick: prtClick
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
                text: "FLIGHT SUMMARY"
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
            id: filSearch
            anchors.top: rect.bottom
            Layout.fillWidth: true
            Layout.leftMargin: 15
            anchors.topMargin: 10
            Label {
                text: "Filter By "
                font.weight: Font.Black
                font.pixelSize: 12
                font {
                    family: "Courier"
                }
            }
            CustomComboBox {
                id: filterOP
                font.pixelSize: 11
                model: ["Ascending date", "Descending date"]
                //textRole: "mission"
                Layout.preferredWidth: 175
                Layout.preferredHeight: 30
                font {
                    family: "Courier"
                }
            }
            RowLayout {
                anchors.left: filterOP.right
                anchors.leftMargin: 100
                Rectangle {
                    anchors.fill: parent
                    radius: 4
                }

                TextField {
                    id: searchTxt
                    font.pixelSize: 11
                    Layout.preferredWidth: 400
                    font.family: "Courier"
                    placeholderText: "Search flight ..."
                    background: Rectangle {
                        border.width: 0
                        radius: 4
                    }
                }
                Image {
                    anchors.left: searchTxt.right
                    id: search
                    source: "search.png"
                }
            }
        }
        SplitView {
            id: content
            Layout.leftMargin: 15
            anchors.topMargin: 30
            anchors.top: filSearch.bottom
            Layout.fillWidth: true
            anchors.bottom: rect1.top
            Layout.rightMargin: 15
            TableFlightSummary {
                id: table
                width: content.width / 2
                SplitView.minimumWidth: 600
                listviewFS.model: FlightModel
            }
            Page {
                id: detail
                SplitView.fillWidth: true

                header: TabBar {
                    id: flight_detail
                    height: 40
                    width: parent.width
                    currentIndex: fdContent.currentIndex
                    TabButton {
                        text: qsTr("Flight Information")
                        font.capitalization: Font.AllUppercase
                        font.pixelSize: 12
                        font.weight: Font.Black
                        font.bold: true
                        font.family: "Courier"
                    }
                    TabButton {
                        text: qsTr("Flight Detail")
                        font.capitalization: Font.AllUppercase
                        font.pixelSize: 12
                        font.weight: Font.Black
                        font.bold: true
                        font.family: "Courier"
                    }
                    TabButton {
                        text: qsTr("Flight Assessment")
                        font.capitalization: Font.AllUppercase
                        font.pixelSize: 12
                        font.weight: Font.Black
                        font.bold: true
                        font.family: "Courier"
                    }
                }
                StackLayout {
                    id: fdContent
                    currentIndex: flight_detail.currentIndex
                    anchors.fill: parent
                    FlightInFo {
                        id: fiTab
                    }
                    FlightDetail {
                        id: fdTab
                    }
                    FlightAssess {
                        id: faTab
                    }
                }
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
    D{i:0;height:1200;width:1600}
}
##^##*/

