g.mapleader = " "
g.maplocalleader = " "

g.netrw_browser_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25
g.netrw_cursor = false
g.langmap = "äö"
vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>")
vim.keymap.set("n", "H", "-")

g.c_syntax_for_h = true

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
o.laststatus = 0
o.wildmode = "longest,noselect"
o.clipboard = "unnamedplus"
o.syntax = "on"

o.fillchars = {
  eob = ' ',
}

o.lcs = {
  eol = "↲",
  tab = "» ",
}
o.list = true
