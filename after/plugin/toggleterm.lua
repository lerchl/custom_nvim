require("toggleterm").setup()

vim.keymap.set("n", "<leader>j", vim.cmd.ToggleTerm)
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")

