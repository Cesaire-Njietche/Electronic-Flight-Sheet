import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.3

import EFS 1.0

Page {
    id: pilot_sheet

    title: qsTr("Pilot Sheet")

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
    property color secondaryColor2: "#45c2e8"
    property color backgroundColor: "#d9dbdb"
    property alias pgiTab: pgiTab
    property alias ptiTab: ptiTab
    property alias pliTab: pliTab
    property alias pssiTab: pssiTab
    property alias canvas: canvas
    property alias filterPilot: filterPilot
    property alias pilot_pic: pilot_pic
    property alias pilot_sheet: pilot_sheet
    property alias dwlClick: dwlClick
    property alias prt: prt

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
            margins: 15
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
                text: "PILOT SHEET"
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
                MouseArea {
                    id: dwlClick
                    anchors.fill: parent
                }
            }
            Image {
                id: prt
                source: "print.png"
                anchors.right: parent.right
                anchors.rightMargin: 30
                MouseArea {
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
                text: "Pilot Name "
                font.weight: Font.Black
                font.pixelSize: 11
                font {
                    family: "Courier"
                }
            }
            ComboBox {
                delegate: ItemDelegate {
                    width: filterPilot.width
                    contentItem: Text {
                        text: model.name + " " + model.surname
                        font.pixelSize: 11
                        font.family: "Courier"
                        elide: Text.ElideRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    highlighted: filterPilot.highlightedIndex === index
                }
                indicator: Canvas {
                    id: canvas
                    x: filterPilot.width - width - filterPilot.rightPadding
                    y: filterPilot.topPadding + (filterPilot.availableHeight - height) / 2
                    width: 12
                    height: 8
                    contextType: "2d"
                }

                contentItem: Text {
                    leftPadding: 0
                    rightPadding: filterPilot.indicator.width + filterPilot.spacing

                    text: filterPilot.displayText
                    font: filterPilot.font
                    //color: control.pressed ? "#17a81a" : "#21be2b"
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    horizontalAlignment: Text.AlignHCenter
                }

                background: Rectangle {

                    border.color: filterPilot.pressed ? secondaryDarkColor2 : secondaryColor2
                    border.width: filterPilot.visualFocus ? 2 : 1
                    radius: 2
                }
                id: filterPilot
                font.pixelSize: 11
                font.family: "Courier"
                font.weight: Font.Normal
                Layout.preferredHeight: 30
                Layout.preferredWidth: 200
                anchors.right: parent.right
                textRole: "name"
                model: PilotModel

                //Component.onCompleted: {TrainingModel.selectTitle(currentText)}
                //onCurrentIndexChanged: console.log(model.get(currentIndex).title)
            }
        }
        Image {
            id: pilot_pic
            sourceSize.height: 70
            sourceSize.width: 70
            anchors.right: parent.right
            anchors.top: filSearch.bottom
            anchors.rightMargin: 15
        }
        Page {
            id: detail
            Layout.leftMargin: 15
            Layout.rightMargin: 15
            Layout.fillWidth: true
            anchors.right: parent.right
            anchors.topMargin: 15
            anchors.rightMargin: 15
            anchors.top: pilot_pic.bottom
            header: TabBar {
                id: pilot_detail
                height: 40
                width: parent.width
                currentIndex: pdContent.currentIndex
                TabButton {
                    text: qsTr("General Information")
                    font.capitalization: Font.AllUppercase
                    font.pixelSize: 14
                    font.weight: Font.Black
                    font.bold: true
                    font.family: "Courier"
                }
                TabButton {
                    text: qsTr("Training Information")
                    font.capitalization: Font.AllUppercase
                    font.pixelSize: 14
                    font.weight: Font.Black
                    font.bold: true
                    font.family: "Courier"
                }
                TabButton {
                    text: qsTr("Licences Information")
                    font.capitalization: Font.AllUppercase
                    font.pixelSize: 14
                    font.weight: Font.Black
                    font.bold: true
                    font.family: "Courier"
                }
                TabButton {
                    text: qsTr("Sim Session Information")
                    font.capitalization: Font.AllUppercase
                    font.pixelSize: 14
                    font.weight: Font.Black
                    font.bold: true
                    font.family: "Courier"
                }
            }
            StackLayout {
                id: pdContent
                currentIndex: pilot_detail.currentIndex
                anchors.fill: parent
                Layout.fillWidth: true
                GeneralInfo {
                    id: pgiTab
                }
                TrainingInfo {
                    id: ptiTab
                }
                LicenceInfo {
                    id: pliTab
                }
                SimSessionInfo {
                    id: pssiTab
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
            anchors.bottomMargin: 15
        }
    }
    //Component.onComplete:
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:750;width:1350}
}
##^##*/

