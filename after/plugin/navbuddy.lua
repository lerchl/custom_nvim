local navbuddy = require("nvim-navbuddy")
local actions = require("nvim-navbuddy.actions")

navbuddy.setup {
    use_default_mappings = true,            -- If set to false, only mappings set
                                            -- by user are set. Else default
                                            -- mappings are used for keys
                                            -- that are not set by user
    mappings = {
        ["<Left>"] = actions.parent(),      -- Move to left panel
        ["<Right>"] = actions.children(),   -- Move to right panel
    },
    lsp = {
        auto_attach = false,   -- If set to true, you don't need to manually use attach function
        preference = nil,      -- list of lsp server names in order of preference
    },
    source_buffer = {
        follow_node = true,    -- Keep the current node in focus on the source buffer
        highlight = true,      -- Highlight the currently focused node
        reorient = "smart",    -- "smart", "top", "mid" or "none"
        scrolloff = nil        -- scrolloff value when navbuddy is open
    },
	custom_hl_group = nil,     -- "Visual" or any other hl group to use instead of inverted colors
}

vim.keymap.set("n", "<leader>fO", navbuddy.open, { desc = "Open Navbuddy" })

