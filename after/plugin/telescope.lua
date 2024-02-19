require("telescope").setup {
    defaults = {
        file_ignore_patterns = { "node_modules", "platforms" },
		layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fo", builtin.treesitter, {})

