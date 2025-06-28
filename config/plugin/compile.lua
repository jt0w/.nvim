Command = nil
vim.api.nvim_create_user_command(
    'Compile',
    function()
        vim.ui.input({ prompt = "Command: ", completion = "shellcmd" }, function(input)
            vim.cmd("cexpr system('" .. input .. "')");
            Command = input
        end)
    end,
    {nargs = 0}
)

vim.api.nvim_create_user_command(
    'Recompile',
    function()
        vim.cmd("cexpr system('" .. Command .. "')");
    end,
    {nargs = 0}
)

vim.keymap.set("n", "<leader>cC", "<cmd>Compile<cr>");
vim.keymap.set("n", "<leader>cc", "<cmd>make<cr>");
