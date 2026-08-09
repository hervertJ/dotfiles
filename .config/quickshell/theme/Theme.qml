pragma Singleton
import QtQuick

QtObject {
  // ---- Paleta base ----
  property color bg: "#282828"
  property color red1: "#cc241d"
  property color green1: "#98971a"
  property color yellow1: "#d79921"
  property color blue1: "#458588"
  property color purple1: "#b16286"
  property color aqua1: "#689d6a"
  property color gray1: "#a89984"

  property color gray2: "#928374"
  property color red2: "#fb4934"
  property color green2: "#b8bb26"
  property color yellow2: "#fabd2f"
  property color blue2: "#83a598"
  property color purple2: "#d3869b"
  property color aqua2: "#8ec07c"
  property color fg: "#ebdbb2"

  property color bg0_h: "#1d2021"
  property color bg0: "#282828"
  property color bg1: "#3c3836"
  property color bg2: "#504945"
  property color bg3: "#665c54"
  property color bg4: "#7c6f64"
  //property color gray: "#928374"
  property color orange1: "#d65d0e"

  property color bg0_s: "#32302f"
  property color fg4: "#a89984"
  property color fg3: "#bdae93"
  property color fg2: "#d5c4a1"
  property color fg1: "#ebdbb2"
  property color fg0: "#fbf1c7"
  property color orange2: "#fe8019"

  // ---- Métricas ----
  property string fontFamily: "ia WriterMono S"
  property int fontSize: 18
  property int weight: 750

  property int radius: 16
  property int radiusSmall: 18
  property int spacing: 10
  //property string iconFontFamily: "JetBrainsMono Nerd Font"

  // ---- Animación ----
  property int animationDuration: 220
  property int animationEasing: Easing.OutCubic
}
