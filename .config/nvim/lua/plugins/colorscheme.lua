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
		"oskarnurm/koda.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("koda").setup({
				transparent = false, -- enable for transparent backgrounds

				-- Set the variants to use when auto-switching based on vim.o.background
				-- Valid values: 'dark', 'light', 'moss', 'glade'
				theme = {
					dark = "dark",
					light = "light",
				},

				-- Automatically enable highlights only for plugins installed by your plugin manager
				-- Currently only supports `lazy.nvim`, `mini.deps` and `vim.pack`
				auto = true, -- disable to load ALL available plugin highlights

				cache = true, -- caches the theme for better performance

				-- Style to be applied to different syntax groups
				-- Common use case would be to set either `italic = true` or `bold = true` for a desired group
				-- See `:help nvim_set_hl` for more valid values
				styles = {
					functions = { bold = true },
					keywords = {},
					comments = {},
					strings = {},
					constants = {}, -- includes numbers, booleans
				},

				-- Override colors for the active variant
				-- Available keys (e.g., 'func') can be found in lua/koda/palette/
				colors = {
					-- func = "#4078F2",
					-- keyword = "#A627A4",
				},

				-- You can modify or extend highlight groups using the `on_highlights` configuration option
				-- Any changes made take effect when highlights are applied
				on_highlights = function(hl, c)
					-- hl.LineNr = { fg = c.info } -- change a specific highlight to use a different palette color
					-- hl.Comment = { fg = c.emphasis, italic = true } -- modify a syntax group (add bold, italic, etc)
					-- hl.RainbowDelimiterRed = { fg = "#fb2b2b" } -- add a custom highlight group for another plugin
				end,
			})

			-- vim.cmd("colorscheme koda-moss")
		end,
	},
}
