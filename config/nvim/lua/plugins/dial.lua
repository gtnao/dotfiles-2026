return {
	"monaqa/dial.nvim",
	keys = {
		{
			"+",
			function()
				require("dial.map").manipulate("increment", "normal")
			end,
			desc = "Increment",
		},
		{
			"-",
			function()
				require("dial.map").manipulate("decrement", "normal")
			end,
			desc = "Decrement",
		},
		{
			"+",
			function()
				require("dial.map").manipulate("increment", "visual")
			end,
			mode = "x",
			desc = "Increment",
		},
		{
			"-",
			function()
				require("dial.map").manipulate("decrement", "visual")
			end,
			mode = "x",
			desc = "Decrement",
		},
	},
}
