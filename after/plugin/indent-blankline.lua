require("ibl").setup{
    indent = {
        char = "│",
        tab_char = "│"
    },
	scope = {
		show_start = false,
		show_end = false,
	},
    exclude = {
        filetypes = {
            "lspinfo",
            "packer",
            "checkhealth",
            "help",
            "man",
            "gitcommit",
            "TelescopePrompt",
            "TelescopeResults",
            "neo-tree",
            "alpha"
        }
    }
}

