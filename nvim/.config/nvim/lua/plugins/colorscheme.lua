return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = false,

				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
					sidebars = "transparent",
					floats = "transparent",
				},

				on_colors = function(colors)
					colors.bg = "#1a1b26"
					colors.bg_dark = "#16161e"
				end,

				on_highlights = function(hl, c)
					hl.GitSignsAdd = { fg = "#9ece6a" }
					hl.GitSignsChange = { fg = "#e0af68" }
					hl.GitSignsDelete = { fg = "#f7768e" }

					hl.Comment = { fg = "#565f89", italic = true }
					hl.Visual = { bg = "#283457" }
				end,
			})

			vim.cmd.colorscheme("tokyonight")
		end,
	},
}
