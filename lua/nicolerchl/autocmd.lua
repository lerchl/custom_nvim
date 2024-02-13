vim.api.nvim_create_autocmd({ "BufAdd" }, {
	callback = function ()
		print(vim.cmd("ls"))
		-- Get a list of buffers
		-- local buffers = vim.fn.getbufinfo()
		--
		-- local no_name_buffer_id = nil
		-- -- Loop through the list of buffers to find the one named "[No Name]"
		-- for _, buffer in ipairs(buffers) do
		-- 	print(buffer.name)
		-- 	if buffer.name == "[No Name]" then
		-- 		no_name_buffer_id = buffer.bufnr
		-- 		break
		-- 	end
		-- end
		--
		-- -- Check if the "[No Name]" buffer was found and delete it
		-- if no_name_buffer_id then
		-- 	vim.cmd("bdelete " .. no_name_buffer_id)
		-- end
	end
})

