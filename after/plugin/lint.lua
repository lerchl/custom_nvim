local lint = require("lint")

lint.linters_by_ft = {
    java = { "checkstyle" }
}

local checkstyle_config_file = vim.fn.getcwd() .. "/checkstyle.xml"

if vim.fn.filereadable(checkstyle_config_file) == 1 then
    lint.linters.checkstyle.config_file = checkstyle_config_file
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
        callback = function()
            lint.try_lint()
        end
    })
end
