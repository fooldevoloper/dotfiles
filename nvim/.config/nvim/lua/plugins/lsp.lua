return {
	-- 1. Tools (Mason) - Fixed the repository name
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {})
		end,
	},

	-- 2. LSP Servers Configuration
	{
		"neovim/nvim-lspconfig",
		opts = {
			-- MASTER SWITCHES
			autoformat = false, -- Disables all autoformatting
			inlay_hints = { enabled = true }, -- Shows types inline

			servers = {
				-- 1. VTSLS (Modern TypeScript Server)
				vtsls = {
					settings = {
						typescript = {
							-- This hides "smaller issues" like unused variables
							reportStyleChecksAsWarnings = false,
						},
						javascript = {
							reportStyleChecksAsWarnings = false,
						},
					},
					-- This specific block kills the red/yellow underlines (Diagnostics)
					handlers = {
						["textDocument/publishDiagnostics"] = function() end,
					},
				},

				-- 2. HTML
				html = {
					formatting = false,
					handlers = {
						["textDocument/publishDiagnostics"] = function() end,
					},
				},

				-- 3. Lua (for your config files)
				lua_ls = {
					formatting = false,
					handlers = {
						["textDocument/publishDiagnostics"] = function() end,
					},
				},

				-- 4. ESLINT (Explicitly disabled as requested)
				eslint = { enabled = false },
			},
		},
	},
}
