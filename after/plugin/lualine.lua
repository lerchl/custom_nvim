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

---   NAVIC

-- local navic = require("nvim-navic")
--
-- local keep_scope = function(scope)
-- 	return scope.type == "Method" or
-- 			scope.type == "Function" or
-- 			scope.type == "Constructor" or
-- 			scope.type == "Class"
-- end
--
-- local get_scope = function()
-- 	local data = util.filter_table(navic.get_data(), keep_scope)
-- 	if #data == 0 then return "no scope" end
-- 	local scope = data[#data]
-- 	local scope_text = scope.icon .. scope.name
--
-- 	if string.len(scope_text) > 65 then
-- 		return string.sub(scope_text, 1, 65) .. "..."
-- 	end
--
-- 	return scope_text
-- end

----- SETUP

local base = "#040404"
local white = "#ffffff"
local main = "#867bc9"

local custom_catppuccin = require("lualine.themes.catppuccin")
custom_catppuccin.normal.a.bg = main
custom_catppuccin.normal.b.bg = white
custom_catppuccin.normal.b.fg = base
custom_catppuccin.insert.b.bg = white
custom_catppuccin.insert.b.fg = base
custom_catppuccin.visual.b.bg = white
custom_catppuccin.visual.b.fg = base
custom_catppuccin.replace.b.bg = white
custom_catppuccin.replace.b.fg = base
custom_catppuccin.command.b.bg = white
custom_catppuccin.command.b.fg = base
custom_catppuccin.inactive.b.bg = white
custom_catppuccin.inactive.b.fg = base
custom_catppuccin.normal.c.bg = base

require("lualine").setup {
	options = {
		theme = custom_catppuccin,
		component_separators = "",
		section_separators = "",
		globalstatus = true
	},
	sections = {
		lualine_a = {{ "mode", color = { fg = base } }},
		lualine_b = {{ "branch" }}, -- , separator = { left = "", right = "" }
		lualine_c = { "diff", "diagnostics" }, -- "filename", { "", separator = { left = "", right = "" }, color = { bg = "6a5acd" }, draw_empty = true }, { "", separator = { left = "", right = "" }, color = { bg = "8e84cc" }, draw_empty = true }, { "", separator = { left = "", right = "" }, color = { bg = "a8a3cc" }, draw_empty = true }, { get_scope, cond = navic.is_available, separator = { left = "", right = "" }, color = { fg = "000000", bg = "ffffff" } },
		lualine_x = {{ get_git_blame, cond = has_git_blame, color = { fg = white } }, { "encoding", color = { fg = white } }},
		lualine_y = { },
		lualine_z = {{ "location", color = { fg = base } }, { "progress", color = { fg = base } }} -- , separator = { left = "" }, color = { fg = "ffffff" }
	},
}

