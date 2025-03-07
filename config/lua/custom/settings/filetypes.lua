vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})


vim.api.nvim_create_autocmd("FileType", {
    pattern = { "nix" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "go" },
    callback = function()
        vim.opt_local.expand_tab = false
    end
})
