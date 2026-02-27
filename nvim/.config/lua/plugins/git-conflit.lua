return {
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = function()
			-- 1. Setup the plugin
			require("git-conflict").setup({
				disable_diagnostics = false,
				debug = false,
				default_mappings = true,
				list_opener = "copen",
				highlights = {
					-- These link to standard Neovim highlight groups that Sonokai defines
					incoming = "DiffAdd",
					current = "DiffChange",
					ancestor = "DiffText",
				},
			})

			-- 2. Manually refine the colors for Sonokai
			-- This ensures the background is visible but doesn't hide the text

			vim.api.nvim_set_hl(0, "GitConflictCurrent", { link = "DiffAdd", bold = true })
			vim.api.nvim_set_hl(0, "GitConflictIncoming", { link = "DiffChange", bold = true })
			vim.api.nvim_set_hl(0, "GitConflictCurrentLabel", { bg = "#3d484d", fg = "#a7c080", bold = true })
			vim.api.nvim_set_hl(0, "GitConflictIncomingLabel", { bg = "#3d484d", fg = "#7fbbb3", bold = true })
			vim.keymap.set("n", "co", "<Plug>(git-conflict-ours)", { desc = "Conflict: Keep Ours" })
			vim.keymap.set("n", "ct", "<Plug>(git-conflict-theirs)", { desc = "Conflict: Keep Theirs" })
			vim.keymap.set("n", "cb", "<Plug>(git-conflict-both)", { desc = "Conflict: Keep Both" })
			vim.keymap.set("n", "c0", "<Plug>(git-conflict-none)", { desc = "Conflict: Keep None" })
			vim.keymap.set("n", "]x", "<Plug>(git-conflict-next-conflict)", { desc = "Next Conflict" })
			vim.keymap.set("n", "[x", "<Plug>(git-conflict-prev-conflict)", { desc = "Prev Conflict" })
		end,
	},
}
