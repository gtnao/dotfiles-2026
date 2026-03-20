return {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				library = { vim.env.VIMRUNTIME },
			},
		},
	},
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
}
