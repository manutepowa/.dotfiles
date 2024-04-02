return {
  settings = {
    phpactor = {
      enable = true,
      completion = {
        enable = true
      },
      diagnostics = {
        enable = false
      },
      -- "goto" = {
      --   implementation = "goto_definition",
      --   typeDefinition = "goto_type_definition"
      -- },
      hover = {
        enable = true
      },
      index = {
        references = true
      },
      rename = {
        enable = true
      },
      signatureHelp = {
        enable = true
      },
      workspaceSymbolProvider = true
    }
  }
}
