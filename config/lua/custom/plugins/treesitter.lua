return {
    "nvim-treesitter",
    lazy = false,
    before = function()
        deps.add { source = "nvim-treesitter/nvim-treesitter" }
    end,
    after = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = "all",
            auto_install = true,
            highlight = { ennable = true },
            indent = { ennable = true },
        }
    end
}
