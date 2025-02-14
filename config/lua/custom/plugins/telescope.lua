return {
    'telescope.nvim',
    before = function()
        deps.add {
            source = "nvim-telescope/telescope.nvim",
            depends = { "nvim-lua/plenary.nvim" }
        }
    end,
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
        { '<leader>pf', '<cmd>Telescope git_files<cr>', desc = 'Find Files' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Search Text in Files' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'List Buffers' },
        { '<M-x>', '<cmd>Telescope commands<cr>', desc = 'Run Command' },
    },
    after = function()
        require("telescope").setup()
    end
}
