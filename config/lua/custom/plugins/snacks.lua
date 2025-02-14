-- yummy
return {
    "snacks.nvim",
    lazy = false,
    priority = 1000,
    before = function()
        deps.add { source = "folke/snacks.nvim" }
    end,
    keys = {
        { "<C-,>",      function() require("snacks").terminal() end,  desc = "Open Terminal",              mode = { "n", "t" } },
        { "<leader>go", function() require("snacks").gitbrowse() end, desc = "Open git project in browser" }
    },
    after = function()
        require("snacks").setup({
            gitbrowse = { ennabled = true },
            image = { enabled = true },
            notifier = { enabled = true }
        })
    end
}
