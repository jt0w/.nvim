require("neorg").setup {
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    notes = "~/notes",
                },
                default_workspace = "notes",
            },
        },
    },
}

vim.keymap.set("n", "<leader>N", "<cmd>Neorg<cr>")
