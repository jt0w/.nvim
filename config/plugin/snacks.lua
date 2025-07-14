Snacks = require("snacks")
Snacks.setup {
    picker = {},
    notifier = {},
    statuscolumn = {},
    terminal =  {},
    gitbrowse = {},
}

vim.keymap.set("n", "<leader>m", function() Snacks.picker.man() end, {desc = "Snacks man pages"});
vim.keymap.set("n", "<C-,>", function() Snacks.terminal() end, {desc = "Snacks terminal"});
vim.keymap.set({"n", "v"}, "<leader>go", function() Snacks.gitbrowse() end, {desc = "Git open"});
Snacks.toggle.option("wrap"):map("<leader>tw")
