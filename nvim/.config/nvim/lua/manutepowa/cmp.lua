-- Setup nvim-cmp.
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local cmp_dap_status_ok, cmp_dap = pcall(require, "cmp_dap")
if not cmp_dap_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

local check_backspace = function()
	local col = vim.fn.col "." - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

luasnip.filetype_extend("javascript", { "html" })
luasnip.filetype_extend("javascriptreact", { "html" })
luasnip.filetype_extend("typescript", { "html" })
luasnip.filetype_extend("typescriptreact", { "html" })
require("luasnip/loaders/from_vscode").lazy_load()

local icons = require "manutepowa.icons"
local kind_icons = icons.kind
-- local lspkind = require "lspkind"
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	enabled = function()
		return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
				or require("cmp_dap").is_dap_buffer()
	end,
	mapping = cmp.mapping.preset.insert {
		["<A-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s", "c" }),
		['<A-j>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif not cmp.visible() then
				cmp.mapping(cmp.complete(), { 'i', 'c', 's' })
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
			-- if cmp.visible() then
			-- 	cmp.select_next_item()
			-- elseif luasnip.expandable() then
			-- 	luasnip.expand()
			-- elseif luasnip.expand_or_jumpable() then
			-- 	luasnip.expand_or_jump()
			-- elseif check_backspace() then
			-- 	fallback()
			-- else
			-- 	fallback()
			-- end
		end, {
			"i",
			"s",
			"c"
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = kind_icons[vim_item.kind]
			if entry.source.name == "copilot" then
				vim_item.kind = icons.git.Octoface
				vim_item.kind_hl_group = "CmpItemKindCopilot"
			end

			-- NOTE: order matters
			vim_item.menu = ({
				nvim_lsp = "",
				nvim_lua = "",
				luasnip = "",
				buffer = "",
				path = "",
				dap = ""
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "buffer" },
		-- {
		-- 	name = "buffer",
		-- 	option = {
		-- 		get_bufnrs = function()
		-- 			return vim.api.nvim_list_bufs()
		-- 		end,
		-- 	},
		-- },
		{ name = "path" },
		{ name = "dap" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
		},
		completion = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
		},
	},
	experimental = {
		ghost_text = true,
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

vim.cmd [[
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
]]
