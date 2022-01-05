import QtQuick 2.12
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

Popup {
    width: 420
    height: 300
    property alias l_id: l_id
    property alias cancelL: cancelL
    property alias setL: setL
    property alias l_title: l_title
    property alias l_authority: l_authority
    property alias l_number: l_number
    property alias l_date: l_date
    id: l
    property color primaryColor: "#F1F8E9"
    property color primaryDarkColor: "#558B2F"
    property color secondaryDarkColor: "#21a3b3"
    property color secondaryDarkColor2: "#009bd7"
    property color secondaryColor21: "#45c2e8"
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
            text: qsTr("NEW LICENCE")
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
                id: l_date
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
                    dateDialog.x =  l_date.x - l_date.width
                    dateDialog.y =  l_date.y + l_date.height
                }
                /*dateDialog.onGetDate:{
                    l_date.text = Qt.formatDate(date, "dd/MM/yyyy")
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
                    width: l_title.width
                    contentItem: Text {
                        text: model.title
                        font.pixelSize: 11
                        font.family: "Courier"
                        elide: Text.ElideRight
                        verticalAlignment: Text.AlignVCenter

                    }
                    highlighted: l_title.highlightedIndex === index
                }
                indicator: Canvas {
                    id: canvas
                    x: l_title.width - width - l_title.rightPadding
                    y: l_title.topPadding + (l_title.availableHeight - height) / 2
                    width: 12
                    height: 8
                    contextType: "2d"

                    Connections {
                        target: l_title
                        function onPressedChanged() { canvas.requestPaint(); }
                    }

                    onPaint: {
                        var ctxt = canvas.getContext("2d")
                        ctxt.reset();
                        ctxt.moveTo(0, 0);
                        ctxt.lineTo(width, 0);
                        ctxt.lineTo(width / 2, height);
                        ctxt.closePath();
                        ctxt.fillStyle = l_title.pressed ? secondaryDarkColor2 : secondaryColor21;
                        ctxt.fill();
                    }
                }

                contentItem: Text {
                    leftPadding: 0
                    rightPadding: l_title.indicator.width + l_title.spacing

                    text: l_title.displayText
                    font: l_title.font
                    //color: control.pressed ? "#17a81a" : "#21be2b"
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    horizontalAlignment: Text.AlignHCenter
                }

                background: Rectangle {
                    id: rect
                    border.color: l_title.pressed ? secondaryDarkColor2 : secondaryColor21
                    border.width: l_title.visualFocus ? 2 : 1
                    radius: 2
                }
                id: l_title
                font.pixelSize: 11
                font.family: "Courier"
                font.weight: Font.Normal
                Layout.preferredHeight: 30
                Layout.preferredWidth: 300
                anchors.right: parent.right
                textRole: "title"
                model: LicenceModel

                //Component.onCompleted: {TrainingModel.selectTitle(currentText)}
                //onCurrentIndexChanged: console.log(model.get(currentIndex).title)

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
                id:l_authority
                font.pixelSize: 11
                font.family: "Courier"
                text: l_title.model.get(l_title.currentIndex).authority
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
                text: qsTr("NUMBER")
                font.bold: true
                font.pixelSize: 11
                font.family: "Courier"
                Layout.fillWidth: true
            }
            TextField{
                id: l_number
                font.pixelSize: 11
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
            id: l_id
            font.bold: true
            font.pixelSize: 0
            visible: false
            text: l_title.model.get(l_title.currentIndex).ID_Licence
            Layout.fillWidth: true

        }
        RowLayout {
            spacing: 20
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            Button {
                id: setL
                Layout.preferredWidth: 80
                text: qsTr("Set")
                contentItem: Label {
                    text: setL.text
                    font.pixelSize: 11
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_setL
                    radius: 2
                    color: secondaryColor
                }
                /*onClicked: {
                    getDate(selectedDate)
                    //datePickerRoot.close()
                }*/

                onPressed: {
                    bckg_setL.color = buttonPressedColor
                }
                onReleased: {
                    bckg_setL.color = secondaryColor
                }

            } // cancel button
            Button {
                Layout.preferredWidth: 80
                text: qsTr("Cancel")
                id: cancelL
                contentItem: Label {
                    text: cancelL.text
                    font.pixelSize: 11
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_cancelL
                    radius: 2
                    color: secondaryColor
                }
                onClicked: {
                    l.close()
                }
                onPressed: {
                    bckg_cancelL.color = buttonPressedColor
                }
                onReleased: {
                    bckg_cancelL.color = secondaryColor
                }
            } // cancel button
        }
    }

}


