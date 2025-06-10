local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = bufnr, desc = "Hover" })
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { buffer = bufnr, desc = "Action" })
	vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format() end, { buffer = bufnr, desc = "Format" })
	vim.keymap.set("v", "f", vim.lsp.buf.format, { buffer = bufnr, desc = "Format" })
	vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, { buffer = bufnr, desc = "Go to definition" })
	vim.keymap.set("n", "<leader>gi", function() vim.lsp.buf.implementation() end, { buffer = bufnr, desc = "Go to implementation" })
	vim.keymap.set("n", "<leader>gt", function() vim.lsp.buf.type_definition() end, { buffer = bufnr, desc = "Go to type definition" })
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { buffer = bufnr, desc = "View workspace symbol" })
	vim.keymap.set("n", "<leader>vdd", function() vim.diagnostic.open_float() end, { buffer = bufnr, desc = "View diagnostic" })
	vim.keymap.set("n", "<leader>vdn", function() vim.diagnostic.goto_next() end, { buffer = bufnr, desc = "View next diagnostic" })
	vim.keymap.set("n", "<leader>vdN", function() vim.diagnostic.goto_prev() end, { buffer = bufnr, desc = "View previous diagnostic" })
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { buffer = bufnr, desc = "Show all references" })
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { buffer = bufnr, desc = "Rename" })
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { buffer = bufnr, desc = "Signature help" })

	vim.keymap.set("n", "<leader>vi", vim.lsp.buf.incoming_calls, { buffer = bufnr, desc = "Show incoming calls" })
	vim.keymap.set("n", "<leader>vo", vim.lsp.buf.outgoing_calls, { buffer = bufnr, desc = "Show outgoing calls" })
	-- vim.keymap.set("n", "<leader>vt", vim.lsp.buf.typehierarchy, { buffer = bufnr, desc = "Show type hierarchy" })

	vim.lsp.inlay_hint.enable(true)
end)

-- Function to setup document highlight for buffers with an LSP client
local function setup_document_highlight(client, bufnr)
	if client.server_capabilities.documentHighlightProvider then
		-- Create an augroup specific to this buffer to avoid conflicts
		local group = vim.api.nvim_create_augroup("LspDocumentHighlight_" .. bufnr, { clear = true })

		-- Highlight references on CursorHold
		vim.api.nvim_create_autocmd("CursorHold",
			{ buffer = bufnr, callback = vim.lsp.buf.document_highlight, group = group,
		})

		-- Clear highlights on CursorMoved
		vim.api.nvim_create_autocmd("CursorMoved", {
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
			group = group,
		})
	end
end

-- Attach the setup function to the LSP attach event
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local bufnr = args.buf
        setup_document_highlight(client, bufnr)
    end,
})

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { "lua_ls", "clangd", "jdtls", "rust_analyzer", "ts_ls", "eslint" },
	handlers = {
		lsp_zero.default_setup,
		jdtls = lsp_zero.noop,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
		eslint = function()
			require("lspconfig").eslint.setup {
				settings = {
					rulesCustomizations = {
						{ rule = "*", severity = "warn" }
					}
				}
			}
		end,
		ts_ls = function()
			require("lspconfig").ts_ls.setup {
				preferences = {
					typescript = {
						includeInlayParameterNameHints = "literals"
					}
				}
			}
		end
	}
})

local cmp = require('cmp')

cmp.setup({
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip' , keyword_length = 2},
		{ name = 'buffer' , keyword_length = 3},
	},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		["<Tab>"] = cmp.mapping.confirm(),
		["<S-Tab>"] = cmp.mapping.close()
	}),
	window = {
		documentation = cmp.config.window.bordered(),
		completion = cmp.config.window.bordered(),
	},
	formatting = {
		-- changing the order of fields so the icon is the first
		fields = {'menu', 'abbr', 'kind'},

		-- here is where the change happens
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = 'λ',
				luasnip = '⋗',
				buffer = 'Ω',
				path = '/',
				nvim_lua = 'Π',
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	}
})
