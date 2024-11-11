-- TOKYO NIGHT MOON THEME
-- require("tokyonight").setup {
-- 	style = "moon",
-- 	terminal_colors = true,
-- 	transparent = true,
-- 	styles = {
-- 		sidebar = "transparent",
-- 		floats = "transparent",
-- 		comments = { italic = false },
-- 		keywords = { italic = false },
-- 	},
-- 	on_highlights = function(hl, c)
-- 		hl.BufferlineFileIcon = {
-- 			bg = c.bg_highlight
-- 		}
--
-- 		hl.BufferlineFill = {
-- 			bg = c.bg_statusline
-- 		}
--
-- 		hl.NeoTreeNormal = {
-- 			bg = c.bg
-- 		}
-- 	end
-- }
--
-- vim.cmd("colorscheme tokyonight-moon")

-- CYBERDREAM THEME
-- require("cyberdream").setup {
-- 	-- transparent = true,
-- 	borderless_telescope = false,
-- 	terminal_colors = true
-- }
--
-- vim.cmd("colorscheme cyberdream")

-- OXOCARBON THEME
-- vim.opt.background = "dark"
-- vim.cmd("colorscheme oxocarbon")
--
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- CARBONFOX THEME

-- require("nightfox").setup {
	-- options = {
	-- 	transparent = true
	-- }
-- }

-- CATPUCCIN
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
			LineNr = { fg = "#888888" }
		}
	end
}

vim.cmd("colorscheme catppuccin")
