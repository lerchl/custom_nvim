local dap = require("dap")
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Continue" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Continue" })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })

local dapui = require("dapui")
dapui.setup()

vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })

