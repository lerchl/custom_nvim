require("neo-tree").setup {
	enable_git_status = false,
	filesystem = {
		group_empty_dirs = true,
		use_libuv_file_watcher = true
	},
	window = {
		position = "current"
	}
}

local show_current_file = function()
	local reveal_file = vim.fn.expand('%:p')
	if (reveal_file == '') then
		reveal_file = vim.fn.getcwd()
	else
		local f = io.open(reveal_file, "r")
		if (f) then
			f.close(f)
		else
			reveal_file = vim.fn.getcwd()
		end
	end
	require('neo-tree.command').execute({ reveal_file = reveal_file })
end

vim.keymap.set('n', '-', show_current_file, { desc = "Show current file in neotree" });

