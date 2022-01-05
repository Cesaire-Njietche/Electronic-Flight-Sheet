import QtQuick 2.14
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13
import EFS 1.0

Rectangle {
    color: backgroundColor
    property alias controlT: controlT
    property alias listviewT: listviewT
    property alias n_training: n_training
    GroupBox {
        id: training
        anchors.fill: parent
        anchors.margins: 15
        anchors.top: parent.top
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
            //anchors.top: parent.top
            spacing: 2
            height: 250
            width: 830
            Row {
                id: columnsHeaderT
                anchors.top: parent.top
                z: 2
                Repeater {
                    model: ["Date", "Title", "Center", "Issuing Authority"]
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
                id: listviewT
                clip: true
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.top: columnsHeaderT.bottom
                model: TrainingModel {
                    trainingManager: TM
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
                            text: model.title
                            font.pixelSize: 11
                            font.family: "Courier"
                            anchors.fill: parent
                            onEditingFinished: model.title = text
                        }
                    }
                    Rectangle {
                        width: 200
                        height: 30
                        TextField {
                            text: model.center
                            font.pixelSize: 11
                            font.family: "Courier"
                            anchors.fill: parent
                            onEditingFinished: model.center = text
                        }
                    }
                    Rectangle {
                        width: 200
                        height: 30
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
                            if (listviewT.count < 4)
                                controlT.visible = false
                            else
                                controlT.visible = true
                        }
                    }
                }
                ScrollIndicator.vertical: ScrollIndicator {
                    id: controlT
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
                id: addT
                text: "Add"
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
                onPressed: {
                    bckg_addT.color = buttonPressedColor
                }
                onReleased: {
                    bckg_addT.color = secondaryColor
                }
                onClicked: {
                    n_training.open()
                }

                Training {
                    id: n_training

                    x: training.x + 800
                    y: training.y - 280

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
