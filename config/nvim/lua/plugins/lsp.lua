return {
	{ "mason-org/mason.nvim", opts = {} },
	{ "neovim/nvim-lspconfig" },
	-- required at startup because lsp/lua_ls.lua calls require("cmp_nvim_lsp")
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = { "lua_ls" },
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			automatic_installation = true,
		},
	},
	{
		"j-hui/fidget.nvim",
		opts = {},
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
