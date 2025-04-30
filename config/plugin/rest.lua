---@type rest.Opts
vim.g.rest_nvim = {
}

require("telescope").load_extension("rest")
vim.keymap.set("n", "<leader>te", function() require("telescope").extensions.rest.select_env() end, {desc = "Switch Env files"})
