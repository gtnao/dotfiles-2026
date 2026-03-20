return {
	{ "mason-org/mason.nvim", opts = {} },
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			vim.lsp.config("*", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			vim.keymap.set("n", "<Plug>(_LSP)d", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "<Plug>(_LSP)y", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
			vim.keymap.set("n", "<Plug>(_LSP)D", vim.lsp.buf.declaration, { desc = "Go to declaration" })
			vim.keymap.set("n", "<Plug>(_LSP)r", vim.lsp.buf.references, { desc = "References" })
			vim.keymap.set("n", "<Plug>(_LSP)n", vim.lsp.buf.rename, { desc = "Rename" })
			vim.keymap.set({ "n", "x" }, "<Plug>(_LSP)a", vim.lsp.buf.code_action, { desc = "Code action" })
			vim.keymap.set("n", "<Plug>(_LSP)i", vim.lsp.buf.implementation, { desc = "Implementation" })
			vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, { desc = "Signature help" })
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = function()
			-- no runtime dependency
			local ensure_installed = { "lua_ls", "clangd", "terraformls", "taplo" }

			if vim.fn.executable("node") == 1 then
				vim.list_extend(ensure_installed, {
					"bashls",
					"ts_ls",
					"eslint",
					"biome",
					"html",
					"cssls",
					"jsonls",
					"yamlls",
					"dockerls",
				})
			end

			if vim.fn.executable("pip3") == 1 then
				vim.list_extend(ensure_installed, { "basedpyright", "ruff" })
			end

			if vim.fn.executable("go") == 1 then
				vim.list_extend(ensure_installed, { "gopls" })
			end

			if vim.fn.executable("ruby") == 1 then
				vim.list_extend(ensure_installed, { "ruby_lsp" })
			end

			if vim.fn.executable("rustup") == 1 then
				vim.list_extend(ensure_installed, { "rust_analyzer" })
			end

			return { ensure_installed = ensure_installed }
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = { "shellcheck" },
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
			local has_node = vim.fn.executable("node") == 1
			local has_ruby = vim.fn.executable("ruby") == 1

			-- no runtime dependency
			local sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.shfmt,
			}

			if has_node then
				vim.list_extend(sources, {
					null_ls.builtins.formatting.prettierd,
				})
			end

			if has_ruby then
				vim.list_extend(sources, {
					null_ls.builtins.formatting.rubocop.with({
						condition = function(utils)
							return utils.root_has_file({ ".rubocop.yml" })
						end,
					}),
					null_ls.builtins.diagnostics.rubocop.with({
						condition = function(utils)
							return utils.root_has_file({ ".rubocop.yml" })
						end,
					}),
				})
			end

			null_ls.setup({ sources = sources })
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {},
		keys = {
			{ "<Plug>(_LSP)xx", "<Cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics" },
			{ "<Plug>(_LSP)xb", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer diagnostics" },
			{ "<Plug>(_LSP)xs", "<Cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols" },
			{
				"<Plug>(_LSP)xl",
				"<Cmd>Trouble lsp toggle focus=false win.position=right<CR>",
				desc = "LSP definitions/references",
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
}
