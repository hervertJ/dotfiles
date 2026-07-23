import Quickshell
import QtQuick
import "../theme"

Text {
  color: Theme.color1
  text: Qt.formatDateTime(clock.date, "ddd, MMM dd - HH:mm")

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
