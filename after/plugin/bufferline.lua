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

		-- Additional highlight groups for previously ignored sections
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

