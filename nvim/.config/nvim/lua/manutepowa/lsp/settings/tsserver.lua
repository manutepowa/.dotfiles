return {
	cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = require("nvim-lsp-ts-utils").init_options,
    on_attach = function(client)
			client.resolved_capabilities.document_formatting = false

			require("nvim-lsp-ts-utils").setup({
				eslint_enable_code_actions = false,
				eslint_enable_diagnostics = false,
				signature_help_in_parens = true,
				auto_inlay_hints = false,
			})

			require("nvim-lsp-ts-utils").setup_client(client)

			return client
  end,
}
