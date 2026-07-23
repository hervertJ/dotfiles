import Quickshell.Services.UPower
import QtQuick
import "../theme"

Item {
  id: root
  implicitWidth: batteryText.implicitWidth
  implicitHeight: batteryText.implicitHeight

  property var battery: UPower.displayDevice
  property bool charging: battery.state === UPowerDeviceState.Charging
  readonly property int level: Math.round(battery.percentage * 100)

  Text {
    id: batteryText
    text: "bat: " + root.level + "%"
    color: Theme.color2

    font {
      family: Theme.fontFamily
      pixelSize: Theme.fontSize
      weight: Theme.weight
    }
  }
}
