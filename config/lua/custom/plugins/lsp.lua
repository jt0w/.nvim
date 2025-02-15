return {
    "nvim-lspconfig",
    before = function()
        deps.add {
            source = "neovim/nvim-lspconfig",
            depends = {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "j-hui/fidget.nvim",

                -- formatting
                "stevearc/conform.nvim",

                -- ocaml
                "tjdevries/ocaml.nvim",

                -- nvim api lsp
                "folke/lazydev.nvim",

                "saghen/blink.cmp"
            },
        }
    end,
    after = function()
        require "custom.lsp"
    end
}
