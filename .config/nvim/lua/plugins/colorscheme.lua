return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({

				flavour = "frappe",
				integrations = {
					blink_cmp = true,
					diffview = true,
					gitsigns = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
							ok = { "italic" },
						},
						underlines = {
							errors = { "undercurl" },
							hints = { "undercurl" },
							warnings = { "undercurl" },
							information = { "undercurl" },
							ok = { "undercurl" },
						},
						inlay_hints = {
							background = true,
						},
					},
					snacks = true,
					treesitter = true,
				},
				color_overrides = {
					frappe = {
						base = "#1E1F22",
						Keyword = "#CF8E6D",
						String = "#6AAB73",
						Comments = "#7A7E85",
						Functions = "#56A8F5",
						Parameter = "#BCBEC4",
						Braces = "#BCBEC4",
					},
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
	},
}
