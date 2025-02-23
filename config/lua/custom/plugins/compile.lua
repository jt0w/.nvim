return {
    "compile-mode.nvim",
    lazy = false,
    before = function()
        deps.add {
            source = "ej-shafran/compile-mode.nvim",
            depends = { "nvim-lua/plenary.nvim" }
        }
    end,
    keys = {
        { "<leader>cC", "<cmd>below Compile<cr>", desc = "Compile"},
        { "<leader>cc", "<cmd>below Recompile<cr>", desc = "Recompile"},
    },
    after = function()
        vim.g.compile_mode = {}
    end,
}
