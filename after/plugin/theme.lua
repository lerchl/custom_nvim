require("tokyonight").setup {
	style = "storm",
	terminal_colors = true,
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
	},
}

vim.cmd("colorscheme tokyonight-storm")

