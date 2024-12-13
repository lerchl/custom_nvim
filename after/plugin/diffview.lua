require("diffview").setup {
	diff_binaries = false,
	use_icons = false
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
