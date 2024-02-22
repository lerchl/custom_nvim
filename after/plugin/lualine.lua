local git_blame = require("gitblame")

local git_blame_condition = function()
	local filetype = vim.bo.filetype;
	return git_blame.is_blame_text_available() and
			filetype ~= "neo-tree" and
			filetype ~= "toggleterm" and
			filetype ~= "alpha" and
			filetype ~= "NeogitStatus"
end

require("lualine").setup {
    options = {
        theme = "catppuccin",
        component_separators = '',
		section_separators = { left = ' ', right = '' },
		globalstatus = true
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = { "diff", "diagnostics" },
        lualine_x = {{ git_blame.get_current_blame_text, cond = git_blame_condition }},
        lualine_y = {"filetype"},
        lualine_z = {'location'}
    }
}

