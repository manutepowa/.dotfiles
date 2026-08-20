return {
  {
    "mistricky/codesnap.nvim",
    version = "*",
    cmd = {
      "CodeSnap",
      "CodeSnapSave",
      "CodeSnapASCII",
      "CodeSnapHighlight",
      "CodeSnapSaveHighlight",
    },
    keys = {
      { "<leader>cs", "<cmd>CodeSnap<cr>", mode = "v", desc = "Copy code snapshot" },
    },
    opts = {
      show_line_number = true,
      snapshot_config = {
        code_config = {
          breadcrumbs = {
            enable = true,
          },
        },
        watermark = {
          content = "@Manuel",
        },
      },
    },
  },
}
