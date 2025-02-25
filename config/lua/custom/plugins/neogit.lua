return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",  -- required
        "sindrets/diffview.nvim", -- optional - Diff integration
    },
    keys = {
        { "<leader>gs", "<cmd>Neogit<cr>", desc = "Open Neogit" }
    },
    opts = {
        kind = "floating",
    },
}
