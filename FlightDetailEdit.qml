import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13

Popup{
    id: fd_edit
    width: 700
    height: 400
    property alias landingTime: landingTime
    property alias landing_time: landing_time
    property alias takeoffTime: takeoffTime
    property alias takeoff_time: takeoff_time
    background: Rectangle {
        color: backgroundColor
        radius: 4
    }
    ColumnLayout{
        id: flight_detail
        anchors.fill: parent
        anchors.margins: 5
        spacing: 10
        Label{
            text: qsTr("EDIT FLIGHT ") //Can add a unique Ref to this flight
            font.weight: Font.ExtraBold
            font.bold: true
            font.pixelSize: 12
            font.family: "Courier"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top

        }
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
                spacing: 10
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
                        font.pixelSize: 11
                        font.family: "Courier"
                        font.weight: Font.Normal
                        Layout.preferredHeight: 30
                        Layout.preferredWidth: 130
                        background: Rectangle {
                            //color: "transparent"
                            border.color: secondaryColor2
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
                    RowLayout {
                        TextField {
                            id: takeoff_time
                            font.pixelSize: 11
                            font.bold: true
                            font.family: "Courier"
                            placeholderText: "HH:SS AM/PM"
                            //Layout.fillHeight: true
                            Layout.preferredHeight: 30
                            Layout.preferredWidth: 130
                            enabled: false
                            background: Rectangle {
                                color: "transparent"
                                border.color: secondaryColor2
                            }
                        }

                        TimeButtonAMPM {
                            id: takeoffTime
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
                        id: arrival_loc
                        font.bold: true
                        font.pixelSize: 11
                        font.family: "Courier"
                        font.weight: Font.Normal
                        Layout.preferredHeight: 30
                        Layout.preferredWidth: 130
                        background: Rectangle {
                            //color: "transparent"
                            border.color: secondaryColor2
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
                    RowLayout {
                        TextField {
                            id: landing_time
                            font.pixelSize: 11
                            font.bold: true
                            font.family: "Courier"
                            placeholderText: "HH:SS AM/PM"
                            //Layout.fillHeight: true
                            Layout.preferredHeight: 30
                            Layout.preferredWidth: 130
                            enabled: false
                            background: Rectangle {
                                color: "transparent"
                                border.color: secondaryColor2
                            }
                        }

                        TimeButtonAMPM {
                            id: landingTime
                        }
                    }
                }
            }
        }
        RowLayout {
            spacing: 40
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
                CustomComboBox {
                    id: flightRule
                    font.pixelSize: 11
                    font.family: "Courier"
                    //anchors.bottom: parent.bottom
                    //textRole: "flight rule"
                    Layout.preferredWidth: 150
                    Layout.preferredHeight: 30
                    //height: 35
                    // cBColor: backgroundColor
                    model: ["VFR", "IFR"]
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
                CustomComboBox {
                    id: flightRegime
                    font.pixelSize: 11
                    font.family: "Courier"
                    //anchors.bottom: parent.bottom
                    //textRole: "flight rule"
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 30
                    //height: 35
                    // cBColor: backgroundColor
                    model: ["GENERAL AVIATION", "MILITARY OPS"]
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
                CustomComboBox {
                    id: mission
                    font.pixelSize: 11
                    font.family: "Courier"
                    //anchors.bottom: parent.bottom
                    //textRole: "mission"
                    Layout.preferredWidth: 250
                    Layout.preferredHeight: 30
                     model: ["VIP HELISTANSPORT", "CASIVAC OPS EMERGENCE 2", "CASIVAC OPS EMERGENCE 5", "PILOT TRAINING", "RECURENT PILOT TRAINING", "TACTICAL FLIGHT", "LOGISTIC SUPPORT OPS EME 2", "LOGISTIC SUPPORT OPS EME 5", "IFR TRAINING", "TACTICAL TRAINING", "CROSS COUNTRY NAVIGATION", "MAINTENANCE TEST FLIGHT", "MAINTENANCE TEST FLIGHT", "CREW QUALIFICATION", "ADMINISTRATIVE SUPPORT"]
                    //cBColor: backgroundColor
                }
            }
        }
        ColumnLayout {
            spacing: 5
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
                font.pixelSize: 11
                textFormat: Text.RichText
                placeholderText: "Route ..."
                font.weight: Font.Black
                font.wordSpacing: 1.3
                font.family: "Courier"
                Layout.fillWidth: true
                background: Rectangle {
                    //implicitWidth: 200
                    implicitHeight: 40
                    border.color: route.activeFocus ? secondaryDarkColor : secondaryColor2
                }

                //anchors.bottom: parent.bottom
                //Layout.preferredWidth: flightDetail.width - 24
                //Layout.preferredHeight: 30
            }
        }
        RowLayout {
            spacing: 20
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            Button {
                id: setFD
                Layout.preferredWidth: 80
                text: qsTr("Set")
                contentItem: Label {
                    text: setFD.text
                    font.pixelSize: 11
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_setFD
                    radius: 2
                    color: secondaryColor
                }
                /*onClicked: {
                    getDate(selectedDate)
                    datePickerRoot.close()
                }*/

                onPressed: {
                    bckg_setFD.color = buttonPressedColor
                }
                onReleased: {
                    bckg_setFD.color = secondaryColor
                }

            } // cancel button
            Button {
                Layout.preferredWidth: 80
                text: qsTr("Cancel")
                id: cancelFD
                contentItem: Label {
                    text: cancelFD.text
                    font.pixelSize: 11
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_cancelFD
                    radius: 2
                    color: secondaryColor
                }
                onClicked: {
                    fd_edit.close()
                }
                onPressed: {
                    bckg_cancelFD.color = buttonPressedColor
                }
                onReleased: {
                    bckg_cancelFD.color = secondaryColor
                }
            } // cancel button
        }
    }

}


