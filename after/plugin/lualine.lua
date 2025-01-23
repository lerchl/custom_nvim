-- local util = require("nicolerchl.util")

----- INTEGERATIONS
---   GIT

local git_blame = require("gitblame")

local has_git_blame = function()
	local filetype = vim.bo.filetype;
	return git_blame.is_blame_text_available() and
	filetype ~= "neo-tree" and
	filetype ~= "toggleterm" and
	filetype ~= "alpha" and
	filetype ~= "NeogitStatus"
end

local get_git_blame = function()
	local blame_text = git_blame.get_current_blame_text()

	if string.len(blame_text) > 65 then
		return string.sub(blame_text, 1, 65) .. "..."
	end

	return blame_text
end

---   BUFFERS

local buffers = function()
	-- Get the buffer list
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })
	-- Get the current buffer number
	local current_bufnr = vim.api.nvim_get_current_buf()
	-- Initialize buffer names
	local previous_buffer, current_buffer, next_buffer = '', '', ''

	-- Get diagnostics for the current buffer
	local diagnostics = vim.diagnostic.get(current_bufnr)
	local diagnostic_counts = { errors = 0, warnings = 0, hints = 0 }
	for _, diag in ipairs(diagnostics) do
		if diag.severity == vim.diagnostic.severity.ERROR then
			diagnostic_counts.errors = diagnostic_counts.errors + 1
		elseif diag.severity == vim.diagnostic.severity.WARN then
			diagnostic_counts.warnings = diagnostic_counts.warnings + 1
		elseif diag.severity == vim.diagnostic.severity.HINT then
			diagnostic_counts.hints = diagnostic_counts.hints + 1
		end
	end

	-- Build diagnostics string
	local diagnostic_str = string.format(
	' %d  %d  %d',
	diagnostic_counts.errors,
	diagnostic_counts.warnings,
	diagnostic_counts.hints
	)

	-- Find the previous, current, and next buffers
	for i, buf in ipairs(buffers) do
		if buf.bufnr == current_bufnr then
			-- Set current buffer name
			current_buffer = vim.fn.fnamemodify(buf.name, ':t')
			-- Append diagnostics to current buffer
			current_buffer = string.format('%%#LualineCurrentBuffer#%s%%* %s', current_buffer, diagnostic_str)
			-- Set previous buffer name
			if i > 1 then
				previous_buffer = vim.fn.fnamemodify(buffers[i - 1].name, ':t')
			end
			-- Set next buffer name
			if i < #buffers then
				next_buffer = vim.fn.fnamemodify(buffers[i + 1].name, ':t')
			end
			break
		end
	end

	-- Use fancy chevrons and format the result
	local left_chevron = ''
	local right_chevron = ''
	return string.format('%s %s %s %s %s',
	previous_buffer ~= '' and previous_buffer or 'No Prev',
	left_chevron,
	current_buffer ~= '' and current_buffer or 'No Current',
	right_chevron,
	next_buffer ~= '' and next_buffer or 'No Next'
	)
end

----- SETUP

-- local base = "#070707"
-- local white = "#ffffff"
-- local main = "#867bc9"

local custom_catppuccin = require("lualine.themes.catppuccin")
-- custom_catppuccin.normal.a.bg = main
-- custom_catppuccin.normal.b.bg = white
-- custom_catppuccin.normal.b.fg = base
-- custom_catppuccin.insert.b.bg = white
-- custom_catppuccin.insert.b.fg = base
-- custom_catppuccin.visual.b.bg = white
-- custom_catppuccin.visual.b.fg = base
-- custom_catppuccin.replace.b.bg = white
-- custom_catppuccin.replace.b.fg = base
-- custom_catppuccin.command.b.bg = white
-- custom_catppuccin.command.b.fg = base
-- custom_catppuccin.inactive.b.bg = white
-- custom_catppuccin.inactive.b.fg = base
-- custom_catppuccin.normal.c.bg = base

-- Define custom highlight groups
-- vim.api.nvim_set_hl(0, 'LualineCurrentBuffer', { fg = main, bold = true })  -- Gold for the current buffer

require("lualine").setup {
	options = {
		theme = custom_catppuccin,
		component_separators = "",
		section_separators = "",
		globalstatus = true
	},
	sections = {
		lualine_a = {{ "mode" }},
		lualine_b = {{ "branch", separator = { left = "", right = "" } }},
		lualine_c = { '%=', buffers },
		lualine_x = {{ "encoding" }}, -- { get_git_blame, cond = has_git_blame, color = { fg = white }}, 
		lualine_y = {},
		lualine_z = {{ "location" , separator = { left = "" }}, { "progress" }}
	},
}

