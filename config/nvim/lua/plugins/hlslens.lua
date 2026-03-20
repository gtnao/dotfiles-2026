return {
	"kevinhwang91/nvim-hlslens",
	keys = {
		{
			"<Leader>/",
			[[*<Cmd>lua require('hlslens').start()<CR>]],
			desc = "Search word under cursor",
		},
		{
			"n",
			[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
			desc = "Next search result",
		},
		{
			"N",
			[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
			desc = "Prev search result",
		},
	},
	opts = {},
}
