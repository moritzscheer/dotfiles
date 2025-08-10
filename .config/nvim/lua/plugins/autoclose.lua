return {
	"m4xshen/autoclose.nvim",
	config = function()
		require("autoclose").setup({
			options = {
				disable_filetype = { "TelescopePrompt", "vim" },
				disable_when_touch = true,
				pair_spaces = true,
			},
			keys = {},
		})
	end,
}
