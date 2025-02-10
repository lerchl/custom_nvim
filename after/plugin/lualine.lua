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

----- SETUP

local custom_catppuccin = require("lualine.themes.catppuccin")

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
		lualine_c = { "filename" },
		lualine_x = {{ get_git_blame, cond = has_git_blame }, "encoding" },
		lualine_y = {},
		lualine_z = {{ "location" , separator = { left = "" }}, { "progress" }}
	},
}

