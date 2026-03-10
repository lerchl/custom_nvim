require("neogit").setup {
	graph_style = "unicode",
	kind = "floating",
	floating = {
		width = 0.9,
		height = 0.85,
	},
	commit_editor = {
		kind = "floating",
	},
	commit_view = {
		kind = "floating",
	},
	integrations = {
		diffview = true
	}
}

vim.keymap.set("n", "<leader>G", require("neogit").open, { desc = "Open Neogit" })

local palette = require("catppuccin.palettes").get_palette("mocha")

vim.api.nvim_set_hl(0, "NeogitFloatBorder", {
	fg = palette.blue,
	bg = "NONE",
})
