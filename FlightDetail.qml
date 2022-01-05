import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13

Rectangle{
    color: backgroundColor
    property alias edit_F_detail: edit_F_detail
    property alias route: route
    property alias mission: mission
    property alias flightRegime: flightRegime
    property alias flightRule: flightRule
    property alias arr_time: arr_time
    property alias arr_loc: arr_loc
    property alias takeoff_time: takeoff_time
    property alias depart_loc: depart_loc

    FlightDetailEdit{
        id: edit_F_detail
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
        anchors.margins: 5
        ColumnLayout{
            anchors.top: parent.top
            spacing: 30
            GroupBox {
                id: depart_field
                //width: parent.width
                height: 200
                label: Label {
                    text: depart_field.title
                    font.pixelSize: 12
                    textFormat: Text.PlainText
                    wrapMode: Text.NoWrap
                    bottomPadding: 0
                    font.weight: Font.Black
                    font.bold: true
                    font.family: "Courier"
                }

                title: qsTr("DEPARTURE/ARRIVAL AIRFIELD")

                RowLayout {
                    spacing: 20
                    ColumnLayout {
                        spacing: 5
                        Label {
                            text: "DEPARTURE AIRFIELD "
                            font.pixelSize: 11
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }
                        TextField {
                            id: depart_loc
                            font.bold: true
                            font.weight: Font.ExtraBold
                            font.pixelSize: 11
                            font.family: "Courier"
                            enabled: false
                            //anchors.bottom: parent.bottom
                            //textRole: "aircraft id"
                            Layout.preferredWidth: 130
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
                        Label {
                            text: "TAKEOFF TIME "
                            font.pixelSize: 11
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }
                        TextField {
                            id: takeoff_time
                            font.bold: true
                            font.weight: Font.ExtraBold
                            font.pixelSize: 11
                            font.family: "Courier"
                            enabled: false
                            //anchors.bottom: parent.bottom
                            //textRole: "aircraft id"
                            Layout.preferredWidth: 130
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
                        Label {
                            text: "ARRIVAL AIRFIELD "
                            font.pixelSize: 11
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }
                        TextField {
                            id: arr_loc
                            font.bold: true
                            font.weight: Font.ExtraBold
                            font.pixelSize: 11
                            font.family: "Courier"
                            enabled: false
                            //anchors.bottom: parent.bottom
                            //textRole: "aircraft id"
                            Layout.preferredWidth: 130
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
                        Label {
                            text: "LANDING TIME "
                            font.pixelSize: 11
                            style: Text.Sunken
                            font {
                                family: "Courier"
                            }
                        }
                        TextField {
                            id: arr_time
                            font.bold: true
                            font.weight: Font.ExtraBold
                            font.pixelSize: 11
                            font.family: "Courier"
                            enabled: false
                            //anchors.bottom: parent.bottom
                            //textRole: "aircraft id"
                            Layout.preferredWidth: 130
                            Layout.preferredHeight: 30
                            background: Rectangle{
                                border.width: 2
                                border.color: backgroundColor
                                color: "#ffffff"

                            }
                        }
                    }
                }
            }
            RowLayout {
                spacing: 50
                ColumnLayout {
                    spacing: 5
                    Label {
                        text: "FLIGHT RULE "
                        font.pixelSize: 11
                        style: Text.Sunken
                        font {
                            family: "Courier"
                        }
                    }
                    TextField {
                        id: flightRule
                        font.bold: true
                        font.weight: Font.ExtraBold
                        font.pixelSize: 11
                        font.family: "Courier"
                        enabled: false
                        //anchors.bottom: parent.bottom
                        //textRole: "aircraft id"
                        Layout.preferredWidth: 100
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
                    Label {
                        text: "FLIGHT REGIME "
                        font.pixelSize: 11
                        style: Text.Sunken
                        font {
                            family: "Courier"
                        }
                    }
                    TextField {
                        id: flightRegime
                        font.bold: true
                        font.weight: Font.ExtraBold
                        font.pixelSize: 11
                        font.family: "Courier"
                        enabled: false
                        //anchors.bottom: parent.bottom
                        //textRole: "aircraft id"
                        Layout.preferredWidth: 200
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
                    Label {
                        text: "MISSION "
                        font.pixelSize: 11
                        font.bold: false
                        style: Text.Sunken
                        font {
                            family: "Courier"
                        }
                    }
                    TextField {
                        id: mission
                        font.bold: true
                        font.weight: Font.ExtraBold
                        font.pixelSize: 11
                        font.family: "Courier"
                        enabled: false
                        //anchors.bottom: parent.bottom
                        //textRole: "aircraft id"
                        Layout.preferredWidth: 220
                        Layout.preferredHeight: 30
                        background: Rectangle{
                            border.width: 2
                            border.color: backgroundColor
                            color: "#ffffff"

                        }
                    }
                }
            }
            ColumnLayout {
                spacing: 5
                //anchors.top: ft.bottom
                anchors.topMargin: 10
                Label {
                    text: "ROUTE "
                    font.pixelSize: 11
                    font.weight: Font.Normal
                    style: Text.Sunken
                    font.bold: false
                    font {
                        family: "Courier"
                    }
                }
                TextArea {
                    id: route
                    text: ""
                    Layout.leftMargin: 0
                    font.pixelSize: 11
                    textFormat: Text.RichText
                    placeholderText: "Route ..."
                    font.weight: Font.Black
                    font.wordSpacing: 1.3
                    font.family: "Courier"
                    enabled: false
                    anchors.rightMargin: 20
                    Layout.fillWidth: true
                    background: Rectangle {
                        //implicitWidth: 200
                        implicitHeight: 40
                        border.width: 2
                        border.color: backgroundColor
                        color: "#ffffff"
                    }

                    //anchors.bottom: parent.bottom
                    //Layout.preferredWidth: flightDetail.width - 24
                    //Layout.preferredHeight: 30
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
                    edit_F_detail.open()
                }
            }
        }

    }

    /*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

}
