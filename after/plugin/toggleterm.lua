require("toggleterm").setup()

vim.keymap.set("n", "<leader>j", vim.cmd.ToggleTerm, { desc = "Toggle terminal" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")

