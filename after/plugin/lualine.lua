local util = require("nicolerchl.util")

local git_blame = require("gitblame")
local navic = require("nvim-navic")

local git_blame_condition = function()
	local filetype = vim.bo.filetype;
	return git_blame.is_blame_text_available() and
	filetype ~= "neo-tree" and
	filetype ~= "toggleterm" and
	filetype ~= "alpha" and
	filetype ~= "NeogitStatus"
end

local git_blame_getter = function()
	local blame_text = git_blame.get_current_blame_text()

	if string.len(blame_text) > 65 then
		return string.sub(blame_text, 1, 65) .. "..."
	end

	return blame_text
end

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

require("lualine").setup {
	options = {
		component_separators = "",
		section_separators = "",
		globalstatus = true
	},
	sections = {
		lualine_a = {{ "mode", color = { fg = "eeeeee" } }},
		lualine_b = {{ "branch", separator = { left = "", right = "" } }},
		lualine_c = { "filename", { "", separator = { left = "", right = "" }, color = { bg = "FF6D6A" }, draw_empty = true }, { "", separator = { left = "", right = "" }, color = { bg = "B1A2CA" }, draw_empty = true }, { "", separator = { left = "", right = "" }, color = { bg = "8BD3E6" }, draw_empty = true }, { get_scope, cond = navic.is_available, separator = { left = "", right = "" }, color = { fg = "000000", bg = "ffffff" } }, "diff", "diagnostics" },
		lualine_x = {{ git_blame_getter, cond = git_blame_condition }, "encoding" },
		lualine_y = { },
		lualine_z = {{ "location", separator = { left = "" }, color = { fg = "eeeeee" } }, { "progress", color = { fg = "eeeeee" } }}
	},
}

