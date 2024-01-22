local cmp = require("cmp")
-- local copilot = require("copilot")

cmp.setup {
    mapping = cmp.mapping.preset.insert {
        ["<C-S>"] = cmp.mapping.abort(),
        ["<Tab>"] = print(cmp.get_selected_entry())
    }
}

