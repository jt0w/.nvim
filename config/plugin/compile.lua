-- cgetexpr system("./make vism examples/example.vism")
--

Command = nil

vim.api.nvim_create_user_command(
    'Compile',
    function()
        vim.ui.input({ prompt = "Command: " }, function(input)
            vim.cmd("cgetexpr ('" .. input .. "')");
            Command = input
            vim.cmd("copen");
        end)
    end,
    {nargs = 0}
)

vim.api.nvim_create_user_command(
    'Recompile',
    function()
        vim.cmd("cgetexpr ('" .. Command .. "')");
        vim.cmd("copen");
    end,
    {nargs = 0}
)

vim.keymap.set("n", "<leader>cC", "<cmd>Compile<cr>");
vim.keymap.set("n", "<leader>cc", "<cmd>Recompile<cr>");
