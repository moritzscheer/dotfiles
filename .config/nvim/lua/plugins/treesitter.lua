return {
	-- 1. Das Haupt-Plugin (Modernes Treesitter v1.0+)
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile", "BufReadPost" },
		build = ":TSUpdate",
		config = function()
			-- Ruft das moderne Setup direkt auf
			require("nvim-treesitter").setup({
				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"css",
					"dockerfile",
					"gitignore",
					"html",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"rust",
					"sql",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"yaml",
					"zig",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true, disable = { "dart", "yaml" } },
				incremental_selection = { enable = false },

				-- Die Konfiguration kann hier bleiben, sie schläft einfach
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["aa"] = { query = "@parameter.outer", desc = "Select Around Parameter" },
							["ia"] = { query = "@parameter.inner", desc = "Select Inside Parameter" },
							["af"] = { query = "@function.outer", desc = "Select Around Function" },
							["if"] = { query = "@function.inner", desc = "Select Inside Function" },
							["ac"] = { query = "@class.outer", desc = "Select Around Class" },
							["ic"] = { query = "@class.inner", desc = "Select Inside Class" },
							["al"] = { query = "@loop.outer", desc = "Select Around Loop" },
							["il"] = { query = "@loop.inner", desc = "Select Inside Loop" },
							["ab"] = { query = "@block.outer", desc = "Select Around Block" },
							["ib"] = { query = "@block.inner", desc = "Select Inside Block" },
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]f"] = { query = "@function.outer", desc = "Go to Next Start Function" },
							["]c"] = { query = "@class.outer", desc = "Go to Next Start Class" },
							["]l"] = { query = "@loop.outer", desc = "Go to Next Start Loop" },
							["]b"] = { query = "@block.outer", desc = "Go to Next Start Block" },
						},
						goto_next_end = {
							["]F"] = { query = "@function.outer", desc = "Go to Next End Function" },
							["]C"] = { query = "@class.outer", desc = "Go to Next End Class" },
							["]L"] = { query = "@loop.outer", desc = "Go to Next End Loop" },
							["]B"] = { query = "@block.outer", desc = "Go to Next End Block" },
						},
						goto_previous_start = {
							["[f"] = { query = "@function.outer", desc = "Go to Previous Start Function" },
							["[c"] = { query = "@class.outer", desc = "Go to Previous Start Class" },
							["[l"] = { query = "@loop.outer", desc = "Go to Previous Start Loop" },
							["[b"] = { query = "@block.outer", desc = "Go to Previous Start Block" },
						},
						goto_previous_end = {
							["[F"] = { query = "@function.outer", desc = "Go to Previous End Function" },
							["[C"] = { query = "@class.outer", desc = "Go to Previous End Class" },
							["[L"] = { query = "@loop.outer", desc = "Go to Previous End Loop" },
							["[B"] = { query = "@block.outer", desc = "Go to Previous End Block" },
						},
					},
				},
			})
		end,
	},

	-- 2. Die Textobjects (VORÜBERGEHEND DEAKTIVIERT)
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = { "BufReadPre", "BufNewFile", "BufReadPost" },
		enabled = false, -- FIX: Verhindert den Absturz beim Starten
	},

	-- 3. Der Context (VORÜBERGEHEND DEAKTIVIERT)
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = { "BufReadPre", "BufNewFile" },
		enabled = false, -- FIX: Verhindert den Query-Absturz beim Starten
		config = function()
			require("treesitter-context").setup()
		end,
	},
}
