return {
    "oil.nvim",
    lazy = false,
    before = function()
        deps.add {
            source = "stevearc/oil.nvim",
            depends = {
                "nvim-tree/nvim-web-devicons"
            },
        }
    end,
    keys = {
        { "<leader>e", "<cmd>Oil --float<cr>", desc = "Open oil.nvim" },
    },
    after = function()
        require("oil").setup({
            skip_confirm_for_simple_edits = true,
            prompt_save_on_select_new_entry = false,
            watch_for_changes = true,
            view_options = {
                show_hidden = true,
            },
        })
    end
}
