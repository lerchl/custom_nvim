local bufferline = require("bufferline")

bufferline.setup {
	options = {
		numbers = "ordinal",
		buffer_close_icon = "",
		close_icon = "",
		diagnostics = "nvim_lsp",
		style_preset = {
			bufferline.style_preset.no_italic
		},
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				text_align = "center",
				separator = true
			}
		},
	},
}

for i = 1, 9 do
	vim.keymap.set(
		"n",
		("<leader>%s"):format(i),
		function() bufferline.go_to_buffer(i, true) end,
		{ desc = ("Buffer %s"):format(i) }
	)
end

vim.keymap.set("n", "<A-Right>", function() bufferline.cycle(1) end, { desc = "Next buffer" })
vim.keymap.set("n", "<A-Left>", function() bufferline.cycle(-1) end, { desc = "Previous buffer" })

local close_buffer = function()
	local buffer_count = #vim.fn.getbufinfo({buflisted = 1})

	if buffer_count > 1 then
		vim.cmd("bp | bd #")
	else
		vim.cmd("bd")
	end
end

vim.keymap.set("n", "<leader>w", close_buffer, { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bc<Left>", vim.cmd.BufferLineCloseLeft, { desc = "Close left buffers" })
vim.keymap.set("n", "<leader>bc<Right>", vim.cmd.BufferLineCloseRight, { desc = "Close right buffers" })
vim.keymap.set("n", "<leader>bco", vim.cmd.BufferLineCloseOther, { desc = "Close other buffers" })
vim.keymap.set("n", "<leader>bcw", function() vim.cmd("bufdo bwipeout") end, { desc = "Close all buffers" })

