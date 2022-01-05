import QtQuick 2.12
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

Popup {
    width: 420
    height: 300
    property alias t_id: t_id
    property alias t_date: t_date
    property alias t_title: t_title
    property alias t_center: t_center
    property alias t_authority: t_authority
    property alias cancelT: cancelT
    property alias setT: setT
    id: t
    property color primaryColor: "#F1F8E9"
    property color primaryDarkColor: "#558B2F"
    property color secondaryDarkColor: "#21a3b3"
    property color secondaryDarkColor2: "#009bd7"
    property color secondaryColor: "#e1f8fd"
    property color secondaryColor2: "#45c2e8"
    property color backgroundColor: "#d9dbdb"
    property color buttonPressedColor: "#b5edf9"

    background: Rectangle {
        color:backgroundColor
        radius: 4
    }
    ColumnLayout{
        spacing: 5
        anchors.fill: parent
        anchors.margins: 5
        Label{
            text: qsTr("NEW TRAINING")
            font.weight: Font.ExtraBold
            font.bold: true
            font.pixelSize: 12
            font.family: "Courier"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top

        }
        RowLayout{
            Label{
                text: qsTr("DATE")
                font.bold: true
                font.pixelSize: 11
                font.family: "Courier"
                Layout.fillWidth: true

            }
            TextField {
                id: t_date
                font.bold: true
                font.pixelSize: 11
                font.weight: Font.Normal
                font.family: "Courier"
                placeholderText: "DD/MM/YEAR"
                anchors.leftMargin: 5
                //Layout.fillHeight: true
                Layout.preferredHeight: 30
                Layout.preferredWidth: 265
                enabled: false
                background: Rectangle {
                    color: "transparent"
                    border.color: secondaryColor2
                }
            }

            CalendarButton{
                onClicked: {
                    dateDialog.open()

                }
                Component.onCompleted: {
                    dateDialog.x =  t_date.x - t_date.width
                    dateDialog.y =  t_date.y + t_date.height
                }
                /*dateDialog.onGetDate:{
                    t_date.text = Qt.formatDate(date, "dd/MM/yyyy")
                }*/
            }
        }
        RowLayout{
            Label{
                text: qsTr("TITLE")
                font.bold: true
                font.pixelSize: 11
                font.family: "Courier"
                Layout.fillWidth: true

            }
            ComboBox{
                delegate: ItemDelegate {
                    width: t_title.width
                    contentItem: Text {
                        text: model.title
                        font.pixelSize: 11
                        font.family: "Courier"
                        elide: Text.ElideRight
                        verticalAlignment: Text.AlignVCenter

                    }
                    highlighted: t_title.highlightedIndex === index
                }
                indicator: Canvas {
                    id: canvas
                    x: t_title.width - width - t_title.rightPadding
                    y: t_title.topPadding + (t_title.availableHeight - height) / 2
                    width: 12
                    height: 8
                    contextType: "2d"

                    Connections {
                        target: t_title
                        function onPressedChanged() { canvas.requestPaint(); }
                    }

                    onPaint: {
                        var ctxt = canvas.getContext("2d")
                        ctxt.reset();
                        ctxt.moveTo(0, 0);
                        ctxt.lineTo(width, 0);
                        ctxt.lineTo(width / 2, height);
                        ctxt.closePath();
                        ctxt.fillStyle = t_title.pressed ? secondaryDarkColor2 : secondaryColor2;
                        ctxt.fill();
                    }
                }

                contentItem: Text {
                    leftPadding: 0
                    rightPadding: t_title.indicator.width + t_title.spacing

                    text: t_title.displayText
                    font: t_title.font
                    //color: control.pressed ? "#17a81a" : "#21be2b"
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    horizontalAlignment: Text.AlignHCenter
                }

                background: Rectangle {
                    id: rect
                    border.color: t_title.pressed ? secondaryDarkColor2 : secondaryColor2
                    border.width: t_title.visualFocus ? 2 : 1
                    radius: 2
                }
                id: t_title
                font.pixelSize: 11
                font.family: "Courier"
                font.weight: Font.Normal
                Layout.preferredHeight: 30
                Layout.preferredWidth: 300
                anchors.right: parent.right
                textRole: "title"
                model: TrainingModel

                //Component.onCompleted: {TrainingModel.selectTitle(currentText)}
                //onCurrentIndexChanged: console.log(model.get(currentIndex).title)

            }
        }
        RowLayout{
            width: 350
            Label{
                text: qsTr("CENTER")
                font.bold: true
                font.pixelSize: 11
                font.family: "Courier"
                Layout.fillWidth: true
            }
            TextField{
                id:t_center
                font.pixelSize: 11
                font.family: "Courier"
                text: t_title.model.get(t_title.currentIndex).center
                font.weight: Font.Normal
                Layout.preferredHeight: 30
                Layout.preferredWidth: 300
                anchors.right: parent.right
                background: Rectangle {
                    //color: "transparent"
                    border.color: secondaryColor2
                }
            }
        }
        RowLayout{
            Label{
                text: qsTr("AUTHORITY")
                font.bold: true
                font.pixelSize: 11
                font.family: "Courier"
                Layout.fillWidth: true
            }
            TextField{
                id: t_authority
                font.pixelSize: 11
                text: t_title.model.get(t_title.currentIndex).authority
                font.family: "Courier"
                font.weight: Font.Normal
                Layout.preferredHeight: 30
                Layout.preferredWidth: 300
                anchors.right: parent.right
                background: Rectangle {
                    //color: "transparent"
                    border.color: secondaryColor2
                }
            }
        }
        Label{
            id: t_id
            font.bold: true
            font.pixelSize: 0
            visible: false
            text: t_title.model.get(t_title.currentIndex).ID_Training
            Layout.fillWidth: true

        }
        RowLayout {
            spacing: 20
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            Button {
                id: setT
                Layout.preferredWidth: 80
                text: qsTr("Set")
                contentItem: Label {
                    text: setT.text
                    font.pixelSize: 11
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_setT
                    radius: 2
                    color: secondaryColor
                }
                /*onClicked: {
                    getDate(selectedDate)
                    datePickerRoot.close()
                }*/

                onPressed: {
                    bckg_setT.color = buttonPressedColor
                }
                onReleased: {
                    bckg_setT.color = secondaryColor
                }

            } // cancel button
            Button {
                Layout.preferredWidth: 80
                text: qsTr("Cancel")
                id: cancelT
                contentItem: Label {
                    text: cancelT.text
                    font.pixelSize: 11
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_cancelT
                    radius: 2
                    color: secondaryColor
                }
                onClicked: {
                    t.close()
                }
                onPressed: {
                    bckg_cancelT.color = buttonPressedColor
                }
                onReleased: {
                    bckg_cancelT.color = secondaryColor
                }
            } // cancel button
        }
    }
    //Component.onCompleted: TrainingModel.unSelect()

}


