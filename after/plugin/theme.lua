require("tokyonight").setup {
	style = "moon",
	terminal_colors = true,
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
	},
}

vim.cmd("colorscheme tokyonight-moon")

