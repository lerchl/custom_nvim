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

autocmd("BufEnter", {
	callback = function()
		local filetype = vim.bo.filetype;
		if filetype == "neo-tree" or filetype == "NeogitStatus" then
			local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
			hl.blend = 100
			vim.api.nvim_set_hl(0, 'Cursor', hl)
			vim.opt.guicursor:append('a:Cursor/lCursor')
			vim.opt.colorcolumn = ""
		else
			local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
			hl.blend = 0
			vim.api.nvim_set_hl(0, 'Cursor', hl)
			vim.opt.guicursor:remove('a:Cursor/lCursor')
			vim.opt.colorcolumn = "80,120"
		end
	end
})

-- local function is_no_name_buf(buf)
-- 	return
-- 	vim.api.nvim_buf_is_loaded(buf)
-- 	and vim.api.nvim_buf_get_option(buf, 'buflisted')
-- 	and vim.api.nvim_buf_get_name(buf) == ''
-- 	and vim.api.nvim_buf_get_option(buf, 'buftype') == ''
-- 	and vim.api.nvim_buf_get_option(buf, 'filetype') == ''
-- end
--
-- autocmd("BufEnter", {
-- 	callback = function()
-- 		local all_no_name = vim.tbl_filter(is_no_name_buf, vim.api.nvim_list_bufs())
--
-- 		for _, v in pairs(all_no_name) do
-- 			vim.cmd("Alpha")
-- 			vim.cmd("bd" .. v)
-- 		end
-- 	end
-- })
