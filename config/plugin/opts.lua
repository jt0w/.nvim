g.mapleader = " "
g.maplocalleader = " "

g.langmap = "äö"
g.c_syntax_for_h = true
o.guicursor = ""
o.nu = true
o.rnu = true
o.scrolloff = 15
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = false
o.undofile = true
o.splitright = true
o.splitbelow = true
o.hlsearch = true
o.incsearch = true
o.termguicolors = true
o.laststatus = 3
o.cmdheight = 1
o.wildmode = "longest,noselect"
o.clipboard = "unnamedplus"
o.syntax = "on"
o.winborder = "rounded"
o.completeopt = { "menu", "menuone", "noselect" }
o.virtualedit = "block"
o.inccommand = "split"

o.fillchars = {
    eob = ' ',
}

o.lcs = {
    eol = "↲",
    space = "·",
    tab = "» ",
}
o.list = true

vim.fn.matchadd('errorMsg', [[\s\+$]])
