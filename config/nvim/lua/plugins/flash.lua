return {
	"folke/flash.nvim",
	keys = {
		{
			"<Leader>f",
			function()
				require("flash").jump()
			end,
			mode = { "n", "x", "o" },
			desc = "Flash",
		},
	},
	opts = {},
}
