-- See: https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/configs

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP Actions",
	callback = function(event)
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = event.buf, desc = "Rename" })
		vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, { buffer = event.buf, desc = "Code Actions" })
		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = event.buf, desc = "Format" })
		vim.keymap.set("n", "<leader>lq", vim.diagnostic.setqflist, { buffer = event.buf, desc = "Quickfix List" })
		vim.keymap.set("n", "<leader>lL", vim.diagnostic.setloclist, { buffer = event.buf, desc = "Location List" })
		vim.keymap.set("n", "<leader>lK", vim.lsp.buf.hover, { buffer = event.buf, desc = "Hover Documentation" })
		vim.keymap.set("n", "<leader>lJ", vim.diagnostic.open_float, { buffer = event.buf, desc = "Hover Diagnostics" })
		vim.keymap.set("n", "<leader>lgD", vim.lsp.buf.declaration, { buffer = event.buf, desc = "Go to Declaration" })
		vim.keymap.set("n", "<leader>lgd", function()
			Snacks.picker.lsp_definitions()
		end, { buffer = event.buf, desc = "Go to Definitions" })

		vim.keymap.set("n", "<leader>lgr", function()
			Snacks.picker.lsp_references()
		end, { buffer = event.buf, desc = "Go to References" })

		vim.keymap.set("n", "<leader>lgI", function()
			Snacks.picker.lsp_implementations()
		end, { buffer = event.buf, desc = "Go to Implementation" })

		vim.keymap.set("n", "<leader>lgy", function()
			Snacks.picker.lsp_type_definitions()
		end, { buffer = event.buf, desc = "Go to Type Definition" })
	end,
})

local capabilities = {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
}

capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

vim.lsp.config("*", {
	capabilities = capabilities,
	root_markers = { ".git" },
})
