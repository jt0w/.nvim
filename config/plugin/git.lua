local ng = require('neogit')

ng.setup({
  kind = "replace",
})

vim.keymap.set("n", "<leader>gs", ng.open)
