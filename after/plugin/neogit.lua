require("neogit").setup {
	integrations = {
		diffview = true
	}
}

vim.keymap.set("n", "<leader>G", require("neogit").open, { desc = "Open Neogit" })

