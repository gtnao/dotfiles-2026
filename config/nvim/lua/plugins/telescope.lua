return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{ "<Plug>(_FuzzyFinder)f", "<Cmd>Telescope find_files<CR>", desc = "Find files" },
	},
	config = function()
		require("telescope").load_extension("fzf")
	end,
}
