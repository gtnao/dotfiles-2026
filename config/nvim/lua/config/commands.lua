vim.api.nvim_create_user_command("CopyPath", function()
	vim.fn.setreg("+", vim.fn.expand("%:."))
end, { desc = "Copy current file path (relative) to clipboard" })
