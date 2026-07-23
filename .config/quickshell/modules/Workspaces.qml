import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "../theme"

RowLayout {
  spacing: 18

  Repeater {
    model: 9

    Text {
      property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
      property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

      text: index + 1
      color: isActive ? Theme.color2 : (ws ? Theme.background_alt_2 : Theme.background_alt_2)

      font {
        family: Theme.fontFamily
        pixelSize: Theme.fontSize
        weight: Theme.weight
      }

      MouseArea {
        anchors.fill: parent
        onClicked: Hyprland.dispatch("hl.dsp.focus({ workspace = " + (parent.index + 1) + " })")
      }
    }
  }
}
