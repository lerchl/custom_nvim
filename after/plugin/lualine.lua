require("lualine").setup {
    options = {
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = { },
        lualine_x = {'filetype'},
        lualine_y = { },
        lualine_z = {'location'}
    },
    extensions = { "neo-tree" }
}

