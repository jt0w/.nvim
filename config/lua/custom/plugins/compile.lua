return {
    "ej-shafran/compile-mode.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim" 
    },
    keys = {
        { "<leader>cC", "<cmd>below Compile<cr>", desc = "Compile"},
        { "<leader>cc", "<cmd>below Recompile<cr>", desc = "Recompile"},
    },
    config = function()
        vim.g.compile_mode = {}
    end,
}
