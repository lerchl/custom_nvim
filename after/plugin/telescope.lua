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
vim.keymap.set("n", "<leader>F", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fo", function() builtin.treesitter{ ignore_symbols= { "import", "parameter", "var" } } end, { desc = "Find Treesitter" })
vim.keymap.set("n", "<leader>ft", builtin.live_grep, { desc = "Find Text" })
vim.keymap.set("n", "<leader>fm", builtin.keymaps, { desc = "Find Keymaps" })
vim.keymap.set("n", "<leader>fh", builtin.highlights, { desc = "Find Highlights" })

local action_state = require("telescope.actions.state")

vim.keymap.set("n", "<leader> ", function()
	builtin.buffers {
		ignore_current_buffer = false,
		attach_mappings = function(prompt_bufnr, map)
			local delete_buffer = function()
				local current_picker = action_state.get_current_picker(prompt_bufnr)
				current_picker:delete_selection(function(selection)
					vim.api.nvim_buf_delete(selection.bufnr, { force = true })
				end)
			end

			map("i", "<c-d>", delete_buffer)

			return true
		end
	}
end, { desc = "Find Buffers" })
