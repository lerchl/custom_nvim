vim.keymap.set("n", "<leader>w", function () vim.cmd("Bdelete!") end, { noremap = true, silent = true, desc = "Close current buffer (force)" })

