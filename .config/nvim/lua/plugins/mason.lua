return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = {
					-- LSPs
					"clangd",
					"rust_analyzer",
					"cssls",
					"eslint",
					"html",
					"jsonls",
					"lua_ls",
					"pyright",
					"systemd_ls",
					"ts_ls",
					"yamlls",

					-- DAPs
					"codelldb",

					-- Linters
					"stylelint",
					"cpplint",
					"eslint_d",
					"htmlhint",
					"jsonlint",
					"pylint",
					"shellcheck",

					-- formatters
					"clang-format",
					"black",
					"isort",
					"prettier",
					"stylua",
					"yamlfix",
				},
			})
		end,
	},
}
