-- yummy
return {
    "snacks.nvim",
    lazy = false,
    priority = 1000,
    before = function()
        deps.add { source = "folke/snacks.nvim" }
    end,
    keys = {
        { "<C-,>",      function() Snacks.terminal() end,  desc = "Open Terminal",              mode = { "n", "t" } },
        { "<C-.>",      function() Snacks.scratch() end,   desc = "Open Scratch Buffer",        mode = { "n", "t" } },
        { "<leader>go", function() Snacks.gitbrowse() end, desc = "Open git project in browser" }
    },
    after = function()
        require("snacks").setup({
            image = { enabled = true },
            notifier = { enabled = true },
            scope = { enabled = true },
            statuscolumn = { enabled = true },
            toggle = { enabled = true },
            scratch = { enabled = true },
            terminal = { enabled = true },
            words = { enabled = true },
        })


        Snacks.toggle.dim():map("<leader>tD")
        Snacks.toggle.zoom():map("<leader>z")
        Snacks.toggle.option("wrap"):map("<leader>w")
    end
}
