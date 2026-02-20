local ui = require("nicolerchl.ui")

require("blink.cmp").setup {
    keymap = {
        preset = "super-tab",
    },
    appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
    },
    completion = {
        documentation = {
            auto_show = true,
            window = {
                border = ui.border,
                winblend = ui.winblend,
            },
        },
        menu = {
            border = ui.border,
            winblend = ui.winblend,
        },
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
}
