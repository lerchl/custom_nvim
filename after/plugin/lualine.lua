local git_blame = require("gitblame")

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
        lualine_x = {{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }},
        lualine_y = {"filetype"},
        lualine_z = {'location'}
    }
}

