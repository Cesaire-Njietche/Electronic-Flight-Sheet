import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12
import Qt.labs.calendar 1.0
import QtQuick.Controls.Material 2.2

Popup {
    id: datePickerRoot
    closePolicy: Popup.CloseOnPressOutside
    property date selectedDate: new Date()
    property color textOnPrimary: "#854596"
    property int displayMonth: selectedDate.getMonth()
    property int displayYear: selectedDate.getFullYear()
    property int calendarWidth: 200
    property int calendarHeight: 300
    property color primaryColor: "#F1F8E9"
    property color primaryDarkColor: "#558B2F"
    property color secondaryDarkColor: "#21a3b3"
    property color secondaryColor: "#e1f8fd"
    property color secondaryColor2: "#45c2e8"
    property color backgroundColor: "#d9dbdb"
    property color buttonPressedColor: "#b5edf9"
    property alias datePickerRoot: datePickerRoot
    property alias monthGrid: monthGrid


    signal getDate(variant date)

    background: Rectangle {
        color:backgroundColor
        radius: 4
    }

    padding: 10

    GridLayout {
        id: calendarGrid
        // column 0 only visible if Landscape
        columns: 3
        // row 0 only visible if Portrait
        rows: 5
        Layout.fillHeight: true
        Layout.fillWidth: true

        Pane {
            id: portraitHeader
            //Layout.rightMargin: 5
            Layout.leftMargin: 5

            padding: 0
            Layout.columnSpan: 2
            Layout.column: 1
            Layout.row: 0
            Layout.fillWidth: true
            Layout.fillHeight: false
            background: Rectangle {
                //Layout.fillWidth: true
                Layout.fillHeight: true
                color: secondaryDarkColor
            }
            ColumnLayout {
                anchors.verticalCenter: parent.verticalCenter
                spacing: 6
                Label {
                    topPadding: 12
                    leftPadding: 12
                    text: datePickerRoot.displayYear
                    font.pixelSize: 12
                    font.weight: Font.Black
                    font.bold: true
                    font.family: "Courier"
                    //color: textOnPrimary
                    opacity: 0.8
                }
                Label {
                    leftPadding: 12
                    bottomPadding: 12
                    text: Qt.formatDate(datePickerRoot.selectedDate, "ddd")+", "+Qt.formatDate(datePickerRoot.selectedDate, "d")+". "+Qt.formatDate(datePickerRoot.selectedDate, "MMM")
                    font.pixelSize: 25
                    font.weight: Font.Black
                    font.bold: true
                    font.family: "Courier"
                    //color: textOnPrimary
                }
            }
        }

        ColumnLayout {
            id: title
            //Layout.rightMargin: 5
            //Layout.leftMargin: 5
            Layout.columnSpan: 2
            Layout.column: 1
            Layout.row: 1
            Layout.fillWidth: true
            spacing: 6

            RowLayout {
                height: implicitHeight * 2
                //Layout.rightMargin: 5
                Layout.leftMargin: 5
                spacing: 6
                Button {
                    id: back
                    Layout.preferredHeight: 20
                    Layout.preferredWidth: 20
                    text: "<"
                    contentItem: Label {
                        text: back.text
                        font.pixelSize: 11
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.bold: true
                        font.weight: Font.Black
                        font.family: "Courier"
                    }
                    background: Rectangle {
                        id: bckg_back
                        radius: 2
                        color: secondaryColor
                    }
                    //textColor: Material.foreground
                    onClicked: {
                        if(datePickerRoot.displayMonth > 0) {
                            datePickerRoot.displayMonth --
                        } else {
                            datePickerRoot.displayMonth = 11
                            //datePickerRoot.displayYear --
                        }
                    }
                    onPressed: {
                        bckg_back.color = buttonPressedColor
                    }
                    onReleased: {
                        bckg_back.color = secondaryColor
                    }
                }
                Label {
                    width: 76
                    Layout.fillWidth: true
                    Layout.preferredWidth: 3
                    text: {
                        var Months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
                        return Months[monthGrid.month]
                    }
                    font.weight: Font.Bold
                    font.pixelSize: 11
                    font.bold: true
                    font.family: "Courier"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Button {
                    Layout.preferredHeight: 20
                    Layout.preferredWidth: 20
                    text: ">"
                    id: forward
                    contentItem: Label {
                        text: forward.text
                        font.pixelSize: 11
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.bold: true
                        font.weight: Font.Black
                        font.family: "Courier"
                    }
                    background: Rectangle {
                        id: bckg_forward
                        radius: 2
                        color: secondaryColor
                    }
                    //textColor: Material.foreground
                    onClicked: {
                        if(datePickerRoot.displayMonth < 11) {
                            datePickerRoot.displayMonth ++
                        } else {
                            datePickerRoot.displayMonth = 0
                            //datePickerRoot.displayYear ++
                        }
                    }
                    onPressed: {
                        bckg_forward.color = buttonPressedColor
                    }
                    onReleased: {
                        bckg_forward.color = secondaryColor
                    }
                }
                Button {
                    id: backY
                    Layout.preferredHeight: 20
                    Layout.preferredWidth: 20
                    text: "<"
                    contentItem: Label {
                        text: back.text
                        font.pixelSize: 11
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.bold: true
                        font.weight: Font.Black
                        font.family: "Courier"
                    }
                    background: Rectangle {
                        id: bckg_backY
                        radius: 2
                        color: secondaryColor
                    }
                    //textColor: Material.foreground
                    onClicked: {
                        datePickerRoot.displayYear --
                    }
                    onPressed: {
                        bckg_backY.color = buttonPressedColor
                    }
                    onReleased: {
                        bckg_backY.color = secondaryColor
                    }
                }
                Label {
                    Layout.fillWidth: true
                    Layout.preferredWidth: 3
                    text: monthGrid.year
                    font.weight: Font.Bold
                    font.pixelSize: 11
                    font.bold: true
                    font.family: "Courier"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Button {
                    Layout.preferredHeight: 20
                    Layout.preferredWidth: 20
                    text: ">"
                    id: forwardY
                    contentItem: Label {
                        text: forward.text
                        font.pixelSize: 11
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.bold: true
                        font.weight: Font.Black
                        font.family: "Courier"
                    }
                    background: Rectangle {
                        id: bckg_forwardY
                        radius: 2
                        color: secondaryColor
                    }
                    //textColor: Material.foreground
                    onClicked: {
                        datePickerRoot.displayYear ++
                    }
                    onPressed: {
                        bckg_forwardY.color = buttonPressedColor
                    }
                    onReleased: {
                        bckg_forwardY.color = secondaryColor
                    }
                }
            } // row layout title
        } // title column layout

        // TODO not working in dark theme
        DayOfWeekRow {
            id: dayOfWeekRow
            Layout.column: 2
            Layout.row: 2
            rightPadding: 10
            Layout.fillWidth: true
            font.bold: false
            delegate: Label {
                text: model.shortName
                font.pixelSize: 11
                font.family: "Courier"
                //font: dayOfWeekRow.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        } // day of weeks

        // TODO not working in dark theme
        /*WeekNumberColumn {
            id: weekNumbers
            Layout.column: 1
            Layout.row: 3
            Layout.fillHeight: true
            leftPadding: 24
            font.bold: false
            month: datePickerRoot.displayMonth
            year: datePickerRoot.displayYear
            delegate: Label {
                    text: model.weekNumber
                    font: weekNumbers.font
                    //font.bold: false
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
        } // WeekNumberColumn*/


        MonthGrid {
            id: monthGrid
            font.family: "Courier"
            wheelEnabled: true
            //Layout.rightMargin: 5
            //Layout.leftMargin: 5
            Layout.column: 2
            Layout.row: 3
            Layout.fillHeight: true
            Layout.fillWidth: true
            rightPadding: 10
            topPadding: 10

            month: datePickerRoot.displayMonth
            year: datePickerRoot.displayYear

            // ATTENTION: on Qt 5.9 clicked signal only if clicked with mouse
            // no event if tapped on a day
            // https://bugreports.qt.io/browse/QTBUG-61585
            // fixed in 5.9.2
            // so as a woraround I added a MouseArea for the delegate Label
            //            onClicked: {
            //                // Important: check the month to avoid clicking on days outside where opacity 0
            //                if(date.getMonth() == datePickerRoot.displayMonth) {
            //                    datePickerRoot.selectedDate = date
            //                    console.log("tapped on a date ")
            //                } else {
            //                    console.log("outside valid month "+date.getMonth())
            //                }
            //            }

            delegate: Label {
                id: dayLabel
                readonly property bool selected: model.day === datePickerRoot.selectedDate.getDate()
                                                 && model.month === datePickerRoot.selectedDate.getMonth()
                                                 && model.year === datePickerRoot.selectedDate.getFullYear()
                text: model.day
                font.pixelSize: 9
                font.family: "Courier"
                font.bold: model.today? true: false
                opacity: model.month === monthGrid.month ? 1 : 0
                color: pressed || selected ? textOnPrimary : model.today ? Material.accent : Material.foreground
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                background: Rectangle {
                    anchors.centerIn: parent
                    width: Math.min(parent.width, parent.height) * 1.2
                    height: width
                    radius: width / 2
                    color: secondaryDarkColor
                    visible: pressed || parent.selected
                }
                // WORKAROUND !! see onClicked()
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        //console.log("mouse as click")
                        // Important: check the month to avoid clicking on days outside where opacity 0
                        if(date.getMonth() == datePickerRoot.displayMonth) {
                            datePickerRoot.selectedDate = date
                            //getDate(date)
                            //console.log("tapped on a date ")
                        } else {
                            //console.log("outside valid month "+date.getMonth())
                        }
                    }
                    onDoubleClicked: {
                        if(date.getMonth() == datePickerRoot.displayMonth) {
                            datePickerRoot.selectedDate = date
                            getDate(date)
                            datePickerRoot.close()
                            //console.log("tapped on a date ")
                        } else {
                            //console.log("outside valid month "+date.getMonth())
                        }
                    }
                } // mouse
            } // label in month grid
        } // month grid
        RowLayout {
            Layout.bottomMargin: 5
            spacing: 20
            Layout.column: 2
            Layout.row: 4
            id: footer
            Layout.fillWidth: true
            //Layout.rightMargin: 5
            //Layout.leftMargin: 5
            Button {
                Layout.fillWidth: true
                Layout.preferredWidth: 3
                text: qsTr("Set")
                id: setDate
                contentItem: Label {
                    text: setDate.text
                    font.pixelSize: 11
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_setDate
                    radius: 2
                    color: secondaryColor
                }
                onClicked: {
                    getDate(selectedDate)
                    datePickerRoot.close()
                }
                onPressed: {
                    bckg_setDate.color = buttonPressedColor
                }
                onReleased: {
                    bckg_setDate.color = secondaryColor
                }

            } // cancel button
            Button {
                Layout.fillWidth: true
                Layout.preferredWidth: 3
                text: qsTr("Cancel")
                id: cancelDate
                contentItem: Label {
                    text: cancelDate.text
                    font.pixelSize: 11
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.weight: Font.Black
                    font.family: "Courier"
                }
                background: Rectangle {
                    id: bckg_cancelDate
                    radius: 2
                    color: secondaryColor
                }
                //textColor: primaryColor
                onClicked: {
                    datePickerRoot.close()
                }
                onPressed: {
                    bckg_cancelDate.color = buttonPressedColor
                }
                onReleased: {
                    bckg_cancelDate.color = secondaryColor
                }
            } // cancel button
        }
    } // grid layout
    Component.onCompleted: {
        getDate(selectedDate)
    }
} // popup calendar
/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
