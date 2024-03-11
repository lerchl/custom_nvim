require("neo-tree").setup {
	enable_git_status = false,
    filesystem = {
        group_empty_dirs = true
    },
	window = {
		position = "current"
	}
}

vim.keymap.set('n', '-', function()
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
    require('neo-tree.command').execute({ reveal_file = reveal_file }) end,
    { desc = "Show current file in neotree" }
);

