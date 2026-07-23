pragma Singleton
import QtQuick

/*
 * Theme.qml
 * ---------
 * Singleton central de estilo. Ningún módulo debe usar colores "a fuego";
 * todos leen de aquí (Theme.xxx). Cambiar la paleta completa del shell
 * se reduce a editar este archivo (o, más adelante, a que este archivo
 * cargue un JSON/config externo y exponga las mismas propiedades).
 */
QtObject {
  // ---- Paleta base ----
  property color background: "#1d2021"
  property color background_alt_1: "#3c3836"
  property color background_alt_2: "#665c54"
  property color foreground: "#d5c4a1"
  property color url_color: "#bdae93"
  property color color0: "#1d2021"
  property color color1: "#fb4934"
  property color color2: "#b8bb26"
  property color color3: "#fabd2f"
  property color color4: "#83a598"
  property color color5: "#d3869b"
  property color color6: "#8ec07c"
  property color color7: "#d5c4a1"
  property color color8: "#665c54"
  property color color9: "#fe8019"
  property color color10: "#3c3836"
  property color color11: "#504945"
  property color color12: "#bdae93"
  property color color13: "#ebdbb2"
  property color color14: "#d65d0e"
  property color color15: "#fbf1c7"

  // ---- Métricas ----
  property string fontFamily: "ia WriterMono S"
  property int fontSize: 18
  property int weight: 750

  property int radius: 16
  property int radiusSmall: 18
  property int spacing: 10
  //property string iconFontFamily: "JetBrainsMono Nerd Font" // cambia si usas otra nerd font

  // ---- Animación ----
  property int animationDuration: 220
  property int animationEasing: Easing.OutCubic
}
