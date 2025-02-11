require("telescope").setup {
	defaults = {
		file_ignore_patterns = { "node_modules", "target" },
		layout_strategy = "horizontal",
		layout_config = { prompt_position = "top" },
		sorting_strategy = "ascending",
		winblend = 0,
		path_display = { "smart" }
	}
}

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>F", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find git files" })
vim.keymap.set("n", "<leader>fo", function() builtin.treesitter{ ignore_symbols= { "import", "parameter", "var", "" } } end, { desc = "Find treesitter" })
vim.keymap.set("n", "<leader>ft", builtin.live_grep, { desc = "Find text" })
vim.keymap.set("n", "<leader>fm", builtin.keymaps, { desc = "Find keymaps" })
vim.keymap.set("n", "<leader>fh", builtin.highlights, { desc = "Find highlights" })
vim.keymap.set("n", "<leader>fci", builtin.lsp_incoming_calls, { desc = "Find incoming calls" })
vim.keymap.set("n", "<leader>fco", builtin.lsp_outgoing_calls, { desc = "Find outgoing calls" })

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
