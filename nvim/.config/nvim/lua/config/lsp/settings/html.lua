return {
	cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "javascript", "javascriptreact", "javascript.jsx" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    }
  },
  settings = {},
  single_file_support = true
}
