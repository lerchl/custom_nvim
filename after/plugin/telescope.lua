local open_with_trouble = require("trouble.sources.telescope").open

require("telescope").setup {
	defaults = {
		file_ignore_patterns = { "node_modules" },
		layout_strategy = "horizontal",
		layout_config = { prompt_position = "top" },
		sorting_strategy = "ascending",
		winblend = 0,
		path_display = { "smart" },
		mappings = {
			i = { ["<c-t>"] = open_with_trouble },
			n = { ["<c-t>"] = open_with_trouble },
		}
	}
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', "<leader>F", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>O", function() builtin.treesitter{ ignore_symbols= { "import", "parameter", "var" } } end, { desc = "Find Treesitter" })
vim.keymap.set("n", "<leader>ft", builtin.live_grep, { desc = "Find Text" })
vim.keymap.set("n", "<leader>fm", builtin.keymaps, { desc = "Find Keymaps" })
vim.keymap.set("n", "<leader>fh", builtin.highlights, { desc = "Find Highlights" })
