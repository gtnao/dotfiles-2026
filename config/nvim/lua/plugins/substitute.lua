return {
	"gbprod/substitute.nvim",
	keys = {
		{
			"_",
			function()
				require("substitute").operator()
			end,
			desc = "Substitute",
		},
		{
			"_",
			function()
				require("substitute").visual()
			end,
			mode = "x",
			desc = "Substitute",
		},
	},
	opts = {},
}
