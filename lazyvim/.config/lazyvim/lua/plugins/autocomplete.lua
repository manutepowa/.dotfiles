return {
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    version = "v0.0.2",
    event = { "UIEnter" },
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lua" },
    },
    config = function()
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if not cmp_status_ok then
        return
      end

      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then
        print("Snippets not loaded")
        return
      end

      local icons = require("config.icons")
      local kind_icons = icons.kind
      local compare = require("cmp.config.compare")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        enabled = function()
          return vim.bo.buftype ~= "prompt"
        end,
        preselect = cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert({
          ["<A-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              local select_behavior = vim.b.visual_multi and cmp.SelectBehavior.Select or cmp.SelectBehavior.Insert
              cmp.select_prev_item({ behavior = select_behavior })
            else
              fallback()
            end
          end, { "i", "s", "c" }),
          ["<A-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              local select_behavior = vim.b.visual_multi and cmp.SelectBehavior.Select or cmp.SelectBehavior.Insert
              cmp.select_next_item({ behavior = select_behavior })
            elseif not cmp.visible() then
              cmp.mapping(cmp.complete(), { "i", "c", "s" })
            elseif luasnip.jumpable(1) then
              luasnip.jump(1)
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s", "c" }),
          ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
        }),
        sources = {
          { name = "nvim_lsp", keyword_length = 1 },
          { name = "nvim_lua", keyword_length = 1 },
          { name = "luasnip", keyword_length = 1 },
          { name = "buffer", keyword_length = 2 },
          { name = "path" },
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
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
            scrollbar = false,
          }),
          documentation = cmp.config.window.bordered({
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
            scrollbar = false,
          }),
        },
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {},
          },
        }),
      })

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
