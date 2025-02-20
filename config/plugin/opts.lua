local g = vim.g
local o = vim.opt

g.netrw_browser_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25
g.netrw_cursor = false
g.langmap = "äö"

g.c_syntax_for_h = true

o.wrap = false
o.number = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.breakindent = true

o.swapfile = false
o.backup = false
o.undofile = true

o.splitright = true
o.splitbelow = true

o.hlsearch = true
o.incsearch = true
o.termguicolors = true

o.scrolloff = 15
o.signcolumn = "yes"
o.completeopt = { "menu", "menuone", "noselect" }
o.updatetime = 50
o.belloff = "all"

o.list = true
o.lcs = "eol:↲,tab:» ,trail:·"
o.conceallevel = 2
o.foldlevel = 999
o.cursorline = true

o.virtualedit = "block"
o.inccommand = "split"
o.background = "dark"
o.clipboard = "unnamedplus"
