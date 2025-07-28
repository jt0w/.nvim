require("mini.align").setup()
require("mini.splitjoin").setup()
require("mini.operators").setup()
require("mini.surround").setup()
require("mini.sessions").setup()

require("mini.pick").setup()
local builtin = require("mini.pick").builtin
vim.keymap.set('n', '<leader>f', builtin.files, { desc = 'find files' })
vim.keymap.set('n', '<leader>s', builtin.grep_live, { desc = 'grep_live' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'find buffers' })
vim.keymap.set('n', '<leader>h', builtin.help, { desc = 'search help tags' })

local miniclue = require('mini.clue')
miniclue.setup({
    triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
    },

    clues = {
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
    },
})
