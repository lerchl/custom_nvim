-- local main = "#6a5acd"
local main = "#867bc9"
local base = "#070707"

require("catppuccin").setup {
	flavour = "mocha",
	no_italic = true,
	color_overrides = {
		mocha = {
			base = base,
			mantle = base,
			crust = base,
		},
	},
	custom_highlights = function (C)
		return {
			WinSeparator = { fg = main },
			FloatBorder = { fg = main },
			VertSplit = { fg = main },
			NeoTreeTitleBar = { fg = "#EEEEEE", bg = main },
			NeoTreeRootName = { fg = main },
			NeoTreeDirectoryName = { fg = main },
			NeoTreeDirectoryIcon = { fg = main },
			LineNr = { fg = "#888888" },
			DiffAdd = { fg = C.green },
			DiffChange = { fg = C.gray },
			DiffDelete = { fg = C.red },
			DiffText = { fg = C.blue }
		}
	end
}

vim.cmd("colorscheme catppuccin")
