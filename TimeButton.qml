import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

Button {
    Layout.preferredWidth: 30
    Layout.preferredHeight: 30
    text: "\u25BC"
    property alias cancelTime: cancelTime
    property alias setTime: setTime
    property alias timePicker: timePicker
    property alias timeDialog: timeDialog
    contentItem: Label {
        text: takeoffTime.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
        font.weight: Font.Black
        font.pointSize: 13
        font.family: "Courier"
    }
    background: Rectangle {
        id: bckg_Time
        radius: 2
        color: secondaryColor
    }
    onPressed: {
        bckg_Time.color = buttonPressedColor

    }
    onReleased: {
        bckg_Time.color = secondaryColor
    }

    //iconSource: "cal2.png"
    Popup {
        id: timeDialog

        //x: takeoff_time.x - takeoff_time.width
        //y: takeoff_time.y + takeoff_time.height
        width: 230
        height: 295
        visible: false
        modal: true
        focus: true
        background: Rectangle {
            anchors.fill: parent
            color: backgroundColor
            radius: 4
        }

        closePolicy: Popup.CloseOnEscape
                     | Popup.CloseOnPressOutsideParent
        TimePicker {
            id: timePicker
            radius: 4
            anchors.horizontalCenter: parent.horizontalCenter
            //weekNumbersVisible: true
            //width: 225
            //height: 220
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20
            anchors.bottom: parent.bottom
            Layout.fillWidth: true
            Button {
                id: setTime
                text: "Set"
                contentItem: Label {
                    text: setTime.text
                    font.pixelSize: 11
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_setTime
                    radius: 2
                    color: secondaryColor
                }
                onPressed: {
                    bckg_setTime.color = buttonPressedColor
                }
                onReleased: {
                    bckg_setTime.color = secondaryColor
                }
            }
            Button {
                id: cancelTime
                text: "Cancel"
                contentItem: Label {
                    text: cancelTime.text
                    font.pixelSize: 11
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_cancelTime
                    radius: 2
                    color: secondaryColor
                }
                onPressed: {
                    bckg_cancelTime.color = buttonPressedColor
                }
                onReleased: {
                    bckg_cancelTime.color = secondaryColor
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
