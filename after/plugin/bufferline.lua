local bufferline = require("bufferline")
bufferline.setup {
	options = {
		numbers = "ordinal",
		buffer_close_icon = "",
		close_icon = "",
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				text_align = "center",
				separator = true
			}
		}
	}
}

for i = 1, 9 do
	vim.keymap.set(
		"n",
		("<leader>%s"):format(i),
		function() bufferline.go_to_buffer(i, true) end,
		{ desc = ("Tab %s"):format(i) }
	)
end

local function is_no_name_buf(buf)
	return
	vim.api.nvim_buf_is_loaded(buf)
	and vim.api.nvim_buf_get_option(buf, 'buflisted')
	and vim.api.nvim_buf_get_name(buf) == ''
	and vim.api.nvim_buf_get_option(buf, 'buftype') == ''
	and vim.api.nvim_buf_get_option(buf, 'filetype') == ''
end

local close_tab = function()
	local buffer_count = #vim.fn.getbufinfo({buflisted = 1})

	if buffer_count > 1 then
		vim.cmd("bp | bd #")
	else
		vim.cmd("bd")
		vim.cmd("Alpha")

		local all_no_name = vim.tbl_filter(is_no_name_buf, vim.api.nvim_list_bufs())
		for _, v in pairs(all_no_name) do
			vim.cmd("bd" .. v)
		end
	end
end

vim.keymap.set("n", "t", "")
vim.keymap.set("n", "tw", close_tab, { desc = "Close current tab" })
vim.keymap.set("n", "tc<Left>", vim.cmd.BufferLineCloseLeft, { desc = "Close left tabs" })
vim.keymap.set("n", "tc<Right>", vim.cmd.BufferLineCloseRight, { desc = "Close right tabs" })
vim.keymap.set("n", "tcw", vim.cmd.BufferLineCloseOther, { desc = "Close other tabs" })

