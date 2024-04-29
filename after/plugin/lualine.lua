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

local get_named_scope = function(data, type)
	for _, v in pairs(data) do
		if v.type == type then
			return v
		end
	end
	return nil
end

local get_scope = function()
	local data = navic.get_data()

	local scope = get_named_scope(data, "Function")

	if scope == nil then
		scope = get_named_scope(data, "Class")
	end

	if scope == nil then
		return ""
	end

	return scope.name
end

require("lualine").setup {
	options = {
		component_separators = "",
		section_separators = { left = '', right = '' },
		globalstatus = true
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch' },
		lualine_c = { "filename", "diff", "diagnostics" },
		lualine_x = {
			{ git_blame.get_current_blame_text, cond = git_blame_condition },
			{ get_scope, cond = navic.is_available, separator = { left = "" }, color = { fg = "000000", bg = "ffffff" }  },
			{ function() return "󰅁" end, padding = { left = 0, right = 0 }, color = { fg = "f72585" }, draw_empty = true },
			{ function() return "󰅁" end, padding = { left = 0, right = 0 }, color = { fg = "3f37c9" }, draw_empty = true },
			{ function() return "󰅁" end, padding = { left = 0, right = 0 }, color = { fg = "4cc9f0" }, draw_empty = true },
			"encoding"
		},
		lualine_y = { "filetype" },
		lualine_z = { "location", "progress"  }
	},
}

