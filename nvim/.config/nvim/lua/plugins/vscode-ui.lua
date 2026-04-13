-- VS Code UI configuration for the NeoVim VS Code extension
-- This file is loaded when running Neovim inside VS Code via the vscode.nvim extension

if vim.g.vscode then
	-- Disable plugins that VS Code handles natively
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
end

return {}
