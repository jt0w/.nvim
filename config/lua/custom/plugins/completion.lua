return {
    "nvim-cmp",
    lazy = false,
    before = function()
        deps.add {
            source = "hrsh7th/nvim-cmp",
            depends = {
                "onsails/lspkind.nvim",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-buffer",
                "rafamadriz/friendly-snippets",
            },
        }
    end,
    after = function()
        require "custom.completion"

        require "custom.snippets"
    end
}
