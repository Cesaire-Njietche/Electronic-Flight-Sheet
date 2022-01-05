import QtQuick 2.14
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13
import EFS 1.0

Rectangle {
    color: backgroundColor
    property alias n_simsession: n_simsession
    property alias controlSS: controlSS
    property alias listviewSS: listviewSS

    GroupBox {
        id: simsession
        anchors.fill: parent
        anchors.margins: 15
        anchors.top: parent.top
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
            //anchors.top: parent.top
            spacing: 2
            height: 250
            width: 830
            Row {
                id: columnsHeaderSS
                anchors.top: parent.top
                z: 2
                Repeater {
                   model: ["Date", "Center", "Aircraft", "Sim Type"]
                    Label {
                        width: 200
                        height: 35
                        text: modelData
                        font.bold: true
                        font.family: "Courier"
                        color: '#cccccc'
                        font.pixelSize: 11
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
                    simSManager: SSM
                }
                delegate: Row {

                    Rectangle {
                        width: 200
                        height: 30
                        TextField {
                            text: model.date
                            font.pixelSize: 11
                            font.family: "Courier"
                            anchors.fill: parent
                            onEditingFinished: model.date = text
                        }
                    }
                    Rectangle {
                        width: 200
                        height: 30
                        TextField {
                            text: model.tCenter
                            font.pixelSize: 11
                            font.family: "Courier"
                            anchors.fill: parent
                            onEditingFinished: model.tCenter = text
                        }
                    }
                    Rectangle {
                        width: 200
                        height: 30
                        TextField {
                            text: model.acftType
                            font.pixelSize: 11
                            font.family: "Courier"
                            anchors.fill: parent
                            onEditingFinished: model.acftType = text
                        }
                    }
                    Rectangle {
                        width: 200
                        height: 30
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
                            if (listviewSS.count < 4)
                                controlSS.visible = false
                            else
                                controlSS.visible = true
                        }
                    }
                }
                ScrollIndicator.vertical: ScrollIndicator {
                    id: controlSS
                    active: true
                    visible: false
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
                font {
                    family: "Courier"
                }
                contentItem: Label {
                    text: addSS.text
                    font.pixelSize: 11

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
                onPressed: {
                    bckg_addSS.color = buttonPressedColor
                }
                onReleased: {
                    bckg_addSS.color = secondaryColor
                }
                onClicked: {
                    n_simsession.open()
                }

                SimSession {
                    id: n_simsession

                    x: simsession.x + 800
                    y: simsession.y - 280

                    visible: false
                    modal: true
                    focus: true
                    closePolicy: Popup.CloseOnEscape
                                 | Popup.CloseOnPressOutsideParent
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
