import Quickshell.Services.Pipewire
import QtQuick
import "../theme"

Item {
  id: root
  implicitWidth: volumeText.implicitWidth
  implicitHeight: volumeText.implicitHeight

  property var sink: Pipewire.defaultAudioSink
  property bool muted: sink?.audio?.muted ?? false
  readonly property int level: Math.round((sink?.audio?.volume ?? 0) * 100)

  PwObjectTracker {
    objects: [ sink ]
  }

  Text {
    id: volumeText
    text: root.muted ? "mute" : "vol: " + root.level + "%"
    color: Theme.color3
    font {
      family: Theme.fontFamily
      pixelSize: Theme.fontSize
      weight: Theme.weight
    }
  }
}
