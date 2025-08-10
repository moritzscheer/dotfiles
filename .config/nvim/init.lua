vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.macros")

require("lazy").setup({
	{ import = "plugins.ai" },
	{ import = "plugins.colorscheme" },
	{ import = "plugins.completion" },
	{ import = "plugins.formatting" },
	{ import = "plugins.linting" },
	{ import = "plugins.mason" },
	{ import = "plugins.snacks" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.whichkey" },
	{ import = "plugins.autoclose" },
})

require("core.lsp")
