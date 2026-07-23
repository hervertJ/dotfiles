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

    id: root
    anchors { top: true; left: true; right: true }
    implicitHeight: 40
    color: Theme.background

    RowLayout {
      anchors.leftMargin: 20
      anchors.rightMargin: 20
      anchors.fill: parent
      spacing: 20

      Workspaces {}

      Item{ Layout.fillWidth: true }

      //CpuModule {}
      MemoryModule {}
      VolumeModule {}
      BatteryModule {}
      ClockModule {}
    }
  }
}
