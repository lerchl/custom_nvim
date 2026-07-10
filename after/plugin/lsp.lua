-- add horizontal divider after method / function signature in hover
local orig_open_floating_preview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
	if syntax == "markdown" and contents then
		local new_contents = {}
		local in_code_block = false
		local code_block_done = false

		for _, line in ipairs(contents) do
			table.insert(new_contents, line)

			if not code_block_done then
				if line:match("^```java") then
					in_code_block = true
				elseif in_code_block and line:match("^```%s*$") then
					in_code_block = false
					code_block_done = true
					table.insert(new_contents, "---")
				end
			end
		end

		contents = new_contents
	end
	return orig_open_floating_preview(contents, syntax, opts, ...)
end

-- remove jdt links from markdown
local orig_convert = vim.lsp.util.convert_input_to_markdown_lines
vim.lsp.util.convert_input_to_markdown_lines = function(input, contents)
	local result = orig_convert(input, contents)
	for i, line in ipairs(result) do
		result[i] = line:gsub("%[([^%]]+)%]%(jdt://[^%)]+%)", "`%1`")
	end
	return result
end

local on_attach = require("nicolerchl.lsp").on_attach

require("mason").setup()
require("mason-lspconfig").setup({
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
		},
	},
})

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

vim.lsp.config("yamlls", {
	capabilities = capabilities,
	on_attach = on_attach,
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

vim.lsp.config("angularls", {
	capabilities = capabilities,
	on_attach = on_attach,
})

vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,
	on_attach = on_attach,
})

vim.lsp.config("clangd", {
	capabilities = capabilities,
	on_attach = on_attach,
})
