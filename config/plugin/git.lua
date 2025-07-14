local ng = require("neogit")
ng.setup {
  kind = "floating",
}

vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<cr>")
