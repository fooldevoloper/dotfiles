return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 15, -- fixed height like VS Code panel
			open_mapping = [[<C-\>]],
			hide_numbers = true,
			shade_terminals = false,
			start_in_insert = true,
			persist_size = true,
			direction = "horizontal", -- bottom panel
			close_on_exit = true,
		})
	end,
}
