
import QtQuick 2.12
import QtQuick.Controls 2.5
//import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3

Page {
    id: page
    font.pixelSize: 17
    font.weight: Font.Black
    font.bold: true
    font.family: "Courier"
    Layout.fillWidth: true
    Layout.fillHeight: true
    property color backgroundColor: "#aee1f5"
    title: qsTr("Home")
    FontLoader{
        id: signature
        source: "Adine.ttf"
    }
    FontLoader{
        id: clock
        source: "digital-7.ttf"
    }


    //spacing: 2
    Rectangle {
        anchors {
            margins: 5
            fill: parent
        }
        radius: 5
        opacity: 0.8
        color: "#EBECF0" //Silver metallic "#EBECF0"
        border.color: secondaryColor
        /*gradient: Gradient {
                  GradientStop {
                      position: 0.0
                      SequentialAnimation on color {
                          loops: Animation.Infinite
                          ColorAnimation { from: "#14148c"; to: "#0E1533"; duration: 5000 }
                          ColorAnimation { from: "#0E1533"; to: "#14148c"; duration: 5000 }
                      }
                  }
                  GradientStop {
                      position: 1.0
                      SequentialAnimation on color {
                          loops: Animation.Infinite
                          ColorAnimation { from: "#14aaff"; to: "#437284"; duration: 5000 }
                          ColorAnimation { from: "#437284"; to: "#14aaff"; duration: 5000 }
                      }
                  }
              }*/
    }

    Label{
        anchors.right: parent.right
        anchors.rightMargin: 15
        anchors.top: parent.top
        anchors.topMargin: 15
        id: time
        color: "#b80823"
        text: "Time"
        font.pixelSize: 30
        font.family: clock.name
        function setTime(){
            var date = new Date;
            var h = date.getUTCHours()
            var m = date.getUTCMinutes()
            var s = date.getUTCSeconds();
            h = h < 10 ? "0" + h : h
            m = m < 10 ? "0" + m : m
            s = s < 10 ? "0" + s : s
            var UTC = h + " : " + m + " : " + s

            time.text = UTC + " UTC"
        }
    }
    Label{
        id: comgmo
        anchors.right: parent.right
        anchors.rightMargin: 15
        anchors.top: time.bottom
        anchors.topMargin: 15
        text: "Captain Gariba Walter"
        font.weight: Font.DemiBold
        font.bold: false
        font.pixelSize: 30
        font.family: signature.name
    }
    Rectangle{
        id: colorTop
        opacity: 0.6
        width: page.width - 200
        height: 150
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.topMargin: 5
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: backgroundColor
            }
            GradientStop {
                position: 1.0
                color: "#EBECF0"
            }
            orientation: Gradient.Horizontal
        }
    }
    Rectangle{
        id: colorMiddle

        opacity: 0.4
        anchors.top: colorTop.bottom
        anchors.left: parent.left
        anchors.leftMargin: 5
        height: parent.height - colorTop.height - 40
        width: colorTop.width - 100
        SequentialAnimation on width {
            running: true
            loops: Animation.Infinite
            NumberAnimation{from: 650; to: 300; duration: 8000; easing.type: Easing.InOutQuad}
            PauseAnimation {duration: 250 }
        }
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: backgroundColor
            }
            GradientStop {
                position: 1.0
                color: "#EBECF0"
            }
            orientation: Gradient.Vertical
        }
    }
    RowLayout{
        y: 175
        anchors.left: parent.left
        anchors.leftMargin: 100
        spacing: 150
        ColumnLayout{
            spacing: 10
            anchors.top: parent.top
            Image {
                id: logo
                x: 0
                fillMode: Image.Tile
                sourceSize.height: 300
                sourceSize.width: 300
                source: "logo.png"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }
            Label{
                id: texte
                text: "51st FLYING SQUADRON ELECTRONIC FLIGHT BOOK"
                font.pixelSize: 20
            }

        }
        Rectangle{
            border.width: 10
            border.color: "#fee9bd"
            radius: 5
            layer.textureMirroring: ShaderEffectSource.MirrorHorizontally
            x: 900
            y: 200
            width: 500
            height: 450
            Image{
                id: galery
                anchors{
                    fill: parent
                    margins: 10
                }
                sourceSize.width: 580
                sourceSize.height: 430

                source: "img1.jpg"
                SequentialAnimation on source {
                    running: true
                    loops: Animation.Infinite
                    PropertyAnimation{ to: "img2.jpg"; duration: 8000; easing.type: Easing.InBounce}
                    PropertyAnimation {duration: 250 }
                    PropertyAnimation{ to: "img3.jpg"; duration: 8000; easing.type: Easing.InOutQuad}
                    PropertyAnimation {duration: 250 }
                    PropertyAnimation{ to: "img1.jpg"; duration: 8000; easing.type: Easing.InOutQuad}
                    PropertyAnimation {duration: 250 }
                }
            }
        }
    }
    Rectangle{
        id: colorEnd
        y: 520
        width: 350
        height: 190
        color: "#EBECF0"
        opacity: 0.7
        anchors.left: parent.left
        anchors.leftMargin: 5
        Rectangle{
            id: r
            width: parent.width - 30
            height: parent.height - 15
            anchors.bottom: parent.bottom
            opacity: 0.7
            color: backgroundColor

        }
        Canvas{
            id:c1
            contextType: "2d"
            anchors.top: parent.top
            width: colorEnd.width
            height: 15
            onPaint: {
                context.fillStyle = "#d0d7d9"
                context.moveTo(0,height)
                context.lineTo(30, 0)
                context.lineTo(width, 0)
                context.lineTo(width -30, height)
                //context.closePath()
                context.fill()
            }

        }
        Canvas{
            id:c2
            contextType: "2d"
            anchors.right: parent.right
            width: 30
            height: colorEnd.height
            onPaint: {
                context.fillStyle = "#d0d7d9"
                context.moveTo(0, 15)
                context.lineTo(30, 0)
                context.lineTo(30, height - 15)
                context.lineTo(0, height)
                context.closePath()
                context.fill()
            }

        }
        SequentialAnimation on width {
            running: true
            loops: Animation.Infinite
            NumberAnimation{from: 350; to: 500; duration: 8000; easing.type: Easing.InOutQuad}
            PauseAnimation {duration: 250 }
        }
    }
    Rectangle {
        id: rect
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 2
        anchors.bottomMargin: 35
        anchors.rightMargin: 15
        anchors.leftMargin: 15
    }
    RowLayout{
        height: 40
        anchors.top: rect.bottom
        anchors.right: parent.right
        width: parent.width
        Label{
            id: kea
            font.family: signature.name
            Layout.leftMargin: 15
            text: "\u00A9" + " Kea Robotics, All rights reserved"
            font.weight: Font.DemiBold
            font.bold: false
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            font.pixelSize: 30
        }
    }

    Timer{
        interval: 100; running: true; repeat: true
        onTriggered: {time.setTime()}
    }


    //Component.onCompleted: console.log(Qt.fontFamilies())
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:750;width:1350}
}
##^##*/




