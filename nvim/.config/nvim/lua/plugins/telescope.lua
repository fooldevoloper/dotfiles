return {
	"telescope.nvim",
	priority = 1000,
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-telescope/telescope-file-browser.nvim",
	},
	keys = {},
	config = function(_, opts)
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local fb_actions = require("telescope").extensions.file_browser.actions

		opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
			wrap_results = true,
			layout_strategy = "horizontal",
			layout_config = { prompt_position = "bottom" },
			sorting_strategy = "ascending",
			winblend = 0,
			mappings = {
				n = {},
			},
		})

		opts.pickers = {
			diagnostics = {
				theme = "ivy",
				initial_mode = "normal",
				layout_config = {
					preview_cutoff = 9999,
				},
			},
		}

		opts.extensions = {
			file_browser = {
				theme = "dropdown",
				hijack_netrw = true,
				mappings = {
					["n"] = {
						["N"] = fb_actions.create,
						["h"] = fb_actions.goto_parent_dir,
						["<C-u>"] = function(prompt_bufnr)
							for i = 1, 10 do
								actions.move_selection_previous(prompt_bufnr)
							end
						end,
						["<C-d>"] = function(prompt_bufnr)
							for i = 1, 10 do
								actions.move_selection_next(prompt_bufnr)
							end
						end,
					},
				},
			},
		}

		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")
	end,
}
