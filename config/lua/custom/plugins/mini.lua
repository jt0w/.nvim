return {
    "mini.nvim",
    after = function()
        require("mini.align").setup()
        require("mini.operators").setup()
        require("mini.surround").setup()
        require("mini.clue").setup()
    end,
}
