local gitblame = require("gitblame")

gitblame.setup {
	enabled = false,
    display_virtual_text = true,
    date_format = "%r",
	message_when_not_committed = ""
}

vim.keymap.set("n", "<leader>gb", gitblame.toggle, { noremap = true, silent = true, desc = "Toggle git blame" })

