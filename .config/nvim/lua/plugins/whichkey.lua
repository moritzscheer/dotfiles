return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		preset = "helix",
		triggers = {
			{ "<auto>", mode = "nxso" },
		},
		win = {
			padding = { 1, 3 },
			title_pos = "center",
		},
		layout = {
			width = { min = 80 },
			spacing = 4,
		},
		keys = {
			scroll_down = "<Down>",
			scroll_up = "<Up>",
		},
		expand = 1,
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
			ellipsis = "…",
			mappings = true,
			rules = {},
			colors = true,
			keys = {
				Up = "↑",
				Down = "↓",
				Left = "←",
				Right = "→",
				C = "C",
				M = "M",
				D = "⌫ ", -- Delete (can also be "D")
				S = "⇧", -- Shift
				CR = "⏎", -- Carriage return / Enter
				Esc = "⎋",
				ScrollWheelDown = "▼",
				ScrollWheelUp = "▲",
				NL = "⏎", -- Newline
				BS = "⌫ ",
				Space = "␣",
				Tab = "⇥",
				F1 = "F1",
				F2 = "F2",
				F3 = "F3",
				F4 = "F4",
				F5 = "F5",
				F6 = "F6",
				F7 = "F7",
				F8 = "F8",
				F9 = "F9",
				F10 = "F10",
				F11 = "F11",
				F12 = "F12",
			},
		},
	},
}
