-- leader
vim.g.mapleader = " "

-- saving
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { silent = true })
vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })

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

-- buffers
vim.keymap.set("n", "<A-Right>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<A-Left>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })


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

