import QtQuick 2.12
import QtQuick.Controls 2.12

ComboBox {
    id: control
    //model: ["First", "Second", "Third"]
    //property color bColor: value
    //property alias cBColor: rect.color
    property color secondaryDarkColor: "#009bd7"
    property color secondaryColor: "#45c2e8"
    delegate: ItemDelegate {
        width: control.width

        contentItem: Text {
            text: modelData
            font.family: "Courier"
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter

        }
        highlighted: control.highlightedIndex === index
    }

    indicator: Canvas {
        id: canvas
        x: control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: 12
        height: 8
        contextType: "2d"

        Connections {
            target: control
            function onPressedChanged() { canvas.requestPaint(); }
        }

        onPaint: {
            var ctxt = canvas.getContext("2d")
            ctxt.reset();
            ctxt.moveTo(0, 0);
            ctxt.lineTo(width, 0);
            ctxt.lineTo(width / 2, height);
            ctxt.closePath();
            ctxt.fillStyle = control.pressed ? secondaryDarkColor : secondaryColor;
            ctxt.fill();
        }
    }

    contentItem: Text {
        leftPadding: 0
        rightPadding: control.indicator.width + control.spacing

        text: control.displayText
        font: control.font
        //color: control.pressed ? "#17a81a" : "#21be2b"
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        horizontalAlignment: Text.AlignHCenter
    }

    background: Rectangle {
        id: rect
        border.color: control.pressed ? secondaryDarkColor : secondaryColor
        border.width: control.visualFocus ? 2 : 1
        radius: 2
    }

    /*popup: Popup {
        y: control.height - 1
        width: control.width
        implicitHeight: contentItem.implicitHeight
        padding: 1

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {
            border.color: "#21be2b"
            radius: 2
        }
    }*/
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
