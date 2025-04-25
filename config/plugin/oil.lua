require("oil").setup({
    columns = {
        "permissions",
        "size",
        "mtime",
        "icon",
    },
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = false,
    watch_for_changes = true,
    view_options = {
        show_hidden = true,
    },
})

vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>")
