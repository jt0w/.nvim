Command = nil
vim.api.nvim_create_user_command(
    'Compile',
    function()
        vim.ui.input({ prompt = "Command: ", completion = "shellcmd" }, function(input)
            vim.opts.makeprg = inputs
            Command = input
            vim.cmd("make");
        end)
    end,
    {nargs = 0}
)

vim.api.nvim_create_user_command(
    'Recompile',
    function()
            vim.opts.makeprg = Command
            vim.cmd("make");
    end,
    {nargs = 0}
)

vim.keymap.set("n", "<leader>cC", "<cmd>Compile<cr>");
vim.keymap.set("n", "<leader>cc", "<cmd>Recompile<cr>");
