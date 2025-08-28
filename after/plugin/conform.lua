local conform = require("conform")

conform.setup {
    log_level = vim.log.levels.DEBUG,
    formatters_by_ft = {
        xml = { "xmlformatter" }
    }
}

conform.formatters.xmlformatter = {
    prepend_args = function()
        return {
            "--indent", vim.opt.expandtab:get() and vim.opt.shiftwidth:get() or "1",
            "--indent-char", vim.opt.expandtab:get() and " " or "\t"
        }
    end
}

vim.keymap.set({ "n", "v" }, "f", function()
    conform.format { lsp_format = "fallback" }
end, { desc = "Format file or range (in visual mode)" })
