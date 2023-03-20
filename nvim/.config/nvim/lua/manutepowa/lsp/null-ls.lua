local null_ls = require "null-ls"
-- local laravel_actions = require("laravel.code-actions")

null_ls.setup {
  sources = {
    -- null_ls.builtins.code_actions.gitsigns,
    -- null_ls.builtins.formatting.jq,
    -- null_ls.builtins.code_actions.refactoring,
    -- null_ls.builtins.formatting.alejandra,
    -- null_ls.builtins.diagnostics.luacheck,
    -- null_ls.builtins.formatting.stylua,
    --
    -- php_actions.getter_setter,
    -- php_actions.file_creator,
    --
    -- null_ls.builtins.diagnostics.phpstan.with {
    --   to_temp_file = false,
    --   method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
    --   command = "./vendor/bin/phpstan",
    --   condition = function()
    --     return vim.fn.findfile("vendor/bin/phpstan") ~= ""
    --   end
    -- },
    null_ls.builtins.diagnostics.php,
    null_ls.builtins.diagnostics.phpcs.with {
      diagnostics_format = '#{m} (#{c}) [#{s}]',
      method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      -- condition = function(utils)
      --   print(utils.root_has_file "phpcs.xml")
      --   return utils.root_has_file "phpcs.xml"
      -- end,
    },
    null_ls.builtins.formatting.phpcbf
  },
}
