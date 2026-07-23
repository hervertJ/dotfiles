pragma Singleton
import QtQuick

QtObject {
  readonly property CpuService cpu: CpuService {}
  readonly property MemoryService memory: MemoryService {}

  property Timer timer: Timer {
    interval: 2000
    running: true
    repeat: true

    onTriggered: {
      cpu.update()
      memory.update()
    }
  }
}
