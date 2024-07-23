vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.statuscolumn = "%s %r "

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true

vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.hidden = true
vim.opt.fixendofline = false
vim.opt.wrap = false

vim.api.nvim_set_option("clipboard", "unnamed")

