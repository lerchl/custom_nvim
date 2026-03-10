require("catppuccin").setup {
    flavour = "mocha",
    no_italic = true,
    integrations = {
        diffview = true
    }
}

vim.cmd("colorscheme catppuccin")

local palette = require("catppuccin.palettes").get_palette("mocha")

vim.api.nvim_set_hl(0, "FloatBorder", { fg = palette.blue, bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NeogitFloatBorder", { fg = "#89b4fa", bg = "NONE" })
