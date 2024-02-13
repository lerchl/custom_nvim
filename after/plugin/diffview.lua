local toggle_diffview = function()
	if next(require('diffview.lib').views) == nil then
		vim.cmd('DiffviewOpen')
	else
		vim.cmd('DiffviewClose')
	end
end

vim.keymap.set("n", "<leader>gd", toggle_diffview, { desc = "Toggle Diffview" })

