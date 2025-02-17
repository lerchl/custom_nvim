require("trouble").setup()

vim.keymap.set("n", "<leader>T", ":Trouble toggle diagnostics filter = { severity=vim.diagnostic.severity.WARNING } preview = { type = \"split\", relative = \"win\", position = \"right\", size = 0.5 }<CR>", { noremap = true, silent = true, desc = "Open trouble" })
