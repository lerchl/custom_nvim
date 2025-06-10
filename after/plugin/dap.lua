local dap = require("dap")

local continue = function()
	if vim.fn.filereadable(".vscode/launch.json") then
		require("dap.ext.vscode").load_launchjs()
	end
	dap.continue()
end

vim.keymap.set("n", "<F5>", continue, { desc = "Start / Continue debugging" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })

local dapui = require("dapui")
dapui.setup {
	controls = {
		element = "repl",
		enabled = true,
		icons = {
			disconnect = "",
			pause = "",
			play = "",
			run_last = "",
			step_back = "",
			step_into = "",
			step_out = "",
			step_over = "",
			terminate = ""
		}
	},
	element_mappings = {},
	expand_lines = true,
	floating = {
		border = "single",
		mappings = {
			close = { "q", "<Esc>" }
		}
	},
	force_buffers = true,
	icons = {
		collapsed = "",
		current_frame = "",
		expanded = ""
	},
	layouts = { {
		elements = { {
			id = "scopes",
			size = 0.25
		}, {
			id = "breakpoints",
			size = 0.25
		}, {
			id = "stacks",
			size = 0.25
		}, {
			id = "watches",
			size = 0.25
		} },
		position = "left",
		size = 40
	}, {
		elements = {
			-- {
			-- 	id = "repl",
			-- 	size = 0.5
			-- },
			{
				id = "console",
				size = 1
			}
		},
		position = "bottom",
		size = 20
	} },
	mappings = {
		edit = "e",
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		repl = "r",
		toggle = "t"
	},
	render = {
		indent = 1,
		max_value_lines = 100
	}
}

vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
vim.keymap.set("n", "<leader>dj", function() dapui.toggle(2) end, { desc = "Toggle DAP console" })
vim.keymap.set("n", "<leader>de", dapui.eval, { desc = "Evaluate expression" })

dap.listeners.before.attach.dapui_config = function() dapui.open(2) end
dap.listeners.before.launch.dapui_config = function() dapui.open(2) end
