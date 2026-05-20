local set = vim.keymap.set

---------------------------------- Normal Mode -------------------------------------------

set({ "n", "v" }, "<leader>w", "<cmd>w<cr>", { desc = "Write and Format" })

-- Better up/down
set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> arrow keys
set("n", "<C-Left>", "<C-w>h", { desc = "Go to left window", remap = true })
set("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window", remap = true })
set("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window", remap = true })
set("n", "<C-Right>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Move to window using the <ctrl> hjkl keys
set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <shift> arrow keys
set("n", "<S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
set("n", "<S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
set("n", "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
set("n", "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move to next / previous buffer
set("n", "<TAB>", ":bn<CR>", { desc = "Next buffer" })
set("n", "<S-TAB>", ":bp<CR>", { desc = "Previous buffer" })

-- Search and replace
set("n", "<leader>rr", [[:%s///gcI<Left><Left><Left><Left><Left>]], { desc = "Replace in Buffer" })
set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>//gcI<Left><Left><Left><Left>]], { desc = "Replace in Buffer (Word)" })

-- Clear search with <esc>
set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

---------------------------------- Visual Mode -------------------------------------------

-- Better indenting
set("v", "<", "<gv")
set("v", ">", ">gv")

-- Surround
set("v", "gs(", "<esc>`>a)<esc>`<i(<esc>", { desc = "Add () around selection" })
set("v", "gs)", "<esc>`>a)<esc>`<i(<esc>", { desc = "Add () around selection" })
set("v", "gs{", "<esc>`>a}<esc>`<i{<esc>", { desc = "Add {} around selection" })
set("v", "gs}", "<esc>`>a}<esc>`<i{<esc>", { desc = "Add {} around selection" })
set("v", "gs[", "<esc>`>a]<esc>`<i[<esc>", { desc = "Add [] around selection" })
set("v", "gs]", "<esc>`>a]<esc>`<i[<esc>", { desc = "Add [] around selection" })
set("v", "gs<", "<esc>`>a><esc>`<i<<esc>", { desc = "Add <> around selection" })
set("v", "gs>", "<esc>`>a><esc>`<i<<esc>", { desc = "Add <> around selection" })
set("v", 'gs"', '<esc>`>a"<esc>`<i"<esc>', { desc = 'Add "" around selection' })
set("v", "gs'", "<esc>`>a'<esc>`<i'<esc>", { desc = "Add '' around selection" })
set("v", "gs`", "<esc>`>a`<esc>`<i`<esc>", { desc = "Add `` around selection" })

set("n", "<leader>q", "<cmd>q<cr>", { desc = "Close current window" })

set("x", "p", "P", { noremap = true, silent = true })
