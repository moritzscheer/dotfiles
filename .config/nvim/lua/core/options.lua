-- ╭───────────────────────────────────╮
-- │ Vim Options and Settings          │
-- ╰───────────────────────────────────╯

local options = {
	autoindent = true, -- Indent new lines to match previous line
	autoread = true, -- Reload file when changed externally
	background = "dark", -- Inform colorschemes the terminal background is dark
	backup = false, -- Don't create backup files
	breakindent = true, -- Wrapped lines preserve indentation
	clipboard = "unnamed,unnamedplus", -- Use system clipboard for yank, paste, etc.
	cmdheight = 1, -- Command-line height
	completeopt = "noinsert,menuone,noselect", -- Better completion behavior
	confirm = true, -- Confirm instead of erroring when closing unsaved
	cursorline = true, -- Highlight the current line
	errorbells = false, -- Disable error bell sounds
	expandtab = true, -- Convert tabs to spaces
	fileencoding = "utf-8", -- Set file encoding to UTF-8
	foldenable = true, -- Enable folding
	foldexpr = "nvim_treesitter#foldexpr()", -- Use Treesitter for fold logic
	foldlevel = 99, -- Don't fold anything by default
	foldlevelstart = 99, -- Start unfolded
	foldmethod = "expr", -- Use expression to define folds
	hidden = true, -- Allow switching buffers without saving
	hlsearch = true, -- Highlight all search matches
	ignorecase = true, -- Ignore case in search
	incsearch = true, -- Show search matches as you type
	inccommand = "nosplit", -- Live preview of :substitute command
	laststatus = 3, -- Global statusline
	mouse = "a", -- Enable mouse in all modes
	number = true, -- Show line numbers
	numberwidth = 2, -- Width of number column
	pumheight = 10, -- Max items in popup menu
	relativenumber = false, -- Show relative line numbers
	scrolloff = 5, -- Keep 5 lines visible when scrolling vertically
	shiftround = true, -- Round indent to nearest shiftwidth multiple
	shiftwidth = 2, -- Number of spaces for each indent
	showmode = false, -- Don't show -- INSERT -- in the command line
	sidescrolloff = 5, -- Keep 5 columns visible when scrolling horizontally
	signcolumn = "yes", -- Always show sign column
	smartcase = true, -- Override ignorecase if uppercase letters are used
	smartindent = true, -- Auto-indent new lines intelligently
	softtabstop = 2, -- Number of spaces tabs count for in insert mode
	splitbelow = true, -- Horizontal splits open below
	splitright = true, -- Vertical splits open to the right
	swapfile = false, -- Don't use swap files
	tabstop = 2, -- Number of spaces a tab character displays as
	termguicolors = true, -- Enable 24-bit RGB colors
	timeoutlen = 1000, -- Wait time (ms) for mapped sequence to complete
	ttimeoutlen = 100, -- Wait time for key codes (e.g. escape sequences)
	title = true, -- Set terminal window title
	undodir = os.getenv("HOME") .. "/.vim/undodir", -- Directory to store undo history
	undofile = true, -- Save undo history to a file
	updatetime = 100, -- Time before triggering CursorHold events
	wrap = true, -- Don't wrap long lines
	diffopt = {
		"internal", -- Use internal diff library instead external programs.
		"filler", -- show filler lines to align line numbers across diffs
		"closeoff", -- close diff windows automatically when only one remains
		"context:12", -- show 12 unchanged lines around each diff block
		"algorithm:histogram", -- use histogram algorithm for more accurate diffing
		"linematch:200", -- match lines up to 200 lines apart to improve detection
		"indent-heuristic", -- use indentation to better detect moved or changed blocks
	},
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

vim.opt.shortmess:append("c")
vim.opt.termguicolors = true
vim.cmd([[set t_BE=]])

local icons = require("utils.icons").icons.diagnostics

vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	virtual_text = {
		spacing = 4,
		source = "if_many",
		-- prefix = "●",
		prefix = function(diagnostic)
			for d, icon in pairs(icons) do
				if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
					return icon
				end
			end
		end,
		format = function(diagnostic)
			-- Replace newline and tab characters with space for more compact diagnostics
			local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
			return message
		end,
	},
	-- virtual_lines = true,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.HINT] = icons.Hint,
			[vim.diagnostic.severity.INFO] = icons.Info,
			[vim.diagnostic.severity.WARN] = icons.Warn,
			[vim.diagnostic.severity.ERROR] = icons.Error,
		},
		linehl = {
			[vim.diagnostic.severity.HINT] = "DiagnosticHint",
			[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
			[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
			[vim.diagnostic.severity.ERROR] = "DiagnosticError",
		},
	},
})

for _, type in ipairs({ "Error", "Warn", "Hint", "Info" }) do
	vim.fn.sign_define(
		"DiagnosticSign" .. type,
		{ name = "DiagnosticSign" .. type, text = icons[type], texthl = "Diagnostic" .. type }
	)
end
