pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "../theme"

Window {
  id: root

  property string searchText: ""

  width: Math.min(800, Screen.width * 0.5)
  height: Math.min(600, Screen.height * 0.5)
  x: (Screen.width - width) / 2
  y: (Screen.height - height) / 2

  flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint
  color: Theme.bg0_h
  visible: false

  GlobalShortcut {
    name: "toggle-launcher"
    onPressed: root.toggle()
  }

  function reset() {
    searchField.text = ""
    root.searchText = ""
  }

  function toggle() {
    root.visible = !root.visible
    if (root.visible) {
      searchField.forceActiveFocus()
      root.reset()
    }
  }

  ScriptModel {
    id: filtered
    values: {
      var all = DesktopEntries.applications.values
      if (root.searchText === "") return all
      var q = root.searchText.toLowerCase()
      return all.filter(function(e) {
        return e.name && e.name.toLowerCase().includes(q)
      })
    }
  }

  ColumnLayout {
    anchors.fill: parent
    anchors.margins: 16
    spacing: 12

    Rectangle {
      Layout.fillWidth: true
      height: 48
      color: Theme.bg1
      radius: 10

      TextInput {
        id: searchField
        anchors.fill: parent
        anchors.margins: 12
        color: Theme.fg
        font { family: Theme.fontFamily; pixelSize: Theme.fontSize - 2; weight: Theme.weight }
        focus: true
        Keys.onPressed: event => {
          switch (event.key) {
            case Qt.Key_Escape:
              root.visible = false
              root.reset()
              event.accepted = true
              break
            case Qt.Key_Down:
              appListView.incrementCurrentIndex()
              event.accepted = true
              break
            case Qt.Key_Up:
              appListView.decrementCurrentIndex()
              event.accepted = true
              break
            case Qt.Key_N:
              if (event.modifiers & Qt.ControlModifier) {
                appListView.incrementCurrentIndex()
                event.accepted = true
              }
              break
            case Qt.Key_P:
              if (event.modifiers & Qt.ControlModifier) {
                appListView.decrementCurrentIndex()
                event.accepted = true
              }
              break
            case Qt.Key_Return:
            case Qt.Key_Enter:
              if (appListView.currentItem) {
                appListView.currentItem.clicked()
              }
              event.accepted = true
              break
          }
        }
        onTextChanged: {
          root.searchText = text
          Qt.callLater(function() {
            appListView.currentIndex = filtered.values.length > 0 ? 0 : -1
          })
        }
      }

      Text {
        anchors.fill: parent
        anchors.margins: 12
        color: Theme.gray2
        // opacity: 0.4
        font { family: Theme.fontFamily; pixelSize: Theme.fontSize - 2; weight: Theme.weight }
        text: "Search Apps..."
        visible: searchField.text.length === 0
      }
    }

    ListView {
      id: appListView
      Layout.fillWidth: true
      Layout.fillHeight: true
      clip: true
      spacing: 4
      model: filtered
      currentIndex: -1
      keyNavigationWraps: true
      delegate: Rectangle {
        id: delegateRoot
        required property var modelData
        required property int index

        width: appListView.width
        height: 44
        color: appListView.currentIndex === index
          ? Theme.green2
          : mouseArea.containsMouse ? Theme.bg0_h: "transparent"
        radius: 8

        function clicked() {
          root.launchApp(modelData)
        }

        Text {
          text: modelData.name
          color: appListView.currentIndex === index ? Theme.bg0_h : Theme.fg
          font { family: Theme.fontFamily; pixelSize: Theme.fontSize - 4; weight: Theme.weight }
          anchors.verticalCenter: parent.verticalCenter
          anchors.left: parent.left
          anchors.leftMargin: 12
          elide: Text.ElideRight
        }

        MouseArea {
          id: mouseArea
          anchors.fill: parent
          hoverEnabled: true
          onClicked: {
            appListView.currentIndex = index
            root.launchApp(modelData)
          }
        }
      }
    }
  }

  function launchApp(entry) {
    if (!entry) return
    entry.execute()
    root.visible = false
    root.reset()
  }
}
