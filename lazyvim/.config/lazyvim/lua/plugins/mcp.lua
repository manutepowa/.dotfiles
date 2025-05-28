return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
  },
  -- uncomment the following line to load hub lazily
  --cmd = "MCPHub",  -- lazy load
  build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
  -- uncomment this if you don't want mcp-hub to be available globally or can't use -g
  -- build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
  config = function()
    require("mcphub").setup({
      extensions = {
        avante = {
          make_slash_commands = true, -- Enable slash commands for MCP server prompts
        },
        codecompanion = {
          show_result_in_chat = true, -- Show the mcp tool result in the chat buffer
          make_vars = true, -- make chat #variables from MCP server resources
          make_slash_commands = true, -- make /slash commands from MCP server prompts
        },
      },
      auto_approve = true, -- Automatically approve suggestions
    })
  end,
}
