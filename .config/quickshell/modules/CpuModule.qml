import QtQuick
import "../services"
import "../theme"

Item {
  implicitWidth: cpuText.implicitWidth
  implicitHeight: cpuText.implicitHeight

  Text {
    id: cpuText
    text: "cpu: " + Services.cpu.cpuUsage + "%"
    color: Theme.color5

    font {
      family: Theme.fontFamily
      pixelSize: Theme.fontSize
      weight: Theme.weight
    }
  }
}
