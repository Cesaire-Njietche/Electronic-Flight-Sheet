import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

Button {
    id: date
    Layout.preferredWidth: 30
    Layout.preferredHeight: 30
    text: "\u25BC"
    //property alias dateDialog: dateDialog
    contentItem: Label {
        text: date.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
        font.weight: Font.Black
        font.pointSize: 13
        font.family: "Courier"
    }
    background: Rectangle {
        id: bckg_date
        radius: 2
        color: secondaryColor
    }
    onPressed: {
        bckg_date.color = buttonPressedColor
    }
    onReleased: {
        bckg_date.color = secondaryColor
    }


    /*Calendar {
        id: dateDialog
        visible: false
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    }*/
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
