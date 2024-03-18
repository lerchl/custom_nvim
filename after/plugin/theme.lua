vim.cmd("colorscheme tokyonight-moon")

require("tokyonight").setup {
	style = "moon",
	terminal_colors = true,
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
	},
	on_highlights = function(hl, c)
		hl.BufferlineFileIcon = {
			bg = c.bg_highlight
		}

		hl.BufferlineFill = {
			bg = c.bg_statusline
		}

		hl.NeoTreeNormal = {
			bg = c.bg
		}
	end
}

vim.cmd("colorscheme tokyonight-moon")

