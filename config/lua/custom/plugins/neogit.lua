return {
    "neogit",
    before = function()
        deps.add {
            source = "NeogitOrg/neogit",
            depends = {
                "nvim-lua/plenary.nvim",  -- required
                "sindrets/diffview.nvim", -- optional - Diff integration
            },
        }
    end,
    keys = {
        { "<leader>gs", "<cmd>Neogit<cr>", desc = "Open Neogit" }
    },
    after = function()
        require("neogit").setup({
            kind = "floating"
        })
    end
}
