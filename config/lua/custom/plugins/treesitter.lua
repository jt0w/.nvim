return {
    "nvim-treesitter",
    lazy = false,
    priority = 1000,
    before = function()
        deps.add { source = "nvim-treesitter/nvim-treesitter" }
    end,
    after = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = "all",
            auto_install = true,
            highlight = { enable = true },
            indent = {
                enable = true,
                disable = { "nix" },
            },
        }
    end
}
