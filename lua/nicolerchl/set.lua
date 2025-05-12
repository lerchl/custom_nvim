vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- use tabs
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
vim.opt.wrap = false

-- disable mouse
vim.opt.mouse = ""

if vim.fn.has('mac') == 1 then
	vim.opt.clipboard = "unnamed"
elseif vim.fn.has('unix') == 1 then
	vim.opt.clipboard = "unnamedplus"
end
