require("yazi").setup {
    open_for_directories = true,
}
vim.keymap.set("n", "<leader>e", function()
  require("yazi").yazi()
end)
