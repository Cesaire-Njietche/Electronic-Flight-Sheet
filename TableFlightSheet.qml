import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

Rectangle{
    id: tableFS
    property alias tableFS: tableFS
    property alias listviewFS: listviewFS
    property alias controlFS: controlFS
    property color secondaryColor: "#aee1f5"
    property int selectedRow: 0

    signal selectRow(int selectedRow)
    Row {
        id: columnsHeader
        z: 2
        Repeater {
            model: [" Date", "Aircraft Type", " Registration", "  Departure", "  Arrival", " Flight Time", " Pilot", "Co-Pilot"]
            Label {
                width: 150
                height: 40
                text: modelData
                font.capitalization: Font.AllUppercase
                font.bold: true
                font.family: "Courier"
                color: '#aaaaaa'
                font.pixelSize: 12
                padding: 5
                verticalAlignment: Text.AlignVCenter

                background: Rectangle {
                    color: "#333333"
                }
            }
        }
    }

    ListView {
        id: listviewFS
        clip: true
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: columnsHeader.bottom
        highlight: Rectangle {color: secondaryColor; radius: 5 }
        focus: true

        delegate:

            Item{
            width: 1200
            height: 35
            id: root

            MouseArea{
                id: ma
                anchors.fill: parent
                onClicked: {
                    listviewFS.currentIndex = index
                    selectRow(index)
                }
            }

            Row {
                Rectangle{
                    //id: field1
                    width: 150
                    height: 35
                    color: "transparent"
                    TextField {

                        text: Qt.formatDate(model.date, "dd/MM/yyyy")
                        font.pixelSize: 11
                        font.weight: Font.Black
                        enabled: false
                        font.family: "Courier"
                        anchors.fill: parent
                        onEditingFinished: model.date = text
                        background: Rectangle{
                            anchors.fill: parent
                            color: "transparent"
                            border.color: "#9ea09b"
                            border.width: 1
                        }
                    }
                }
                Rectangle {
                    width: 150
                    height: 35
                    color: "transparent"
                    TextField {
                        text: model.acft_type
                        font.pixelSize: 11
                        font.weight: Font.Black
                        enabled: false
                        font.family: "Courier"
                        anchors.fill: parent
                        onEditingFinished: model.type = text
                        background: Rectangle{
                            anchors.fill: parent
                            //color: ma.pressed? "#87CEFA": "white"
                            color: "transparent"
                            border.color: "#9ea09b"
                            border.width: 1
                        }
                    }
                }
                Rectangle {
                    width: 150
                    height: 35
                    color: "transparent"
                    TextField {
                        text: model.acft_registration
                        font.pixelSize: 11
                        font.weight: Font.Black
                        enabled: false
                        font.family: "Courier"
                        anchors.fill: parent
                        onEditingFinished: model.registration = text
                        background: Rectangle{
                            anchors.fill: parent
                            //color: ma.pressed? "#87CEFA": "white"
                            color: "transparent"
                            border.color: "#9ea09b"
                            border.width: 1
                        }
                    }
                }
                Rectangle {
                    width: 150
                    height: 35
                    color: "transparent"
                    TextField {
                        text: model.dep_aerodrome
                        font.pixelSize: 11
                        font.weight: Font.Black
                        enabled: false
                        font.family: "Courier"
                        anchors.fill: parent
                        onEditingFinished: model.departure = text
                        background: Rectangle{
                            anchors.fill: parent
                            //color: ma.pressed? "#87CEFA": "white"
                            color: "transparent"
                            border.color: "#9ea09b"
                            border.width: 1
                        }
                    }
                }
                Rectangle{
                    //id: field1
                    width: 150
                    height: 35
                    color: "transparent"
                    TextField {

                        text: model.arr_aerodrome
                        font.pixelSize: 11
                        font.weight: Font.Black
                        enabled: false
                        font.family: "Courier"
                        anchors.fill: parent
                        onEditingFinished: model.arrival = text
                        background: Rectangle{
                            anchors.fill: parent
                            color: "transparent"
                            border.color: "#9ea09b"
                            border.width: 1
                        }
                    }
                }
                Rectangle{
                    //id: field1
                    width: 150
                    height: 35
                    color: "transparent"
                    TextField {

                        text: {var m = model.flight_time
                            var h = 0
                            var mn = 0
                            if(m >= 60){
                                mn = m % 60
                                h =(m - mn)/60
                                return h + "h" + mn + "mn"
                            }
                            else
                                return m + "mn"
                        }
                        font.pixelSize: 11
                        font.weight: Font.Black
                        enabled: false
                        font.family: "Courier"
                        anchors.fill: parent
                        onEditingFinished: model.flight_time = text
                        background: Rectangle{
                            anchors.fill: parent
                            color: "transparent"
                            border.color: "#9ea09b"
                            border.width: 1
                        }
                    }
                }
                Rectangle{
                    //id: field1
                    width: 150
                    height: 35
                    color: "transparent"
                    TextField {

                        text: model.ID_Pilot1
                        font.pixelSize: 11
                        font.weight: Font.Black
                        enabled: false
                        font.family: "Courier"
                        anchors.fill: parent
                        onEditingFinished: model.ID_Pilot1 = text
                        background: Rectangle{
                            anchors.fill: parent
                            color: "transparent"
                            border.color: "#9ea09b"
                            border.width: 1
                        }
                    }
                }
                Rectangle{
                    //id: field1
                    width: 150
                    height: 35
                    color: "transparent"
                    TextField {

                        text: model.ID_Pilot2
                        font.pixelSize: 11
                        font.weight: Font.Black
                        enabled: false
                        font.family: "Courier"
                        anchors.fill: parent
                        onEditingFinished: model.ID_Pilot2 = text
                        background: Rectangle{
                            anchors.fill: parent
                            color: "transparent"
                            border.color: "#9ea09b"
                            border.width: 1
                        }
                    }
                }
            }
        }
        ScrollIndicator.vertical: ScrollIndicator {
            id: controlFS
            active: true
            orientation: Qt.Vertical
            anchors.leftMargin: 5
            contentItem: Rectangle {
                implicitWidth: 4
                implicitHeight: 50
                color: secondaryColor2
            }
            Component.onCompleted: {
                if(listviewFS.count < 6)
                    visible = false
                else
                    visible = true
            }
        }

    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
