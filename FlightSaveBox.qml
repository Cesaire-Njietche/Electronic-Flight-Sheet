import QtQuick 2.14
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13

Popup {
    id: pilotSB
    height: 150
    property alias cancelNext: cancelNext
    property alias next: next
    width: 250

    background: Rectangle {
        color: backgroundColor
        radius: 4
    }

    ColumnLayout {
        id: flight_assess
        spacing: 10
        anchors.fill: parent
        anchors.margins: 10

        Label{
            color: "#169451"
            text: qsTr("FLIGHT SUCCESSFULLY SAVED!") //Can add a unique Ref to this flight
            font.weight: Font.ExtraBold
            font.bold: true
            font.pixelSize: 11
            font.family: "Courier"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top

        }

        Label{
            text: qsTr("Add another flight?") //Can add a unique Ref to this flight
            font.weight: Font.ExtraBold
            font.bold: true
            font.pixelSize: 11
            font.family: "Courier"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: c.top
            anchors.bottomMargin: 30

        }
        RowLayout {
            id: c
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            Button {
                id: next
                Layout.preferredWidth: 50
                text: qsTr("Yes")
                contentItem: Label {
                    text: next.text
                    font.pixelSize: 11
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_setNext
                    radius: 2
                    color: secondaryColor
                }
                onClicked: {
                    pilotSB.close()
                }

                onPressed: {
                    bckg_setNext.color = buttonPressedColor
                }
                onReleased: {
                    bckg_setNext.color = secondaryColor
                }

            } // cancel button
            Button {
                Layout.preferredWidth: 50
                text: qsTr("No")
                id: cancelNext
                contentItem: Label {
                    text: cancelNext.text
                    font.pixelSize: 11
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_cancelNext
                    radius: 2
                    color: secondaryColor
                }
                onClicked: {
                    pilotSB.close()
                    efs.replace(efs.currentItem, "Home.qml")
                }
                onPressed: {
                    bckg_cancelNext.color = buttonPressedColor
                }
                onReleased: {
                    bckg_cancelNext.color = secondaryColor
                }
            } // cancel button
        }
    }
}


