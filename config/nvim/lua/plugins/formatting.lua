return {
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			automatic_installation = true,
		},
	},
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"jay-babu/mason-null-ls.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
				},
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function()
					vim.lsp.buf.format({ timeout_ms = 2000 })
				end,
			})
		end,
	},
}
