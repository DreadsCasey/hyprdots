import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import SddmComponents 2.0

Item {
    id: clock
    property color color: "white"
    property alias timeFont: timeLabel.font
    property alias dateFont: dateLabel.font

    implicitWidth: clockLayout.implicitWidth
    implicitHeight: clockLayout.implicitHeight

    ColumnLayout {
        id: clockLayout
        spacing: 8

        Label {
            id: timeLabel
            color: clock.color
            font.pointSize: 36
            text: Qt.formatTime(new Date(), "hh:mm")
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            id: dateLabel
            color: clock.color
            font.pointSize: 18
            text: {
                var now = new Date()
                return Qt.formatDateTime(now, "dddd, d MMMM yyyy")
            }
            Layout.alignment: Qt.AlignHCenter
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            var now = new Date()
            timeLabel.text = Qt.formatTime(now, "hh:mm")
            dateLabel.text = Qt.formatDateTime(now, "dddd, d MMMM yyyy")
        }
    }

    anchors {
        topMargin: parent.height * 0.12
        top: parent.top
    }
    
    Component.onCompleted: {
        switch (config.ClockPosition) {
            case "left":
                clock.anchors.left = parent.left
                break
            case "right":
                clock.anchors.right = parent.right
                break
            case "center":
                clock.anchors.horizontalCenter = parent.horizontalCenter
                break
            default:
                console.warn("Unsupported clock position:", config.ClockPosition)
        }
    }
}