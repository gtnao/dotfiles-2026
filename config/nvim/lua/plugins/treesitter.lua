return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"lua",
			"bash",
			"typescript",
			"javascript",
			"tsx",
			"python",
			"go",
			"ruby",
			"rust",
			"terraform",
			"hcl",
			"c",
			"cpp",
			"html",
			"css",
			"json",
			"yaml",
			"dockerfile",
			"markdown",
			"markdown_inline",
			"toml",
			"sql",
			"graphql",
			"proto",
			"regex",
			"diff",
			"gitcommit",
			"git_config",
			"make",
			"just",
			"jsdoc",
			"ssh_config",
			"vim",
			"vimdoc",
		})
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
