vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "MiniPickNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "MiniPickBorder", { bg = "NONE" })
  end,
})

require("catppuccin").setup {
  flavour = "mocha",
}

vim.cmd.colorscheme("catppuccin")
