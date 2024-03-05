require("catppuccin").setup {
	no_italic = true,
	color_overrides = {
		mocha = {
			base = "#111111",
			mantle = "#111111",
			crust = "#111111"
		}
	},
	integrations = {
		alpha = true,
		mason = true,
		treesitter = true,
		telescope = {
			enabled = true
		},
		which_key = true
	}
}

vim.cmd("colorscheme catppuccin-mocha")

