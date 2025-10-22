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
o.path = "**"

o.fillchars = {
    eob = ' ',
}

o.lcs = {
    eol = "↲",
    space = "·",
    tab = "» ",
}
o.list = true
vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>");

vim.cmd.colorscheme("habamax")
