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

require('luasnip').filetype_extend("javascript", { "html" })
require('luasnip').filetype_extend("javascriptreact", { "html" })
require('luasnip').filetype_extend("typescript", { "html" })
require('luasnip').filetype_extend("typescriptreact", { "html" })
require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local lspkind = require "lspkind"
lspkind.init {
  with_text = true,
  symbol_map = {
    Text = "",
    Method = "ƒ",
    Function = "ﬦ",
    Constructor = "",
    Variable = "",
    Class = "",
    Interface = "ﰮ",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "了",
    Keyword = "",
    Snippet = "﬌",
    Color = "",
    File = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
  },
}


cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		["<A-k>"] = cmp.mapping.select_prev_item(),
		['<A-j>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
				cmp.mapping(cmp.complete(), { 'i', 'c' })
      end
    end,
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	formatting = {
  	  format = function(entry, vim_item)
  	    vim_item.kind = string.format("%s %s", lspkind.presets.default[vim_item.kind], vim_item.kind)
  	    vim_item.menu = ({
  	      npm = "ﲳ",
  	      nvim_lsp = "ﲳ",
  	      nvim_lua = "",
  	      treesitter = "",
  	      path = "ﱮ",
  	      buffer = "﬘",
  	      zsh = "",
  	      vsnip = "",
  	      spell = "暈",
  	    })[entry.source.name]

  	    return vim_item
  	  end,
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
		{ name = "emoji" },
		{ name = "cmp_luasnip" },
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
