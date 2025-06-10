local palette = require("catppuccin.palettes").get_palette("mocha")

local bufferline = require("bufferline")

bufferline .setup {
    options = {
        diagnostics = "nvim_lsp",
        numbers = "ordinal",
        show_buffer_close_icons = false,
        show_close_icon = false
    },
    highlights = {
        fill = { fg = palette.text, bg = palette.base },
        background = { fg = palette.text, bg = palette.base },
        tab = { fg = palette.text, bg = palette.surface0 },
        tab_selected = { fg = palette.blue, bg = palette.surface0 },
        tab_separator = { fg = palette.surface0, bg = palette.base },
        tab_separator_selected = { fg = palette.blue, bg = palette.surface0, sp = palette.blue, underline = true },
        tab_close = { fg = palette.red, bg = palette.base },
        close_button = { fg = palette.red, bg = palette.base },
        close_button_visible = { fg = palette.red, bg = palette.base },
        close_button_selected = { fg = palette.red, bg = palette.surface0 },
        buffer_visible = { fg = palette.text, bg = palette.base },
        buffer_selected = { fg = palette.text, bg = palette.surface0, bold = true, italic = true },
        numbers = { fg = palette.text, bg = palette.base },
        numbers_visible = { fg = palette.text, bg = palette.base },
        numbers_selected = { fg = palette.text, bg = palette.surface0, bold = true, italic = true },
        diagnostic = { fg = palette.yellow, bg = palette.base },
        diagnostic_visible = { fg = palette.yellow, bg = palette.base },
        diagnostic_selected = { fg = palette.yellow, bg = palette.surface0, bold = true, italic = true },
        hint = { fg = palette.teal, sp = palette.teal, bg = palette.base },
        hint_visible = { fg = palette.teal, bg = palette.base },
        hint_selected = { fg = palette.teal, bg = palette.surface0, sp = palette.teal, bold = true, italic = true },
        hint_diagnostic = { fg = palette.teal, sp = palette.teal, bg = palette.base },
        hint_diagnostic_visible = { fg = palette.teal, bg = palette.base },
        hint_diagnostic_selected = { fg = palette.teal, bg = palette.surface0, sp = palette.teal, bold = true, italic = true },
        info = { fg = palette.blue, sp = palette.blue, bg = palette.base },
        info_visible = { fg = palette.blue, bg = palette.base },
        info_selected = { fg = palette.blue, bg = palette.surface0, sp = palette.blue, bold = true, italic = true },
        info_diagnostic = { fg = palette.blue, sp = palette.blue, bg = palette.base },
        info_diagnostic_visible = { fg = palette.blue, bg = palette.base },
        info_diagnostic_selected = { fg = palette.blue, bg = palette.surface0, sp = palette.blue, bold = true, italic = true },
        warning = { fg = palette.peach, sp = palette.peach, bg = palette.base },
        warning_visible = { fg = palette.peach, bg = palette.base },
        warning_selected = { fg = palette.peach, bg = palette.surface0, sp = palette.peach, bold = true, italic = true },
        warning_diagnostic = { fg = palette.peach, sp = palette.peach, bg = palette.base },
        warning_diagnostic_visible = { fg = palette.peach, bg = palette.base },
        warning_diagnostic_selected = { fg = palette.peach, bg = palette.surface0, sp = palette.peach, bold = true, italic = true },
        error = { fg = palette.red, bg = palette.base, sp = palette.red },
        error_visible = { fg = palette.red, bg = palette.base },
        error_selected = { fg = palette.red, bg = palette.surface0, sp = palette.red, bold = true, italic = true },
        error_diagnostic = { fg = palette.red, bg = palette.base, sp = palette.red },
        error_diagnostic_visible = { fg = palette.red, bg = palette.base },
        error_diagnostic_selected = { fg = palette.red, bg = palette.surface0, sp = palette.red, bold = true, italic = true },
        modified = { fg = palette.peach, bg = palette.base },
        modified_visible = { fg = palette.peach, bg = palette.base },
        modified_selected = { fg = palette.peach, bg = palette.surface0 },
        duplicate_selected = { fg = palette.overlay1, bg = palette.surface0, italic = true },
        duplicate_visible = { fg = palette.overlay1, bg = palette.base, italic = true },
        duplicate = { fg = palette.overlay1, bg = palette.base, italic = true },
        separator_selected = { fg = palette.surface0, bg = palette.surface0 },
        separator_visible = { fg = palette.base, bg = palette.base },
        separator = { fg = palette.surface0, bg = palette.base },
        indicator_visible = { fg = palette.blue, bg = palette.base },
        indicator_selected = { fg = palette.blue, bg = palette.surface0 },
        pick_selected = { fg = palette.mauve, bg = palette.surface0, bold = true, italic = true },
        pick_visible = { fg = palette.mauve, bg = palette.base, bold = true, italic = true },
        pick = { fg = palette.mauve, bg = palette.base, bold = true, italic = true },
        offset_separator = { fg = palette.surface0, bg = palette.base },
        trunc_marker = { fg = palette.overlay0, bg = palette.base },
    }
}

vim.keymap.set("n", "<leader>bc<left>", function() vim.cmd("BufferLineCloseLeft") end, { noremap = true, silent = true, desc = "Close buffers left of current" })
vim.keymap.set("n", "<leader>bc<right>", function() vim.cmd("BufferLineCloseRight") end, { noremap = true, silent = true, desc = "Close buffers right of current" })
vim.keymap.set("n", "<leader>bco", function() vim.cmd("BufferLineCloseOthers") end, { noremap = true, silent = true, desc = "Close all other buffers" })

for index = 1, 9 do
    vim.keymap.set("n", "<leader>" .. index, function() vim.cmd("BufferLineGoToBuffer " .. index) end, { noremap = true, silent = true, desc = "Go to buffer " .. index })
end
