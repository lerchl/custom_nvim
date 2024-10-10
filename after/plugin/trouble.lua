require("trouble").setup()

vim.keymap.set("n", "<leader>ts", "<cmd>Trouble symbols toggle win.relative=win win.position=right<cr>", { desc = "Toggle Symbols" })
vim.keymap.set("n", "<leader>td", "<cmd>Trouble diagnostics toggle filter.buf=0 win.relative=win win.position=bottom<cr>", { desc = "Toggle Diagnostics" })

