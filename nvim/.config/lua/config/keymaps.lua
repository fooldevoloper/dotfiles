local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

keymap.set("n", "<leader>m", vim.cmd.MaximizerToggle, { noremap = true })
-- File explorer with NvimTree
--keymap.set("n", "<Leader>e", ":NvimTreeFindFile<Return>", opts)
keymap.set("n", "<Leader>e", "<cmd>NvimTreeFindFileToggle<CR>", opts)
-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")
-- Terminal navigation
-- This lets you move from terminal to other windows without hitting Ctrl-\ Ctrl-n first
keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
-- Resize window
-- Resize window
keymap.set("n", "<C-S-h>", "<C-w><")
keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")
-- Diagnostics (Better mapping)
keymap.set("n", "<leader>dn", function()
	vim.diagnostic.get_next(opts)
end, opts)

keymap.set("n", "<leader>dp", function()
	vim.diagnostic.get_pre(opts)
end, opts)
