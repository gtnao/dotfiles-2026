return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
	},
	keys = {
		{ "<Plug>(_FuzzyFinder)f", "<Cmd>Telescope find_files<CR>", desc = "Find files" },
		{
			"<Plug>(_FuzzyFinder)s",
			function()
				require("telescope").extensions.live_grep_args.live_grep_args()
			end,
			desc = "Live grep (with rg args)",
		},
	},
	config = function()
		local actions = require("telescope.actions")
		local lga_actions = require("telescope-live-grep-args.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
					n = {
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				live_grep_args = {
					auto_quoting = true,
					mappings = {
						i = {
							["<C-k>"] = lga_actions.quote_prompt(),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
							["<C-space>"] = lga_actions.to_fuzzy_refine,
						},
					},
				},
			},
		})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("live_grep_args")
	end,
}
