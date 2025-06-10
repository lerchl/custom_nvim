require("catppuccin").setup {
    flavour = "mocha",
    no_italic = true,
    integrations = {
        diffview = true
    }
}

vim.cmd("colorscheme catppuccin")
