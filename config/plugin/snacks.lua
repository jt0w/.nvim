Snacks = require("snacks")
Snacks.setup {
    picker = {},
    notifier = {},
    statuscolumn = {},
    terminal =  {},
    gitbrowse = {},
}

vim.keymap.set("n", "<leader>m", function() Snacks.picker.man() end, {desc = "Snacks man pages"});
vim.keymap.set("n", "<leader>n", function() Snacks.picker.notifications() end, {desc = "Snacks man pages"});
vim.keymap.set("n", "<leader>tt", function() Snacks.terminal() end, {desc = "Snacks terminal"});
vim.keymap.set({"n", "v"}, "<leader>go", function() Snacks.gitbrowse() end, {desc = "Snacks terminal"});
Snacks.toggle.option("wrap"):map("<leader>tw")
