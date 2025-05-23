import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "Components"
Item {
  id: root
  height: Screen.height
  width: Screen.width
  Rectangle {
    id: background
    anchors.fill: parent
    height: parent.height
    width: parent.width
    z: 0
    color: config.bgDefault
  }
  Image {
    id: backgroundImage
    anchors.fill: parent
    height: parent.height
    width: parent.width
    fillMode: Image.PreserveAspectCrop
    visible: config.CustomBackground == "true" ? true : false
    z: 1
    source: config.Background
    asynchronous: false
    cache: true
    mipmap: true
    clip: true
  }
  Item {
    id: mainPanel
    z: 3
    anchors {
      fill: parent
      leftMargin: Screen.width * 0.02
      rightMargin: Screen.width * 0.02
      bottomMargin: Screen.height * 0.02
    }
    Clock {
      id: time
      visible: config.ClockEnabled == "true" ? true : false
      color: config.textDefault
      timeFont.family: config.Font
      dateFont.family: config.Font
    }
    LoginPanel {
      id: loginPanel
      anchors.fill: parent
    }
  }
}