vim.g.mapleader = " "
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { silent = true })
vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })

vim.keymap.set("n", "<C-Left>", "<C-w>h")
vim.keymap.set("n", "<C-Down>", "<C-w>j")
vim.keymap.set("n", "<C-Up>", "<C-w>k")
vim.keymap.set("n", "<C-Right>", "<C-w>l")

vim.keymap.set("n", "<C-S-Right>", "<C-w>v<C-w>p")
vim.keymap.set("n", "<C-S-Left>", "<C-w>q")

