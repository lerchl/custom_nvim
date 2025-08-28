require("diffview").setup {
	enhanced_diff_hl = true
}

local toggle_diffview = function()
	if next(require('diffview.lib').views) == nil then
		vim.cmd('DiffviewOpen')
	else
		vim.cmd('DiffviewClose')
	end
end

vim.keymap.set("n", "<leader>D", toggle_diffview, { desc = "Toggle Diffview" })
vim.keymap.set("n", "<leader>df", ":DiffviewFileHistory %<CR>", { desc = "Diffview current file history" })

vim.api.nvim_set_hl(0, "DiffAdd", {bg = "#20303b"})
vim.api.nvim_set_hl(0, "DiffDelete", {bg = "#37222c"})
vim.api.nvim_set_hl(0, "DiffChange", {bg = "#1f2231"})
vim.api.nvim_set_hl(0, "DiffText", {bg = "#394b70"})
