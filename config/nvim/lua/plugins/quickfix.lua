return {
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
	},
	{
		"gabrielpoca/replacer.nvim",
		keys = {
			{
				"<Leader>h",
				function()
					require("replacer").run()
				end,
				desc = "Replacer",
			},
		},
		opts = {},
	},
}
