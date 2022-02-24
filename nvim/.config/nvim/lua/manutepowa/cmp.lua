-- Setup nvim-cmp.
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

if not luasnip then
  return
end

-- html snippets in javascript and javascriptreact
luasnip.snippets = {
  html = {}
}
luasnip.snippets.javascript = luasnip.snippets.html
luasnip.snippets.typescript = luasnip.snippets.html
luasnip.snippets.javascriptreact = luasnip.snippets.html
luasnip.snippets.typescriptreact = luasnip.snippets.html

require("luasnip/loaders/from_vscode").load({include = {"html"}})
require("luasnip/loaders/from_vscode").lazy_load()

-- local check_backspace = function()
-- 	local col = vim.fn.col(".") - 1
-- 	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
-- end
local lspkind = require "lspkind"
-- lspkind.init {
--   mode = "symbol",
--   symbol_map = {
--     Text = "",
--     Method = "ƒ",
--     Function = "ﬦ",
--     Constructor = "",
--     Variable = "",
--     Class = "",
--     Interface = "ﰮ",
--     Module = "",
--     Property = "",
--     Unit = "",
--     Value = "",
--     Enum = "了",
--     Keyword = "",
--     Snippet = "﬌",
--     Color = "",
--     File = "",
--     Folder = "",
--     EnumMember = "",
--     Constant = "",
--     Struct = "",
--   },
-- }
--

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		["<A-k>"] = cmp.mapping.select_prev_item(),
		['<A-j>'] = function()
      if cmp.visible() then
        cmp.select_next_item()
      else
				cmp.mapping(cmp.complete(), { 'i', 'c' })
      end
    end,
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	formatting = {
		format = lspkind.cmp_format({
      mode = 'text_symbol', -- show only symbol annotations
      maxwidth = 80, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
		{ name = "nvim_lua" },
		-- { name = "treesitter" },
		{ name = "path" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	-- documentation = false,
	documentation = {
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	},
	experimental = {
		ghost_text = true,
		native_menu = false,
	},
})

cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

vim.cmd[[
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
]]
