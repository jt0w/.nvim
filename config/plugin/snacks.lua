Snacks = require("snacks")
Snacks.setup {
  picker = {},
  notifier = {},
}

vim.keymap.set("n", "<leader>m", function() Snacks.picker.man() end, { desc = "Snacks man pages" });
