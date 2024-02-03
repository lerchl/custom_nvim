require("neo-tree").setup {
    filesystem = {
        group_empty_dirs = true
    }
}

vim.keymap.set("n", "<leader>e", function() vim.cmd("Neotree position=left toggle=true") end, { desc = "Toggle Neotree" })

vim.keymap.set('n', '-', function()
    local reveal_file = vim.fn.expand('%:p')
    if (reveal_file == '') then
        reveal_file = vim.fn.getcwd()
    else
        local f = io.open(reveal_file, "r")
        if (f) then
            f.close(f)
        else
            reveal_file = vim.fn.getcwd()
        end
    end
    require('neo-tree.command').execute({ reveal_file = reveal_file }) end,
    { desc = "Show current file in Neotree" }
);

