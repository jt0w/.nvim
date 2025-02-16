return {
    'telescope.nvim',
    lazy = false,
    before = function()
        deps.add {
            source = "nvim-telescope/telescope.nvim",
            depends = { "nvim-lua/plenary.nvim" }
        }
    end,
    keys = {
        { '<leader>f',  '<cmd>Telescope find_files<cr>',  desc = 'Find Files' },
        { '<leader>gf', '<cmd>Telescope git_files<cr>',   desc = 'Find Files' },
        { '<leader>s',  '<cmd>Telescope live_grep<cr>',   desc = 'Search Text in Files' },
        { '<leader>S',  '<cmd>Telescope grep_string<cr>', desc = 'Search Current Word in Files' },
        { '<leader>b',  '<cmd>Telescope buffers<cr>',     desc = 'List Buffers' },
        { '<leader>h',  '<cmd>Telescope help_tags<cr>',   desc = 'Help tags' },
        { '<M-x>',      '<cmd>Telescope commands<cr>',    desc = 'Run Command' },
    },
    after = function()
        require("telescope").setup({})
    end
}
