Snacks = require("snacks")
Snacks.setup {
    picker = {enabled = true}
}

vim.keymap.set('n', '<leader>fm', function() Snacks.picker.man() end, {desc = "Snacks man pages"});
