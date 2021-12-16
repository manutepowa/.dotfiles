return {
	cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html", "javascript", "javascriptreact" },
    init_options = {
      configurationSection = { "html", "css", "javascript", "javascriptreact" },
      embeddedLanguages = {
        css = true,
        javascript = true
      }
    },
    settings = {},
    single_file_support = true
}
