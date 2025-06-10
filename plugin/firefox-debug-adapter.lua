local firefox_debug_adapter_setup = function()
    require("dap").adapters.firefox = {
        type = "executable",
        command = "node",
        args = { require("mason-registry").get_package("firefox-debug-adapter"):get_install_path() .. "/dist/adapter.bundle.js" }
    }
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typescript", "javascript", "ts", "js" },
    desc = "Setup firefox-debug-adapter",
    callback = firefox_debug_adapter_setup
})
