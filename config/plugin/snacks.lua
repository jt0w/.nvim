Snacks = require("snacks")
Snacks.setup {
    picker = {},
    notifier = {},
    statuscolumn = {},
    terminal =  {},
}

vim.keymap.set('n', '<leader>m', function() Snacks.picker.man() end, {desc = "Snacks man pages"});
vim.keymap.set('n', '<leader>n', function() Snacks.picker.notifications() end, {desc = "Snacks man pages"});
vim.keymap.set('n', '<leader>t', function() Snacks.terminal() end, {desc = "Snacks terminal"});
Snacks.toggle.option("wrap"):map("<leader>tw")
