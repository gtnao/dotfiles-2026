vim.keymap.set({ "n", "x" }, ";", ":", { desc = "Command mode" })
vim.keymap.set({ "n", "x" }, ":", ";", { desc = "Repeat f/t" })
vim.keymap.set("n", "<Leader>w", "<Cmd>update<CR>", { desc = "Save" })
vim.keymap.set("n", "<Leader>q", "<Cmd>quit<CR>", { desc = "Quit" })

vim.keymap.set({ "n", "x" }, "<Plug>(_FuzzyFinder)", "<Nop>")
vim.keymap.set({ "n", "x" }, "z", "<Plug>(_FuzzyFinder)")

vim.keymap.set({ "n", "x" }, "<Plug>(_LSP)", "<Nop>")
vim.keymap.set({ "n", "x" }, ",", "<Plug>(_LSP)")
