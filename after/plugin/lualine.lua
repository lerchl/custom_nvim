local git_blame = require("gitblame")

require("lualine").setup {
    options = {
        theme = "tokyonight",
        disabled_filetypes = { "alpha" },
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        globalstatus = true
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = { },
        lualine_x = {{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }},
        lualine_y = {"filetype"},
        lualine_z = {'location'}
    },
    extensions = { "neo-tree" }
}

