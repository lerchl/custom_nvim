require("neogit").setup {
	graph_style = "unicode",
	integrations = {
		diffview = true
	}
}

vim.keymap.set("n", "<leader>G", require("neogit").open, { desc = "Open Neogit" })

