local util = require("nicolerchl.util")

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

---   NAVIC

local navic = require("nvim-navic")

local keep_scope = function(scope)
	return scope.type == "Method" or
			scope.type == "Function" or
			scope.type == "Constructor" or
			scope.type == "Class"
end

local get_scope = function()
	local data = util.filter_table(navic.get_data(), keep_scope)
	if #data == 0 then return "no scope" end
	local scope = data[#data]
	local scope_text = scope.icon .. scope.name

	if string.len(scope_text) > 65 then
		return string.sub(scope_text, 1, 65) .. "..."
	end

	return scope_text
end

----- SETUP

local custom_catppuccin = require("lualine.themes.catppuccin")
custom_catppuccin.normal.a.bg = "#8565C4"
custom_catppuccin.normal.b.fg = "#C0AEE0"
custom_catppuccin.normal.c.bg = "#020210"

require("lualine").setup {
	options = {
		theme = custom_catppuccin,
		component_separators = "",
		section_separators = "",
		globalstatus = true
	},
	sections = {
		lualine_a = {{ "mode", color = { fg = "FFFFFF" } }},
		lualine_b = {{ "branch", separator = { left = "", right = "" } }},
		lualine_c = { "filename", { "", separator = { left = "", right = "" }, color = { bg = "8565C4" }, draw_empty = true }, { "", separator = { left = "", right = "" }, color = { bg = "A28AD2" }, draw_empty = true }, { "", separator = { left = "", right = "" }, color = { bg = "C0AEE0" }, draw_empty = true }, { get_scope, cond = navic.is_available, separator = { left = "", right = "" }, color = { fg = "000000", bg = "ffffff" } }, "diff", "diagnostics" },
		lualine_x = {{ get_git_blame, cond = has_git_blame }, "encoding" },
		lualine_y = { },
		lualine_z = {{ "location", separator = { left = "" }, color = { fg = "FFFFFF" } }, { "progress", color = { fg = "FFFFFF" } }}
	},
}

