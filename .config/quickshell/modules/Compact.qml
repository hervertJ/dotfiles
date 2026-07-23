import Quickshell
import QtQuick
import QtQuick.Layouts
import "../modules"
import "../theme"

Variants {
  model: Quickshell.screens

  PanelWindow {
    property var modelData
    screen: modelData

    implicitHeight: 30
    implicitWidth: bar.implicitWidth + 40
    anchors { top: true }
    margins { top: 10 }
    color: Theme.background

    RowLayout {
      id: bar
      anchors.centerIn: parent

      Text {
        color: Theme.color1
        text: Qt.formatDateTime(clock.date, "HH:mm AP")

        font {
          family: Theme.fontFamily
          pixelSize: Theme.fontSize
          letterSpacing: 0
          weight: Theme.weight
        }

        SystemClock {
          id: clock
          precision: SystemClock.Minutes
        }
      }
    }
  }
}
