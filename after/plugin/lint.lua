local lint = require("lint")

lint.linters_by_ft = {
    java = { "checkstyle" }
}

lint.linters.checkstyle.config_file = vim.fn.getcwd() .. "/checkstyle.xml"

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end
})
