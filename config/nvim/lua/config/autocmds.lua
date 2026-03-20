vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local biome_filetypes = {
			javascript = true,
			javascriptreact = true,
			typescript = true,
			typescriptreact = true,
			json = true,
			jsonc = true,
			css = true,
			graphql = true,
		}
		local has_biome = #vim.lsp.get_clients({ name = "biome" }) > 0
		local ft = vim.bo.filetype

		vim.lsp.buf.format({
			timeout_ms = 2000,
			filter = function(client)
				-- disable LSP built-in formatters where prettierd/biome handles formatting
				local disable_format = { html = true, cssls = true, jsonls = true, yamlls = true }
				if disable_format[client.name] then
					return false
				end
				-- in biome projects, use biome instead of prettierd for biome-supported filetypes
				if has_biome and biome_filetypes[ft] and client.name == "null-ls" then
					return false
				end
				return true
			end,
		})
	end,
})
