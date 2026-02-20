local ui = require("nicolerchl.ui")

local M = {}

M.on_attach = function(client, bufnr)
    local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- Hover
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover { border = ui.border } end, { buffer = bufnr, desc = "Hover" })

    -- Code actions / formatting
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map("n", "<leader>cf", vim.lsp.buf.format, "Format")
    map("v", "f", vim.lsp.buf.format, "Format")

    -- Definitions
    map("n", "<leader>gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "<leader>gi", vim.lsp.buf.implementation, "Go to implementation")
    map("n", "<leader>gt", vim.lsp.buf.type_definition, "Go to type definition")

    -- Symbols
    map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, "Workspace symbols")
    map("n", "<leader>vrr", vim.lsp.buf.references, "References")
    map("n", "<leader>vrn", vim.lsp.buf.rename, "Rename")

    -- Diagnostics
    map("n", "<leader>vdd", vim.diagnostic.open_float, "Line diagnostics")
    map("n", "<leader>vdn", vim.diagnostic.goto_next, "Next diagnostic")
    map("n", "<leader>vdN", vim.diagnostic.goto_prev, "Prev diagnostic")

    -- Signature help
    map("i", "<C-h>", vim.lsp.buf.signature_help, "Signature help")

    -- Call hierarchy
    map("n", "<leader>vi", vim.lsp.buf.incoming_calls, "Incoming calls")
    map("n", "<leader>vo", vim.lsp.buf.outgoing_calls, "Outgoing calls")

    -- Inlay hints
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    -- Document highlight
    if client.server_capabilities.documentHighlightProvider then
        local group = vim.api.nvim_create_augroup("LspDocumentHighlight_" .. bufnr, { clear = true })

        vim.api.nvim_create_autocmd("CursorHold", {
            buffer = bufnr,
            group = group,
            callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd("CursorMoved", {
            buffer = bufnr,
            group = group,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

return M
