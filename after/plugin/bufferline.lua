local bufferline = require("bufferline")

local main = "#6a5acd"
local base = "#000000"
local white = "#ffffff"
local info = "#66bcf9"
local warning = "#fce879"
local error = "#fc7e80"
local hint = "#a8cc8c"

bufferline.setup {
	options = {
		numbers = "ordinal",
		diagnostics = "nvim_lsp",
		buffer_close_icon = ""
	},
	highlights = {
		fill = {
			fg = white,  -- Text color
			bg = base,  -- Background color for the bufferline
		},
		background = {
			fg = white,  -- Text color for non-selected buffers
			bg = base,  -- Background color for non-selected buffers
		},
		tab = {
			fg = white,  -- Text color for non-selected tabs
			bg = base,  -- Background color for non-selected tabs
		},
		tab_selected = {
			fg = white,  -- Text color for selected tabs
			bg = main,  -- Background color for selected tabs
		},
		tab_separator = {
			fg = base,   -- Match with the bufferline background
			bg = base,   -- Match with the bufferline background
		},
		tab_separator_selected = {
			fg = main,   -- Match with selected buffer background
			bg = main,   -- Match with selected buffer background
		},
		buffer_visible = {
			fg = white,  -- Text color for visible but non-selected buffer
			bg = base,  -- Match with bufferline background
		},
		buffer_selected = {
			fg = white,  -- Text color for selected buffer
			bg = main,  -- Background color for selected buffer
			bold = true,
		},
		numbers = {
			fg = white,  -- Text color for buffer numbers
			bg = base,  -- Match with bufferline background
		},
		numbers_visible = {
			fg = white,  -- Text color for visible buffer numbers
			bg = base,  -- Match with bufferline background
		},
		numbers_selected = {
			fg = white,  -- Text color for selected buffer numbers
			bg = main,  -- Match with selected buffer background
			bold = true,
		},
		separator_selected = {
			fg = main,  -- Match with selected buffer background
			bg = main,  -- Match with selected buffer background
		},
		separator_visible = {
			fg = base,  -- Match with bufferline background
			bg = base,  -- Match with bufferline background
		},
		separator = {
			fg = base,  -- Match with bufferline background
			bg = base,  -- Match with bufferline background
		},
		indicator_visible = {
			fg = base,  -- Match with bufferline background
			bg = base,  -- Match with bufferline background
		},
		indicator_selected = {
			fg = white,  -- Text color for selected buffer indicator
			bg = main,  -- Match with selected buffer background
		},
		close_button = {
			fg = white,  -- Text color for close button
			bg = base,  -- Match with bufferline background
		},
		close_button_visible = {
			fg = white,  -- Text color for visible close button
			bg = base,  -- Match with bufferline background
		},
		close_button_selected = {
			fg = white,  -- Text color for selected close button
			bg = main,  -- Match with selected buffer background
			bold = true,
		},
		pick_selected = {
			fg = white,  -- Text color for selected pick
			bg = main,  -- Match with selected buffer background
			bold = true,
		},
		pick_visible = {
			fg = white,  -- Text color for visible pick
			bg = base,  -- Match with bufferline background
			bold = true,
		},
		pick = {
			fg = white,  -- Text color for pick
			bg = base,  -- Match with bufferline background
			bold = true,
		},
		offset_separator = {
			fg = base,  -- Match with bufferline background
			bg = base,  -- Match with bufferline background
		},
		trunc_marker = {
			fg = white,  -- Text color for trunc marker
			bg = base,  -- Match with bufferline background
		},
		modified = {
			fg = white,  -- Keep the text color
			bg = base,  -- Set background color
		},
		modified_visible = {
			fg = white,  -- Keep the text color
			bg = base,  -- Set background color
		},
		modified_selected = {
			fg = white,  -- Keep the text color
			bg = main,  -- Set background color to match selected buffer
		},
		duplicate_selected = {
			fg = white,  -- Keep the text color
			bg = main,  -- Set background color to match selected buffer
		},
		duplicate_visible = {
			fg = white,  -- Keep the text color
			bg = base,  -- Set background color
		},
		duplicate = {
			fg = white,  -- Keep the text color
			bg = base,  -- Set background color
		},
		diagnostic = {
			fg = white,  -- Keep the text color
			bg = base,  -- Set background color
		},
		diagnostic_visible = {
			fg = white,  -- Keep the text color
			bg = base,  -- Set background color
		},
		diagnostic_selected = {
			fg = white,  -- Keep the text color
			bg = main,  -- Set background color to match selected buffer
			bold = true,
		},
		hint = {
			fg = hint,  -- Example color for hints (you can adjust)
			bg = base,  -- Set background color
		},
		hint_visible = {
			fg = hint,  -- Example color for visible hints
			bg = base,  -- Set background color
		},
		hint_selected = {
			fg = hint,  -- Example color for selected hints
			bg = main,  -- Set background color to match selected buffer
			bold = true,
		},
		hint_diagnostic = {
			fg = hint,  -- Example color for diagnostic hints
			bg = base,  -- Set background color
		},
		hint_diagnostic_visible = {
			fg = hint,  -- Example color for visible diagnostic hints
			bg = base,  -- Set background color
		},
		hint_diagnostic_selected = {
			fg = hint,  -- Example color for selected diagnostic hints
			bg = main,  -- Set background color to match selected buffer
			bold = true,
		},
		info = {
			fg = info,  -- Example color for info (you can adjust)
			bg = base,  -- Set background color
		},
		info_visible = {
			fg = info,  -- Example color for visible info
			bg = base,  -- Set background color
		},
		info_selected = {
			fg = info,  -- Example color for selected info
			bg = main,  -- Set background color to match selected buffer
			bold = true,
		},
		info_diagnostic = {
			fg = info,  -- Example color for diagnostic info
			bg = base,  -- Set background color
		},
		info_diagnostic_visible = {
			fg = info,  -- Example color for visible diagnostic info
			bg = base,  -- Set background color
		},
		info_diagnostic_selected = {
			fg = info,  -- Example color for selected diagnostic info
			bg = main,  -- Set background color to match selected buffer
			bold = true,
		},
		warning = {
			fg = warning,  -- Example color for warnings (you can adjust)
			bg = base,  -- Set background color
		},
		warning_visible = {
			fg = warning,  -- Example color for visible warnings
			bg = base,  -- Set background color
		},
		warning_selected = {
			fg = warning,  -- Example color for selected warnings
			bg = main,  -- Set background color to match selected buffer
			bold = true,
		},
		warning_diagnostic = {
			fg = warning,  -- Example color for diagnostic warnings
			bg = base,  -- Set background color
		},
		warning_diagnostic_visible = {
			fg = warning,  -- Example color for visible diagnostic warnings
			bg = base,  -- Set background color
		},
		warning_diagnostic_selected = {
			fg = warning,  -- Example color for selected diagnostic warnings
			bg = main,  -- Set background color to match selected buffer
			bold = true,
		},
		error = {
			fg = error,  -- Example color for errors (you can adjust)
			bg = base,  -- Set background color
		},
		error_visible = {
			fg = error,  -- Example color for visible errors
			bg = base,  -- Set background color
		},
		error_selected = {
			fg = error,  -- Example color for selected errors
			bg = main,  -- Set background color to match selected buffer
			bold = true,
		},
		error_diagnostic = {
			fg = error,  -- Example color for diagnostic errors
			bg = base,  -- Set background color
		},
		error_diagnostic_visible = {
			fg = error,  -- Example color for visible diagnostic errors
			bg = base,  -- Set background color
		},
		error_diagnostic_selected = {
			fg = error,  -- Example color for selected diagnostic errors
			bg = main,  -- Set background color to match selected buffer
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

