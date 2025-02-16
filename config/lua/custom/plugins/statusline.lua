return {
    "express_line.nvim",
    before = function()
        deps.add {
            source = "tjdevries/express_line.nvim",
            depends = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
            },
        }
    end,
    after = function()
        require("custom.statusline")
    end
}
