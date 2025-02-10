return {
	{
		"yetone/avante.nvim",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
		},
		event = "VeryLazy",
		lazy = false,
		build = "make",
		opts = {
			provider = "openai",
			auto_suggestions_provider = "openai",
			openai = {
				endpoint = "https://api.openai.com/v1",
				model = "gpt-4o-mini",
				timeout = 15000, -- Timeout reducido a 15 segundos
				temperature = 0, -- Ajuste de temperatura para más variabilidad
				max_tokens = 4096, -- Reducir el número máximo de tokens
				["local"] = false,
				disable_tools = true,
			},
			gemini = {
				endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
				model = "gemini-1.5-pro",
				timeout = 30000, -- Timeout in milliseconds
				temperature = 0,
				max_tokens = 4096,
				["local"] = false,
				disable_tools = true,
			},
			behaviour = {
				auto_suggestions = false, -- Experimental stage
				auto_set_highlight_group = true,
				auto_set_keymaps = true,
				auto_apply_diff_after_generation = false,
				support_paste_from_clipboard = false,
			},
			hints = { enabled = true },
			windows = {
				position = "right", -- the position of the sidebar
				wrap = true, -- similar to vim.o.wrap
				width = 55, -- default % based on available width
				sidebar_header = {
					align = "center", -- left, center, right for title
					rounded = true,
				},
			},
			mappings = {
				ask = "<leader>ai",
				edit = "<leader>ae",
				refresh = "<leader>ar",
				diff = {
					ours = "co",
					theirs = "ct",
					both = "cb",
					next = "]x",
					prev = "[x",
				},
				jump = {
					next = "]]",
					prev = "[[",
				},
				submit = {
					normal = "<CR>",
					insert = "<C-s>",
				},
				toggle = {
					debug = "<leader>ad",
					hint = "<leader>ah",
				},
			},
		},
	},
}
