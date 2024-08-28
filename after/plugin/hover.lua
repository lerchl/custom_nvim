local hover = require("hover")

hover.setup {
	init = function ()
		require("hover.providers.lsp")
		require("hover.providers.dap")
		require("hover.providers.man")
		require("hover.providers.dictionary")
	end,
	title = false,
	mouse_providers = {}
}

vim.keymap.set("n", "K", hover.hover, { desc = "Hover" })

