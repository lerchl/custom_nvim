require("catppuccin").setup {
	flavour = "mocha",
	no_italic = true,
	integrations = {
    	diffview = true
	},
	custom_highlights = function (C)
		return {
			Normal = { fg = "#BBBBCC" },
			NeoTreeNormal = { fg = "#BBBBCC" }
		}
	end
}

vim.cmd("colorscheme catppuccin")
