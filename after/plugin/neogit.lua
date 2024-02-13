require("neogit").setup {
	integrations = {
		diffview = true
	}
}

vim.keymap.set("n", "<leader>gg", function() vim.cmd("Neogit") end, { desc = "Open Neogit" })

