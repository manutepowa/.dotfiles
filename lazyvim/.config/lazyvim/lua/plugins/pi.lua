return {
  {
    "akinsho/toggleterm.nvim",
    optional = true,
    keys = {
      {
        "<A-CR>",
        "<S-CR>",
        mode = "t",
        desc = "Same as Shift+Enter",
      },
      {
        "<A-.>",
        function()
          require("config.pi").toggle()
        end,
        mode = { "n", "t" },
        desc = "Toggle Pi Agent",
      },
      {
        "<leader>pa",
        function()
          require("config.pi").add_current_location()
        end,
        mode = "n",
        desc = "Add current location to Pi",
      },
      {
        "<leader>pa",
        function()
          require("config.pi").add_visual_location()
        end,
        mode = "x",
        desc = "Add selection location to Pi",
      },
    },
    init = function()
      vim.api.nvim_create_user_command("Pi", function()
        require("config.pi").toggle()
      end, { desc = "Toggle Pi Agent" })

      vim.api.nvim_create_user_command("PiAdd", function()
        require("config.pi").add_current_location()
      end, { desc = "Add current location to Pi" })
    end,
  },
}
