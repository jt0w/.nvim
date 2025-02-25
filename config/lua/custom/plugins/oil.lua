return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    keys = {
        { "<leader>e", "<cmd>Oil<cr>", desc = "Open oil.nvim" },
    },
    opts = {
        skip_confirm_for_simple_edits = true,
        prompt_save_on_select_new_entry = false,
        watch_for_changes = true,
        view_options = {
            show_hidden = true,
        },
        columns = {
            "permission",
            "size",
            "ctime",
            "icon",
        },
    },
}
