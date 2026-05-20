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
					"bashls",
					"ts_ls",
					"yamlls",
				},
			})
		end,
	},
}
