g = vim.g
o = vim.opt

g.mapleader = " "
g.maplocalleader = " "

g.netrw_browser_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25
g.netrw_cursor = false

g.c_syntax_for_h = true
o.guicursor = ""
o.nu = true
o.rnu = true
o.scrolloff = 15
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.undofile = true
o.splitright = true
o.splitbelow = true
o.hlsearch = true
o.incsearch = true
o.termguicolors = true
o.clipboard = "unnamedplus"
o.winborder = "rounded"
o.completeopt = { "menu", "menuone", "noselect" }
o.virtualedit = "block"
o.inccommand = "split"
o.signcolumn = "yes"

o.fillchars = {
    eob = ' ',
}

o.lcs = {
    eol = "↲",
    space = "·",
    tab = "» ",
}
o.list = true

vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")

-- Brilliant keymaps i stole from https://github.com/ThePrimeagen/init.lua
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<leader>o", "<cmd>copen<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>cclose<cr>")
vim.keymap.set("n", "<leader>j", "<cmd>cnext<cr>")
vim.keymap.set("n", "<leader>k", "<cmd>cprev<cr>")

vim.keymap.set("n", "<c-j>", "<c-w><c-j>")
vim.keymap.set("n", "<c-k>", "<c-w><c-k>")
vim.keymap.set("n", "<c-l>", "<c-w><c-l>")
vim.keymap.set("n", "<c-h>", "<c-w><c-h>")

vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>")

vim.keymap.set("n", "<leader>C", function()
    vim.ui.input({prompt = "Command: "}, function(input)
        o.makeprg = input
        vim.cmd.make()
    end)
end)

vim.keymap.set("n", "<leader>c", vim.cmd.make)

require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
    },
})

vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>");

require("catppuccin").setup { transparent_background = true }
vim.cmd.colorscheme("catppuccin")
