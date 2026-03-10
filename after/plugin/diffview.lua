require("diffview").setup {
    enhanced_diff_hl = true
}

local toggle_diffview = function()
    if next(require("diffview.lib").views) == nil then
        vim.cmd('DiffviewOpen')
    else
        vim.cmd('DiffviewClose')
    end
end

vim.keymap.set("n", "<leader>D", toggle_diffview, { desc = "Toggle Diffview" })
vim.keymap.set("n", "<leader>df", ":DiffviewFileHistory %<CR>", { desc = "Diffview current file history" })
vim.keymap.set("n", "<leader>dc", function()
    vim.ui.input({ prompt = "Commit(s) to diff: " }, function(input)
        if input and input ~= "" then
            vim.cmd("DiffviewOpen " .. input)
        end
    end)
end, { desc = "Diffview open commit(s)" })

vim.keymap.set("n", "<leader>dc", function()
    vim.ui.input({ prompt = "Commit to diff: " }, function(input)
        if input and input ~= "" then
            vim.cmd("DiffviewOpen " .. input)
        end
    end)
end, { desc = "Diffview open commit" })

