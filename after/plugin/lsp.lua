local on_attach = require("nicolerchl.lsp").on_attach

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "clangd",
        "jdtls",
        "rust_analyzer",
        "ts_ls",
        "eslint",
        "helm_ls",
        "yamlls",
    },
    automatic_enable = {
        exclude = {
            "jdtls",
        }
    }
}

local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
})

vim.lsp.config("eslint", {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        rulesCustomizations = { { rule = "*", severity = "warn" } },
    },
})

vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        typescript = { includeInlayParameterNameHints = "literals" },
    },
})

vim.lsp.config("helm_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ["helm-ls"] = {
            yamlls = { path = vim.fn.exepath("yaml-language-server") },
        },
    },
})
