import QtQuick 2.14
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13

Popup {
    id: fa_edit
    height: 250
    width: 600

    background: Rectangle {
        color: backgroundColor
        radius: 4
    }

    ColumnLayout {
        id: flight_assess
        spacing: 10
        anchors.fill: parent
        anchors.margins: 5

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
            id: assess
            //width: parent.width
            height: 200
            label: Label {
                text: assess.title
                font.pixelSize: 11
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
                spacing: 50
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
                    CustomComboBox {
                        id: grade
                        font.pixelSize: 11
                        font.family: "Courier"
                        //anchors.bottom: parent.bottom
                        //textRole: "pilot in command"
                        Layout.preferredWidth: 150
                        Layout.preferredHeight: 30
                        //cBColor: backgroundColor
                        model: ["Poor", "Fair", "Good", "Very Good"]
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
                            //anchors.rightMargin: 20
                            //Layout.fillWidth: true
                            background: Rectangle {
                                //implicitWidth: 200
                                //implicitHeight: 60
                                border.color: observation.activeFocus ? secondaryDarkColor : secondaryColor2
                            }
                        }
                    }
                }
            }
        }
        RowLayout {
            spacing: 20
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            Button {
                id: setFA
                Layout.preferredWidth: 80
                text: qsTr("Set")
                contentItem: Label {
                    text: setFA.text
                    font.pixelSize: 11
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_setFA
                    radius: 2
                    color: secondaryColor
                }
                /*onClicked: {
                    getDate(selectedDate)
                    datePickerRoot.close()
                }*/

                onPressed: {
                    bckg_setFA.color = buttonPressedColor
                }
                onReleased: {
                    bckg_setFA.color = secondaryColor
                }

            } // cancel button
            Button {
                Layout.preferredWidth: 80
                text: qsTr("Cancel")
                id: cancelFA
                contentItem: Label {
                    text: cancelFA.text
                    font.pixelSize: 11
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_cancelFA
                    radius: 2
                    color: secondaryColor
                }
                onClicked: {
                    fa_edit.close()
                }
                onPressed: {
                    bckg_cancelFA.color = buttonPressedColor
                }
                onReleased: {
                    bckg_cancelFA.color = secondaryColor
                }
            } // cancel button
        }
    }
}


