local git_blame = require("gitblame")

local git_blame_condition = function()
	local filetype = vim.bo.filetype;
	return git_blame.is_blame_text_available() and
	filetype ~= "neo-tree" and
	filetype ~= "toggleterm" and
	filetype ~= "alpha" and
	filetype ~= "NeogitStatus"
end

local copilot_indicator = function()
	local client = vim.lsp.get_active_clients({ name = "copilot" })[1]
	if client == nil then
		return "󱙻"
	end

	if vim.tbl_isempty(client.requests) then
		return "󱜚"
	end

	local spinners = { "←", "↖", "↑", "↗", "→", "↘", "↓", "↙" }
	local ms = vim.loop.hrtime() / 1000000
	local frame = math.floor(ms / 120) % #spinners

	return spinners[frame + 1]
end

require("lualine").setup {
	options = {
		theme = "tokyonight",
		component_separators = '',
		section_separators = { left = '', right = '' },
		globalstatus = true
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch' },
		lualine_c = { "filename", "diff", "diagnostics" },
		lualine_x = { { git_blame.get_current_blame_text, cond = git_blame_condition }, "encoding" },
		lualine_y = { copilot_indicator, "filetype" },
		lualine_z = { "location", "progress"  }
	},
}

