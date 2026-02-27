return {
	"f-person/git-blame.nvim",
	event = "VeryLazy",
	opts = {
		enabled = false,
		message_template = "        • <author> • <summary> • <date> ",
		date_format = "%m-%d-%Y",
		virtual_text_column = 1,
	},
	config = function(_, opts)
		require("gitblame").setup(opts)
		vim.api.nvim_create_user_command("ToggleBlame", "GitBlameToggle", {})
		vim.keymap.set("n", "gb", "<cmd>GitBlameToggle<cr>", { desc = "Toggle Git Blame" })
	end,
}
