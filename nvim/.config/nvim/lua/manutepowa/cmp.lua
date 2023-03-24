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
-- -- local lspkind = require "lspkind"
-- vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
local compare = require "cmp.config.compare"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or cmp_dap.is_dap_buffer()
  end,
  preselect = cmp.PreselectMode.None,
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
      vim_item.menu = ({
        nvim_lsp = "",
        buffer = "",
        luasnip = "",
        nvim_lua = "",
        path = "",
        dap = ""
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "luasnip" },
    { name = "path" }
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.locality,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = true,
  },
})

-- cmp.setup.filetype({ 'dap-repl' }, {
--   enabled = function()
--     return cmp_dap.is_dap_buffer()
--   end,
--   sources = {
--     { name = 'dap' },
--     { name = 'path' },
--   }
-- })
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'dap-repl' },
  callback = function(t)
    -- vim.api.nvim_buf_set_keymap(t.buf, 'i', '<C-h>', [[<C-\><C-n><C-W><C-h>]], { noremap = true })
    -- vim.api.nvim_buf_set_keymap(t.buf, 'i', '<C-\\>', [[<C-\><C-n>]], { noremap = true })
    -- vim.api.nvim_buf_set_keymap(t.buf, 'i', '<C-j>', [[<C-\><C-n><C-W><C-j>]], { noremap = true })
    -- vim.api.nvim_buf_set_keymap(t.buf, 'i', '<C-k>', [[<C-\><C-n><C-W><C-k>]], { noremap = true })
    vim.api.nvim_buf_set_keymap(t.buf, 'i', '<A-BS>', '<cmd>normal vbd<cr>', { noremap = true })

    vim.api.nvim_create_autocmd({ 'BufEnter' }, {
      buffer = t.buf,
      command = 'startinsert!'
    })
  end
})
-- local lsp_group = vim.api.nvim_create_augroup("lsp", { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "dap-repl",
--   callback = function()
--     require("dap.ext.autocompl").attach()
--   end,
--   group = lsp_group,
-- })
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    {
      name = 'cmdline',
      option = {}
    }
  })
})
vim.cmd [[
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
]]
