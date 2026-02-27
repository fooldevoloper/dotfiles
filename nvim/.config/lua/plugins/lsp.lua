return {
	-- 1. Tools (Mason)
	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"luacheck",
				"shellcheck",
				"vtsls",
				"css-lsp",
			})
		end,
	},
	-- 2. LSP Servers Configuration
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = true },
			servers = {
				eslint = {
					enabled = false, -- This completely stops LazyVim from starting ESLint
				},
				tsserver = { enabled = false },

				vtsls = {
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
				html = {},
				lua_ls = {},
			},
		},
	},
}
