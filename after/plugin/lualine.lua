----- INTEGERATIONS

local filetype_not_excluded = function()
    local filetype = vim.bo.filetype
    return filetype ~= "neo-tree" and
        filetype ~= "alpha" and
        filetype ~= "NeogitStatus"
end

---   GIT

local git_blame = require("gitblame")

local has_git_blame = function()
    return git_blame.is_blame_text_available() and filetype_not_excluded()
end

local get_git_blame = function()
    local blame_text = git_blame.get_current_blame_text()

    if string.len(blame_text) > 65 then
        return string.sub(blame_text, 1, 65) .. "..."
    end

    return blame_text
end

---   INDENT SPEC
local get_indent_spec = function()
    if vim.opt.expandtab:get() then
        local spaces = vim.opt.shiftwidth:get()
        return "using " .. spaces .. " spaces"
    else
        return "using tabs"
    end
end

----- SETUP

local custom_catppuccin = require("lualine.themes.catppuccin")
custom_catppuccin.normal.c.bg = "#1e1e2e"

require("lualine").setup {
    options = {
        theme = custom_catppuccin,
        component_separators = "",
        section_separators = "",
        globalstatus = true
    },
    sections = {
        lualine_a = {{ "mode" }},
        lualine_b = {{ "branch", separator = { right = "" } }},
        lualine_c = { "filename" },
        lualine_x = {{ get_git_blame, cond = has_git_blame }, { get_indent_spec, cond = filetype_not_excluded }, "encoding" },
        lualine_y = {},
        lualine_z = {{ "location" , separator = { left = "" }}, { "progress" }}
    }
}
