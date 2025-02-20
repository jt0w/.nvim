return {
    "material.nvim",
    lazy = false,
    before = function()
        deps.add({ source = "marko-cerovac/material.nvim" })
    end,
    after = function()
        vim.g.material_style = "darker"
        vim.cmd.colorscheme "material"
    end
}
