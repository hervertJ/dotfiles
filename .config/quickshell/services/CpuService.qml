import QtQuick
import Quickshell.Io

Item {
  id: root

  property int cpuUsage: 0
  property int lastCpuIdle: 0
  property int lastCpuTotal: 0

  function update() {
    cpuProc.running = true
  }

  Process {
    id: cpuProc
    command: ["sh", "-c", "head -1 /proc/stat"]


    stdout: SplitParser {
      onRead: data => {
        if (!data) return
        const p = data.trim().split(/\s+/)
        const idle = parseInt(p[4]) + parseInt(p[5])
        const total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)

        if (root.lastCpuTotal > 0) {
          root.cpuUsage = Math.round(
            100 * (1 - (idle - root.lastCpuIdle) / (total - root.lastCpuTotal))
          )
        }

        root.lastCpuIdle = idle
        root.lastCpuTotal = total
      }
    }
    Component.onCompleted: running = true
  }
}

