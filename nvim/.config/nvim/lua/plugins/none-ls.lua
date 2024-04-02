return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require("null-ls")
    local localArgs = {
      "--config",
      os.getenv("HOME") .. "/.config/nvim/phpcsfixer.php",
    }
    opts.sources = vim.list_extend(opts.sources or {}, {
      null_ls.builtins.formatting.phpcsfixer
    })
    return opts
  end,
}
