require('overseer').setup({
  templates = {"builtin", "user.chimera"},
})

vim.keymap.set("n", "<leader>cc", "<cmd>OverseerRun<cr>")
vim.keymap.set("n", "<leader>cC", "<cmd>OverseerToggle<cr>")
