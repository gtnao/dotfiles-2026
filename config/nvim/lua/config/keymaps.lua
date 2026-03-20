vim.keymap.set({ "n", "x" }, "<Leader>", "<Nop>")

vim.keymap.set({ "n", "x" }, ";", ":", { desc = "Command mode" })
vim.keymap.set({ "n", "x" }, ":", ";", { desc = "Repeat f/t" })
vim.keymap.set("n", "<Leader>w", "<Cmd>update<CR>", { desc = "Save" })
vim.keymap.set("n", "<Leader>q", "<Cmd>quit<CR>", { desc = "Quit" })

vim.keymap.set("n", "<Esc><Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

vim.keymap.set("n", "<Up>", "<Cmd>resize +5<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<Down>", "<Cmd>resize -5<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<Left>", "<Cmd>vertical resize -5<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<Right>", "<Cmd>vertical resize +5<CR>", { desc = "Increase window width" })

vim.keymap.set("n", "ZZ", "<Nop>")
vim.keymap.set("n", "ZQ", "<Nop>")

vim.keymap.set({ "n", "x" }, "<Plug>(_FuzzyFinder)", "<Nop>")
vim.keymap.set({ "n", "x" }, "z", "<Plug>(_FuzzyFinder)")

vim.keymap.set({ "n", "x" }, "<Plug>(_LSP)", "<Nop>")
vim.keymap.set({ "n", "x" }, ",", "<Plug>(_LSP)")
