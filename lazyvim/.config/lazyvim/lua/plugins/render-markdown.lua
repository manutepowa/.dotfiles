return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    headings = {
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      backgrounds = {
        "RenderMarkdownH1Bg",
        "RenderMarkdownH2Bg",
        "RenderMarkdownH3Bg",
        "RenderMarkdownH4Bg",
        "RenderMarkdownH5Bg",
        "RenderMarkdownH6Bg",
      },
      foregrounds = {
        "RenderMarkdownH1",
        "RenderMarkdownH2",
        "RenderMarkdownH3",
        "RenderMarkdownH4",
        "RenderMarkdownH5",
        "RenderMarkdownH6",
      },
    },
    code = {
      sign = false,
      width = "block",
      right_pad = 1,
      left_pad = 1,
      language_pad = 1,
      border = "thin",
      above = "▄",
      below = "▀",
      highlight = "RenderMarkdownCode",
      highlight_inline = "RenderMarkdownCodeInline",
    },
    bullet = {
      icons = { "●", "○", "◆", "◇" },
      right_pad = 1,
      highlight = "RenderMarkdownBullet",
    },
    checkbox = {
      bullet = false,
      right_pad = 0, -- evita doble espaciado (ya pones un espacio dentro del icono)
      unchecked = { icon = "󰄱 ", highlight = "RenderMarkdownUnchecked" },
      checked = { icon = "󰱒 ", highlight = "RenderMarkdownChecked" },
      custom = {
        todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
        important = { raw = "[!]", rendered = "󰀦 ", highlight = "RenderMarkdownError" },
        progress = { raw = "[/]", rendered = "󰔟 ", highlight = "RenderMarkdownWarn" },
      },
    },
    callout = {
      note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
      tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
      important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
      warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
      caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
      abstract = { raw = "[!ABSTRACT]", rendered = "󰨸 Abstract", highlight = "RenderMarkdownInfo" },
      summary = { raw = "[!SUMMARY]", rendered = "󰨸 Summary", highlight = "RenderMarkdownInfo" },
      tldr = { raw = "[!TLDR]", rendered = "󰨸 Tldr", highlight = "RenderMarkdownInfo" },
      info = { raw = "[!INFO]", rendered = "󰋽 Info", highlight = "RenderMarkdownInfo" },
      todo = { raw = "[!TODO]", rendered = "󰗡 Todo", highlight = "RenderMarkdownInfo" },
      hint = { raw = "[!HINT]", rendered = "󰌶 Hint", highlight = "RenderMarkdownSuccess" },
      success = { raw = "[!SUCCESS]", rendered = "󰄬 Success", highlight = "RenderMarkdownSuccess" },
      check = { raw = "[!CHECK]", rendered = "󰄬 Check", highlight = "RenderMarkdownSuccess" },
      done = { raw = "[!DONE]", rendered = "󰄬 Done", highlight = "RenderMarkdownSuccess" },
      question = { raw = "[!QUESTION]", rendered = "󰘥 Question", highlight = "RenderMarkdownWarn" },
      failure = { raw = "[!FAILURE]", rendered = "󰅖 Failure", highlight = "RenderMarkdownError" },
      danger = { raw = "[!DANGER]", rendered = "󱐌 Danger", highlight = "RenderMarkdownError" },
      bug = { raw = "[!BUG]", rendered = "󰨰 Bug", highlight = "RenderMarkdownError" },
      example = { raw = "[!EXAMPLE]", rendered = "󰉹 Example", highlight = "RenderMarkdownHint" },
      quote = { raw = "[!QUOTE]", rendered = "󱆨 Quote", highlight = "RenderMarkdownQuote" },
    },
    pipe_table = {
      style = "full",
      cell = "padded",
      border = {
        "┌",
        "┬",
        "┐",
        "├",
        "┼",
        "┤",
        "└",
        "┴",
        "┘",
        "│",
        "─",
      },
      alignment_indicator = "━",
      head = "RenderMarkdownTableHead",
      row = "RenderMarkdownTableRow",
      filler = "RenderMarkdownTableFill",
    },
    link = {
      enabled = true,
      image = "󰥶 ",
      email = "󰀓 ",
      hyperlink = "󰌷 ",
      highlight = "RenderMarkdownLink",
      custom = {
        web = { pattern = "%.com", icon = "󰞉 ", highlight = "RenderMarkdownLink" },
        github = { pattern = "github%.com", icon = "󰊤 ", highlight = "RenderMarkdownLink" },
      },
    },
    sign = {
      enabled = false,
    },
    indent = {
      enabled = true,
      per_level = 2,
      skip_level = 1,
      skip_heading = true,
      icon = " ",
    },
    win_options = {
      conceallevel = {
        default = 0,
        rendered = 3,
      },
      concealcursor = {
        default = vim.o.concealcursor,
        rendered = "",
      },
    },
    completions = {
      lsp = {
        enabled = true,
      },
    },
  },
  ft = { "markdown", "Avante", "codecompanion", "copilot-chat", "opencode_output" },
  config = function(_, opts)
    require("render-markdown").setup(opts)

    -- Configurar colores personalizados para los títulos
    -- Colores de primer plano (texto)
    vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = "#feca57", bold = true }) -- Amarillo dorado
    vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = "#4ecdc4", bold = true }) -- Turquesa
    vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = "#96ceb4", bold = true }) -- Verde menta
    vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = "#45b7d1", bold = true }) -- Azul cielo
    vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = "#ff6b6b", bold = true }) -- Rojo coral
    vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = "#ff9ff3", bold = true }) -- Rosa

    -- Colores de fondo (opcionales, puedes comentarlos si prefieres solo texto coloreado)
    vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "#2d2b1b" }) -- Fondo amarillo oscuro
    vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "#1b2d2d" }) -- Fondo turquesa oscuro
    vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = "#1b2d23" }) -- Fondo verde oscuro
    vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = "#1b2a2d" }) -- Fondo azul oscuro
    vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = "#2d1b1b" }) -- Fondo rojo oscuro
    vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = "#2d1b2a" }) -- Fondo rosa oscuro
  end,
}
