import QtQuick 2.12
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

Popup {
    width: 420
    height: 300
    property alias ss_id: ss_id
    property alias cancelSS: cancelSS
    property alias setSS: setSS
    property alias ss_simType: ss_simType
    property alias ss_acftType: ss_acftType
    property alias ss_tCenter: ss_tCenter
    property alias ss_date: ss_date
    id: ss
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
            text: qsTr("NEW SIM SESSION")
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
                id: ss_date
                font.bold: true
                font.pixelSize: 11
                font.weight: Font.Normal
                font.family: "Courier"
                placeholderText: "DD/MM/YEAR"
                anchors.leftMargin: 5
                //Layout.fillHeight: true
                Layout.preferredHeight: 30
                Layout.preferredWidth: 215
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
                    dateDialog.x =  ss_date.x - ss_date.width
                    dateDialog.y =  ss_date.y + ss_date.height
                }
                /*dateDialog.onGetDate:{
                    ss_date.text = Qt.formatDate(date, "dd/MM/yyyy")
                }*/
            }
        }
        RowLayout{
            width: 350
            Label{
                text: qsTr("TRAINING CENTER")
                font.bold: true
                font.pixelSize: 11
                font.family: "Courier"
                Layout.fillWidth: true
            }
            ComboBox{
                delegate: ItemDelegate {
                    width: ss_tCenter.width
                    contentItem: Text {
                        text: model.center
                        font.pixelSize: 11
                        font.family: "Courier"
                        elide: Text.ElideRight
                        verticalAlignment: Text.AlignVCenter

                    }
                    highlighted: ss_tCenter.highlightedIndex === index
                }
                indicator: Canvas {
                    id: canvas
                    x: ss_tCenter.width - width - ss_tCenter.rightPadding
                    y: ss_tCenter.topPadding + (ss_tCenter.availableHeight - height) / 2
                    width: 12
                    height: 8
                    contextType: "2d"

                    Connections {
                        target: ss_tCenter
                        function onPressedChanged() { canvas.requestPaint(); }
                    }

                    onPaint: {
                        var ctxt = canvas.getContext("2d")
                        ctxt.reset();
                        ctxt.moveTo(0, 0);
                        ctxt.lineTo(width, 0);
                        ctxt.lineTo(width / 2, height);
                        ctxt.closePath();
                        ctxt.fillStyle = ss_tCenter.pressed ? secondaryDarkColor2 : secondaryColor2;
                        ctxt.fill();
                    }
                }

                contentItem: Text {
                    leftPadding: 0
                    rightPadding: ss_tCenter.indicator.width + ss_tCenter.spacing

                    text: ss_tCenter.displayText
                    font: ss_tCenter.font
                    //color: control.pressed ? "#17a81a" : "#21be2b"
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    horizontalAlignment: Text.AlignHCenter
                }

                background: Rectangle {
                    id: rect
                    border.color: ss_tCenter.pressed ? secondaryDarkColor2 : secondaryColor2
                    border.width: ss_tCenter.visualFocus ? 2 : 1
                    radius: 2
                }
                id: ss_tCenter
                font.pixelSize: 11
                font.family: "Courier"
                font.weight: Font.Normal
                Layout.preferredHeight: 30
                Layout.preferredWidth: 250
                anchors.right: parent.right
                textRole: "center"
                model: SimSessionModel

                //Component.onCompleted: {TrainingModel.selectTitle(currentText)}
                //onCurrentIndexChanged: console.log(model.get(currentIndex).sim_type)

            }
        }
        RowLayout{
            Label{
                text: qsTr("AIRCRAFT TYPE")
                font.bold: true
                font.pixelSize: 11
                font.family: "Courier"
                Layout.fillWidth: true
            }
            TextField{
                id: ss_acftType
                font.pixelSize: 11
                font.family: "Courier"
                font.weight: Font.Normal
                Layout.preferredHeight: 30
                Layout.preferredWidth: 250
                text: ss_tCenter.model.get(ss_tCenter.currentIndex).aircraft
                anchors.right: parent.right
                background: Rectangle {
                    //color: "transparent"
                    border.color: secondaryColor2
                }
            }
        }
        RowLayout{
            Label{
                text: qsTr("SIMULATOR TYPE")
                font.bold: true
                font.pixelSize: 11
                font.family: "Courier"
                Layout.fillWidth: true
            }
            TextField{
                id: ss_simType
                font.pixelSize: 11
                font.family: "Courier"
                font.weight: Font.Normal
                Layout.preferredHeight: 30
                Layout.preferredWidth: 250
                text: ss_tCenter.model.get(ss_tCenter.currentIndex).sim_type
                anchors.right: parent.right
                background: Rectangle {
                    //color: "transparent"
                    border.color: secondaryColor2
                }
            }
        }
        Label{
            id: ss_id
            font.bold: true
            font.pixelSize: 0
            visible: false
            text: ss_tCenter.model.get(ss_tCenter.currentIndex).ID_Sim_Info
            Layout.fillWidth: true

        }
        RowLayout {
            spacing: 20
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            Button {
                id: setSS
                Layout.preferredWidth: 80
                text: qsTr("Set")
                contentItem: Label {
                    text: setSS.text
                    font.pixelSize: 11
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_setSS
                    radius: 2
                    color: secondaryColor
                }
                onClicked: {
                    getDate(selectedDate)
                    datePickerRoot.close()
                }

                onPressed: {
                    bckg_setSS.color = buttonPressedColor
                }
                onReleased: {
                    bckg_setSS.color = secondaryColor
                }

            } // cancel button
            Button {
                Layout.preferredWidth: 80
                text: qsTr("Cancel")
                id: cancelSS
                contentItem: Label {
                    text: cancelSS.text
                    font.pixelSize: 11
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_cancelSS
                    radius: 2
                    color: secondaryColor
                }
                onClicked: {
                    ss.close()
                }
                onPressed: {
                    bckg_cancelSS.color = buttonPressedColor
                }
                onReleased: {
                    bckg_cancelSS.color = secondaryColor
                }
            } // cancel button
        }
    }

}


