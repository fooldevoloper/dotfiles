return {
	-- Disable Neo-tree in VS Code
	{ "nvim-neo-tree/neo-tree.nvim", enabled = false },

	-- Disable Bufferline (tabs) in VS Code
	{ "akinsho/bufferline.nvim", enabled = not vim.g.vscode },

	-- Disable Lualine (status bar) in VS Code
	{ "nvim-lualine/lualine.nvim", enabled = not vim.g.vscode },

	-- Disable Noice (fancy command line) in VS Code
	{ "folke/noice.nvim", enabled = not vim.g.vscode },
}
