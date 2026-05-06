return {
	"mistweaverco/kulala.nvim",
	keys = {
		{ "<leader>rr", "<cmd>lua require('kulala').run()<cr>", desc = "Run request" },
		{ "<leader>rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body" },
	},
	opts = {},
}
