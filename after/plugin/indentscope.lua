require("mini.indentscope").setup {
    symbol = "│"
}

vim.api.nvim_create_autocmd({ "FileType" }, {
    desc = "Disable indentscope for certain filetypes",
    callback = function()
        local ignore_filetypes = {
            "lspinfo",
            "packer",
            "checkhealth",
            "help",
            "man",
            "gitcommit",
            "TelescopePrompt",
            "TelescopeResults",
            "NvimTree",
            "alpha"
        }
    if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
        vim.b.miniindentscope_disable = true
    end
end})

