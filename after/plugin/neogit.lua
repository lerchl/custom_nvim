require("neogit").setup {
	integrations = {
		diffview = true
	}
}

vim.keymap.set("n", "<leader>G", function() vim.cmd("Neogit") end, { desc = "Open Neogit" })

