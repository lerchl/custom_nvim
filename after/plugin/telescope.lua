require("telescope").setup {
	defaults = {
		file_ignore_patterns = { "node_modules" },
		layout_strategy = "horizontal",
		layout_config = { prompt_position = "top" },
		sorting_strategy = "ascending",
		winblend = 0,
		path_display = { "smart" }
	}
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fO", function() builtin.treesitter{ ignore_symbols= { "import", "parameter", "var" } } end, { desc = "Find Treesitter" })
vim.keymap.set("n", "<leader>ft", builtin.live_grep, { desc = "Find Text" })
vim.keymap.set("n", "<leader>fm", builtin.keymaps, { desc = "Find Keymaps" })

