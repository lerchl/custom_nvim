-- leader
vim.g.mapleader = " "

-- saving, writing twice to fix eol
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>:w<CR>", { silent = true })
vim.keymap.set("n", "<C-s>", ":w<CR>:w<CR>", { silent = true })

-- moving between windows
vim.keymap.set("n", "<C-Left>", "<C-w>h")
vim.keymap.set("n", "<C-Down>", "<C-w>j")
vim.keymap.set("n", "<C-Up>", "<C-w>k")
vim.keymap.set("n", "<C-Right>", "<C-w>l")

-- create and close splits
vim.keymap.set("n", "<C-S-Right>", "<C-w>v<C-w>p")
vim.keymap.set("n", "<C-S-Down>", "<C-w>s")
vim.keymap.set("n", "<C-S-Left>", "<C-w>q")

-- Resize window horizontally with Shift + arrow keys
vim.keymap.set('n', '<S-Right>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Left>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- Resize window vertically with Shift + arrow keys
vim.keymap.set('n', '<S-Up>', ':resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Down>', ':resize -2<CR>', { noremap = true, silent = true })

-- tabs
for i = 1, 9 do
	vim.keymap.set(
		"n",
		("<leader>t%s"):format(i),
		("%sgt"):format(i),
		{ desc = ("Tab %s"):format(i) }
	)
end
vim.keymap.set("n", "<leader>tw", ":tabclose<CR>", { desc = "Close tab" })

-- find
vim.keymap.set("n", "<leader>fr", "cgn", { silent = true, desc = "Replace" })
vim.keymap.set("n", "<leader>fs", ":noh<CR>", { silent = true, desc = "Stop finding" })

-- tabs / spaces
local function toggleSpacesTabs()
	if vim.opt.expandtab:get() then
		vim.opt.expandtab = false
	else
		vim.opt.expandtab = true
	end
end

local function setSpaces(spaces)
    vim.opt.shiftwidth = spaces
end

vim.keymap.set("n", "<leader>ts", toggleSpacesTabs, { noremap = true, silent = true, desc = "Toggle between tabs and spaces for indentation" })
vim.keymap.set("n", "<leader>s2", function () setSpaces(2) end, { noremap = true, silent = true, desc = "Use 2 spaces for indentation" })
vim.keymap.set("n", "<leader>s4", function () setSpaces(4) end, { noremap = true, silent = true, desc = "Use 4 spaces for indentation" })
