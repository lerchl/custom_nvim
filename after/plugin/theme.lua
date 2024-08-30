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
require("catppuccin").setup {
	flavour = "mocha",
	no_italic = true,
	color_overrides = {
		mocha = {
			base = "#020210",
			mantle = "#020210",
			crust = "#020210",
		},
	},
	custom_highlights = function (C)
		return {
			WinSeparator = { fg = "#8565C4" },
			FloatBorder = { fg = "#8565C4" },
			VertSplit = { fg = "#8565C4" },
			NeoTreeTitleBar = { fg = "#EEEEEE", bg = "#8565C4" },
			NeoTreeRootName = { fg = "#8565C4" },
			NeoTreeDirectoryName = { fg = "#8565C4" },
			NeoTreeDirectoryIcon = { fg = "#8565C4" },
		}
	end
}

vim.cmd("colorscheme catppuccin")
