-- local main = "#6a5acd"
-- local main = "#867bc9"
-- local base = "#070707"
--
-- local darken = require("catppuccin.utils.colors").darken

require("catppuccin").setup {
	flavour = "mocha",
	no_italic = true,
	integrations = {
    	diffview = true
	},
	-- color_overrides = {
	-- 	mocha = {
	-- 		base = base,
	-- 		mantle = base,
	-- 		crust = base,
	-- 	},
	-- },
	-- custom_highlights = function (C)
	-- 	return {
	-- 		WinSeparator = { fg = main },
	-- 		FloatBorder = { fg = main },
	-- 		VertSplit = { fg = main },
	-- 		NeoTreeTitleBar = { fg = "#FFFFFF", bg = main },
	-- 		NeoTreeRootName = { fg = main },
	-- 		NeoTreeDirectoryName = { fg = main },
	-- 		NeoTreeDirectoryIcon = { fg = main },
	-- 		LineNr = { fg = "#888888" },
	-- 		-- DiffAdd = { bg = darken(C.green, 0.18, C.base) }, -- diff mode: Added line |diff.txt|
	-- 		-- DiffChange = { bg = darken(C.blue, 0.07, C.base) }, -- diff mode: Changed line |diff.txt|
	-- 		-- DiffDelete = { bg = darken(C.red, 0.18, C.base) }, -- diff mode: Deleted line |diff.txt|
	-- 		-- DiffText = { bg = darken(C.blue, 0.30, C.base) }, -- diff mode: Changed text within a changed line |diff.txt|	
	-- 	}
	-- end
}

vim.cmd("colorscheme catppuccin")
