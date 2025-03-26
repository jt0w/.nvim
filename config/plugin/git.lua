vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>")
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<cr>")
vim.keymap.set("n", "<leader>gP", "<cmd>Git pull<cr>")
vim.keymap.set("n", "<leader>gaa", "<cmd>Git add .<cr>")
vim.keymap.set("n", "<leader>gaf", "<cmd>Git add %<cr>")

require('gitsigns').setup({
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 0,
    },
})

require("octo").setup()
