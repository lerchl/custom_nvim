local util = require("lspconfig.util")

local function is_tekton_file(filepath)
    local f = io.open(filepath, "r")
    if not f then return false end
    local content = f:read("*a")
    f:close()
    return content:match("apiVersion:%s*tekton%.dev/") ~= nil
end

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    pattern = { "*.yaml", "*.yml" },
    callback = function()
        local filepath = vim.fn.expand("%:p")
        if is_tekton_file(filepath) then
            return
        end
        local root = util.root_pattern("Chart.yaml")(filepath)
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
