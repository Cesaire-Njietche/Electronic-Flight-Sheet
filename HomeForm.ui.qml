import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3


Rectangle {
    width: 800; height: 600
    color: "blue"
    focus: true
    opacity: 0.9
    id: rect

    Rectangle {
        width: 60; height: 60
        x: rect1.x - 5; y: rect1.y - 5
        color: "green"

        Behavior on x {SpringAnimation { spring: 2; damping: 0.2 }}
        Behavior on y {SpringAnimation { spring: 2; damping: 0.2 }}
    }

    Rectangle {
        id: rect1
        width: 50; height: 50
        color: "red"
    }


    MouseArea{
        anchors.fill: parent
        onClicked: rect.forceActiveFocus()
    }

    Component.onCompleted:
        console.log(activeFocus ? "I have active focus!" : "I do not have active focus")
    Keys.onRightPressed: {rect1.x = rect1.x + 100}
    Keys.onLeftPressed: rect1.x = rect1.x - 100
    Keys.onUpPressed: rect1.y = rect1.y - 100
    Keys.onDownPressed: rect1.y = rect1.y + 100
}
