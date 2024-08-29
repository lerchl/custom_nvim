local bufferline = require("bufferline")

bufferline.setup {
	options = {
		numbers = "ordinal",
		diagnostics = "nvim_lsp",
		buffer_close_icon = ""
	},
	highlights = {
		fill = {
			fg = '#eeeeee',  -- Text color
			bg = '#020210',  -- Background color for the bufferline
		},
		background = {
			fg = '#eeeeee',  -- Text color for non-selected buffers
			bg = '#020210',  -- Background color for non-selected buffers
		},
		tab = {
			fg = '#eeeeee',  -- Text color for non-selected tabs
			bg = '#020210',  -- Background color for non-selected tabs
		},
		tab_selected = {
			fg = '#eeeeee',  -- Text color for selected tabs
			bg = '#8565C4',  -- Background color for selected tabs
		},
		tab_separator = {
			fg = '#020210',   -- Match with the bufferline background
			bg = '#020210',   -- Match with the bufferline background
		},
		tab_separator_selected = {
			fg = '#8565C4',   -- Match with selected buffer background
			bg = '#8565C4',   -- Match with selected buffer background
		},
		buffer_visible = {
			fg = '#eeeeee',  -- Text color for visible but non-selected buffer
			bg = '#020210',  -- Match with bufferline background
		},
		buffer_selected = {
			fg = '#eeeeee',  -- Text color for selected buffer
			bg = '#8565C4',  -- Background color for selected buffer
			bold = true,
		},
		numbers = {
			fg = '#eeeeee',  -- Text color for buffer numbers
			bg = '#020210',  -- Match with bufferline background
		},
		numbers_visible = {
			fg = '#eeeeee',  -- Text color for visible buffer numbers
			bg = '#020210',  -- Match with bufferline background
		},
		numbers_selected = {
			fg = '#eeeeee',  -- Text color for selected buffer numbers
			bg = '#8565C4',  -- Match with selected buffer background
			bold = true,
		},
		separator_selected = {
			fg = '#8565C4',  -- Match with selected buffer background
			bg = '#8565C4',  -- Match with selected buffer background
		},
		separator_visible = {
			fg = '#020210',  -- Match with bufferline background
			bg = '#020210',  -- Match with bufferline background
		},
		separator = {
			fg = '#020210',  -- Match with bufferline background
			bg = '#020210',  -- Match with bufferline background
		},
		indicator_visible = {
			fg = '#020210',  -- Match with bufferline background
			bg = '#020210',  -- Match with bufferline background
		},
		indicator_selected = {
			fg = '#eeeeee',  -- Text color for selected buffer indicator
			bg = '#8565C4',  -- Match with selected buffer background
		},
		close_button = {
			fg = '#eeeeee',  -- Text color for close button
			bg = '#020210',  -- Match with bufferline background
		},
		close_button_visible = {
			fg = '#eeeeee',  -- Text color for visible close button
			bg = '#020210',  -- Match with bufferline background
		},
		close_button_selected = {
			fg = '#eeeeee',  -- Text color for selected close button
			bg = '#8565C4',  -- Match with selected buffer background
			bold = true,
		},
		pick_selected = {
			fg = '#eeeeee',  -- Text color for selected pick
			bg = '#8565C4',  -- Match with selected buffer background
			bold = true,
		},
		pick_visible = {
			fg = '#eeeeee',  -- Text color for visible pick
			bg = '#020210',  -- Match with bufferline background
			bold = true,
		},
		pick = {
			fg = '#eeeeee',  -- Text color for pick
			bg = '#020210',  -- Match with bufferline background
			bold = true,
		},
		offset_separator = {
			fg = '#020210',  -- Match with bufferline background
			bg = '#020210',  -- Match with bufferline background
		},
		trunc_marker = {
			fg = '#eeeeee',  -- Text color for trunc marker
			bg = '#020210',  -- Match with bufferline background
		},
		modified = {
			fg = '#eeeeee',  -- Keep the text color
			bg = '#020210',  -- Set background color
		},
		modified_visible = {
			fg = '#eeeeee',  -- Keep the text color
			bg = '#020210',  -- Set background color
		},
		modified_selected = {
			fg = '#eeeeee',  -- Keep the text color
			bg = '#8565C4',  -- Set background color to match selected buffer
		},
		duplicate_selected = {
			fg = '#eeeeee',  -- Keep the text color
			bg = '#8565C4',  -- Set background color to match selected buffer
		},
		duplicate_visible = {
			fg = '#eeeeee',  -- Keep the text color
			bg = '#020210',  -- Set background color
		},
		duplicate = {
			fg = '#eeeeee',  -- Keep the text color
			bg = '#020210',  -- Set background color
		},
		diagnostic = {
			fg = '#eeeeee',  -- Keep the text color
			bg = '#020210',  -- Set background color
		},
		diagnostic_visible = {
			fg = '#eeeeee',  -- Keep the text color
			bg = '#020210',  -- Set background color
		},
		diagnostic_selected = {
			fg = '#eeeeee',  -- Keep the text color
			bg = '#8565C4',  -- Set background color to match selected buffer
			bold = true,
		},
		hint = {
			fg = '#a8cc8c',  -- Example color for hints (you can adjust)
			bg = '#020210',  -- Set background color
		},
		hint_visible = {
			fg = '#a8cc8c',  -- Example color for visible hints
			bg = '#020210',  -- Set background color
		},
		hint_selected = {
			fg = '#a8cc8c',  -- Example color for selected hints
			bg = '#8565C4',  -- Set background color to match selected buffer
			bold = true,
		},
		hint_diagnostic = {
			fg = '#a8cc8c',  -- Example color for diagnostic hints
			bg = '#020210',  -- Set background color
		},
		hint_diagnostic_visible = {
			fg = '#a8cc8c',  -- Example color for visible diagnostic hints
			bg = '#020210',  -- Set background color
		},
		hint_diagnostic_selected = {
			fg = '#a8cc8c',  -- Example color for selected diagnostic hints
			bg = '#8565C4',  -- Set background color to match selected buffer
			bold = true,
		},
		info = {
			fg = '#7ca4c0',  -- Example color for info (you can adjust)
			bg = '#020210',  -- Set background color
		},
		info_visible = {
			fg = '#7ca4c0',  -- Example color for visible info
			bg = '#020210',  -- Set background color
		},
		info_selected = {
			fg = '#7ca4c0',  -- Example color for selected info
			bg = '#8565C4',  -- Set background color to match selected buffer
			bold = true,
		},
		info_diagnostic = {
			fg = '#7ca4c0',  -- Example color for diagnostic info
			bg = '#020210',  -- Set background color
		},
		info_diagnostic_visible = {
			fg = '#7ca4c0',  -- Example color for visible diagnostic info
			bg = '#020210',  -- Set background color
		},
		info_diagnostic_selected = {
			fg = '#7ca4c0',  -- Example color for selected diagnostic info
			bg = '#8565C4',  -- Set background color to match selected buffer
			bold = true,
		},
		warning = {
			fg = '#d8a657',  -- Example color for warnings (you can adjust)
			bg = '#020210',  -- Set background color
		},
		warning_visible = {
			fg = '#d8a657',  -- Example color for visible warnings
			bg = '#020210',  -- Set background color
		},
		warning_selected = {
			fg = '#d8a657',  -- Example color for selected warnings
			bg = '#8565C4',  -- Set background color to match selected buffer
			bold = true,
		},
		warning_diagnostic = {
			fg = '#d8a657',  -- Example color for diagnostic warnings
			bg = '#020210',  -- Set background color
		},
		warning_diagnostic_visible = {
			fg = '#d8a657',  -- Example color for visible diagnostic warnings
			bg = '#020210',  -- Set background color
		},
		warning_diagnostic_selected = {
			fg = '#d8a657',  -- Example color for selected diagnostic warnings
			bg = '#8565C4',  -- Set background color to match selected buffer
			bold = true,
		},
		error = {
			fg = '#ec6a88',  -- Example color for errors (you can adjust)
			bg = '#020210',  -- Set background color
		},
		error_visible = {
			fg = '#ec6a88',  -- Example color for visible errors
			bg = '#020210',  -- Set background color
		},
		error_selected = {
			fg = '#ec6a88',  -- Example color for selected errors
			bg = '#8565C4',  -- Set background color to match selected buffer
			bold = true,
		},
		error_diagnostic = {
			fg = '#ec6a88',  -- Example color for diagnostic errors
			bg = '#020210',  -- Set background color
		},
		error_diagnostic_visible = {
			fg = '#ec6a88',  -- Example color for visible diagnostic errors
			bg = '#020210',  -- Set background color
		},
		error_diagnostic_selected = {
			fg = '#ec6a88',  -- Example color for selected diagnostic errors
			bg = '#8565C4',  -- Set background color to match selected buffer
			bold = true,
		}
	}
}

for i = 1, 9 do
	vim.keymap.set(
		"n",
		("<leader>%s"):format(i),
		function() bufferline.go_to_buffer(i, true) end,
		{ desc = ("Buffer %s"):format(i) }
	)
end

vim.keymap.set("n", "<A-Right>", function() bufferline.cycle(1) end, { desc = "Next buffer" })
vim.keymap.set("n", "<A-Left>", function() bufferline.cycle(-1) end, { desc = "Previous buffer" })

local close_buffer = function()
	local buffer_count = #vim.fn.getbufinfo({buflisted = 1})

	if buffer_count > 1 then
		vim.cmd("bp | bd #")
	else
		vim.cmd("bd")
	end
end

vim.keymap.set("n", "<leader>w", close_buffer, { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bc<Left>", vim.cmd.BufferLineCloseLeft, { desc = "Close left buffers" })
vim.keymap.set("n", "<leader>bc<Right>", vim.cmd.BufferLineCloseRight, { desc = "Close right buffers" })
vim.keymap.set("n", "<leader>bco", vim.cmd.BufferLineCloseOther, { desc = "Close other buffers" })
vim.keymap.set("n", "<leader>bcw", function() vim.cmd("bufdo bwipeout") end, { desc = "Close all buffers" })

