import QtQuick 2.14
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13

Rectangle {
    color: backgroundColor
    property alias edit_F_assess: edit_F_assess
    property alias observation: observation
    property alias grade: grade

    FlightAssessEdit{
        id: edit_F_assess
        //x: pilot.width / 2 - 250
        //y: pilot.height / 2 - 800

        visible: false
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape|
                     Popup.CloseOnPressOutside


    }

    RowLayout {
        id: flight_assess
        spacing: 30
        anchors.fill: parent
        anchors.margins: 5

        //anchors.horizontalCenter: parent.horizontalCenter
        //anchors.centerIn: parent
        GroupBox {
            anchors.top: parent.top
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
                spacing: 100
                width: parent.width
                ColumnLayout {
                    spacing: 5
                    Label {
                        text: "GRADE "
                        font.pixelSize: 11
                        style: Text.Sunken
                        font {
                            family: "Courier"
                        }
                    }
                    TextField {
                        id: grade
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
                            font.pixelSize: 11
                            textFormat: Text.RichText
                            placeholderText: "observation ..."
                            font.weight: Font.Black
                            font.wordSpacing: 1.3
                            font.family: "Courier"
                            enabled: false
                            //anchors.rightMargin: 20
                            //Layout.fillWidth: true
                            background: Rectangle {
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
            anchors.top: parent.top
            anchors.right: parent.right
            id: edit
            source: "pencil.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    edit_F_assess.open()
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
