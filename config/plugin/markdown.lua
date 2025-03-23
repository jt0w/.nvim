require('render-markdown').setup({})
vim.g.table_mode_corner = '|'
vim.keymap.set("n", "<leader>tm", "<cmd>TableModeToggle<cr>")
vim.keymap.set("n", "<leader>tr", "<cmd>TableModeRealign<cr>")
vim.keymap.set("n", "<leader>ti", "<cmd>Tableize<cr>")
