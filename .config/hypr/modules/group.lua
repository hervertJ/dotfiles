hl.config({
  group = {
    -- Color del borde de la ventana cuando está agrupada
    col = {
      border_active = "0xff33ccff",
      border_inactive = "0xff222222",
    },

    groupbar = {
      enabled = true,                          -- Activa la barra de pestañas arriba
      font_family = "IosevkaTerm Nerd Font",
      font_size = 0,
      gradients = true,                        -- Mejor para el look minimalista que buscas
      height = 5,
      indicator_gap = 0,
      indicator_height = 0,

      render_titles = true,                    -- Muestra el nombre de la ventana/proceso
      scrolling = true,                        -- Cambia entre pestañas con la rueda del ratón

      gaps_in = 0,
      gaps_out = 0,

      col = {
        -- active = "rgb(b8bb26)",
        active = "rgb(9399B2)",
        inactive = "rgb(181616)",

        locked_active = "rgb(9399B2)",
        locked_inactive = "rgb(181616)",
      },
    },
  },
})
