local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    group = 'YankHighlight',
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
    end
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
    pattern = '',
    command = 'set fo-=c fo-=r fo-=o'
})

autocmd({ "BufNewFile", "BufRead", "BufWritePost" }, {
    pattern = "*",
    command = "setl fixeol"
})

-- Function to detect if running on macOS
local is_mac = vim.fn.has("macunix") == 1

-- Function to set indentation based on file type and path
local set_indentation = function()
    local filetype = vim.bo.filetype
    local filepath = vim.fn.expand('%:p')

    if filetype == "yaml" then
        vim.opt.expandtab = true
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
    elseif is_mac and not filepath:match("^" .. vim.fn.expand("~/.config/nvim")) then
        vim.opt.expandtab = false
        vim.opt.tabstop = 4
        vim.opt.shiftwidth = 4
    else
        vim.opt.expandtab = true
        vim.opt.tabstop = 4
        vim.opt.shiftwidth = 4
    end
end

-- Apply the function on buffer read and file type detection
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*",
    callback = set_indentation
})
