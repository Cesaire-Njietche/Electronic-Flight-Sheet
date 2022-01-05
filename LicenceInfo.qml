import QtQuick 2.14
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13
import EFS 1.0

Rectangle {
    color: backgroundColor
    property alias controlL: controlL
    property alias listviewL: listviewL
    property alias n_licence: n_licence

    GroupBox {
        id: licence
        anchors.fill: parent
        anchors.margins: 15
        anchors.top: parent.top
        title: "LICENCES"
        label: Label {
            text: licence.title
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
                id: columnsHeaderL
                anchors.top: parent.top
                z: 2
                Repeater {
                    model: ["Date", "Title", "Issuing Authority", "  Licence Number"]
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
                id: listviewL
                clip: true
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.top: columnsHeaderL.bottom
                model: LicenceModel {
                    licenceManager: LM
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
                            text: model.authority
                            font.pixelSize: 11
                            font.family: "Courier"
                            anchors.fill: parent
                            onEditingFinished: model.authority = text
                        }
                    }
                    Rectangle {
                        width: 200
                        height: 30
                        TextField {
                            text: model.number
                            font.pixelSize: 11
                            font.family: "Courier"
                            anchors.fill: parent
                            onEditingFinished: model.number = text
                        }
                    }

                    Image {
                        source: "delete22.png"
                        anchors.verticalCenter: parent.verticalCenter
                        MouseArea {
                            id: delL
                            anchors.fill: parent
                        }
                    }
                    Connections {
                        target: delL
                        onClicked: {
                            LM.removeItemAt(index)
                            if (listviewL.count < 4)
                                controlL.visible = false
                            else
                                controlL.visible = true
                        }
                    }
                }
                ScrollIndicator.vertical: ScrollIndicator {
                    id: controlL
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
                id: addL
                text: "Add"
                font {
                    family: "Courier"
                }
                contentItem: Label {
                    text: addL.text
                    font.pixelSize: 11

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_addL
                    radius: 2
                    color: secondaryColor
                }
                onPressed: {
                    bckg_addL.color = buttonPressedColor
                }
                onReleased: {
                    bckg_addL.color = secondaryColor
                }
                onClicked: {
                    n_licence.open()
                }

                Licence {
                    id: n_licence

                    x: licence.x + 800
                    y: licence.y - 280

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
