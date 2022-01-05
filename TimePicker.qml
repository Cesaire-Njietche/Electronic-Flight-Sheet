import QtQuick 2.0

import QtQuick 2.12
import QtQuick.Window 2.2
import QtQuick.Controls 2.12

Rectangle {
    width: frame.implicitWidth
    height: frame.implicitHeight
    radius: 4
    property alias hoursTumbler: hoursTumbler
    property alias minutesTumbler: minutesTumbler
    //sproperty alias amPmTumbler: amPmTumbler

    function formatText(count, modelData) {
        var data = count === 12 ? modelData + 1 : modelData;
        return data.toString().length < 2 ? "0" + data : data;
    }

    FontMetrics {
        id: fontMetrics
    }

    Component {
        id: delegateComponent

        Label {
            text: formatText(Tumbler.tumbler.count, modelData)
            font.pixelSize: 11
            font.bold: true
            opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Courier"
        }
    }

    Frame {
        id: frame
        anchors.centerIn: parent
        focus: true
        background: Rectangle{
            radius: 4
        }

        Row {
            id: row

            Tumbler {
                id: hoursTumbler
                model: 12
                delegate: delegateComponent
                wheelEnabled: true
            }

            Tumbler {
                id: minutesTumbler
                model: 60
                delegate: delegateComponent
                wheelEnabled: true
            }

            /*Tumbler {
                id: amPmTumbler
                model: ["AM", "PM"]
                delegate: delegateComponent
                wheelEnabled: true
            }*/
        }

    }
    /*DropShadow {
        anchors.fill: frame
        radius: 9.0
        samples: 17
        color: "#808119d5"
        source: frame
    }*/
}
