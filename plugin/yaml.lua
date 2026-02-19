local util = require("lspconfig.util")

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    pattern = { "*.yaml", "*.yml" },
    callback = function()
        local root = util.root_pattern("Chart.yaml")(vim.fn.expand("%:p"))

        if root then
            vim.bo.filetype = "helm"
        end
    end
})

vim.filetype.add({
    extension = {
        tpl = "helm"
    }
})
