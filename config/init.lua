local g = vim.g
local o = vim.opt

g.mapleader = " "
g.maplocalleader = " "

g.netrw_browser_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25
g.netrw_cursor = false
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
o.splitbelow = false
o.hlsearch = true
o.incsearch = true
o.termguicolors = true
o.signcolumn = "yes"
o.clipboard = "unnamedplus"
o.winborder = "rounded"
o.completeopt = { "menuone", "noselect", "popup" }
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

require "marks".setup {
  builtin_marks = { "<", ">", "^" },
  refresh_interval = 250,
  sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
  excluded_filetypes = {},
  excluded_buftypes = {},
  mappings = {}
}

local map = vim.keymap.set

map("n", "<esc>", "<cmd>noh<cr>")

-- Brilliant keymaps i stole from https://github.com/ThePrimeagen/init.lua
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")

map("n", "<leader>u", vim.cmd.UndotreeToggle)

map("n", "<leader>o", "<cmd>copen<cr>")
map("n", "<leader>q", "<cmd>cclose<cr>")
map("n", "<leader>j", "<cmd>cnext<cr>")
map("n", "<leader>k", "<cmd>cprev<cr>")

map("n", "<c-j>", "<c-w><c-j>")
map("n", "<c-k>", "<c-w><c-k>")
map("n", "<c-l>", "<c-w><c-l>")
map("n", "<c-h>", "<c-w><c-h>")

map("n", "<C-t>", "<cmd>split +term<cr>i")
map("t", "<C-t>", "<cmd>quit<cr>")
map("t", "<esc>", [[<C-\><C-n>]])

map("n", "<leader>S", "#<cmd>vimgrep //j **/*<cr><cmd>copen<cr>")
map("n", "<leader>s", function()
  vim.ui.input({ prompt = "Grep: " }, function(input)
    if input == nil then
      return
    end
    vim.cmd.grep({ args = { vim.fn.shellescape(input) } })
    vim.cmd.copen()
  end)
end)


map("n", "<leader>gs", function()
  require("neogit").open({ kind = "floating" });
end);

map("n", "<leader>C", function()
  vim.ui.input({ prompt = "Command: ", completion = "shellcmdline" }, function(input)
    if input == nil then
      return
    end
    o.makeprg = input
    vim.cmd.make()
  end)
end)

map("n", "<leader>cc", vim.cmd.make)

require("mini.align").setup()
require("mini.splitjoin").setup()
require("mini.surround").setup()

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

local tele = require("telescope")
local builtin = require("telescope.builtin")
tele.setup({
  defaults = {
    borderchars = {
      "─", -- top
      "│", -- right
      "─", -- bottom
      "│", -- left
      "┌", -- top-left
      "┐", -- top-right
      "┘", -- bottom-right
      "└", -- bottom-left
    },
    layout_config = {
      height = 100,
      width = 400,
      prompt_position = "top",
      preview_cutoff = 40,
    }
  }
})

map("n", "<leader>f", builtin.find_files)
map("n", "<leader>b", builtin.buffers)

require("actions-preview").setup({
  backend = { "telescope" },
})

map("n", "<leader>ca", require("actions-preview").code_actions)

require("oil").setup({
  columns = {
    "permissions",
    "size",
    "mtime",
    "icon",
  },
  skip_confirm_for_simple_edits = true,
  prompt_save_on_select_new_entry = false,
  watch_for_changes = true,
  view_options = {
    show_hidden = true,
  },
})
vim.keymap.set("n", "<leader>e", require("oil").open)

require("luasnip").setup({
  enable_autosnippets = true,
  updateevents = "TextChanged,TextChangedI"
})

require("luasnip.loaders.from_lua").load({ paths = { vim.g.snippets } })
local ls = require "luasnip"

vim.keymap.set({ "i", "s" }, "<c-k>", function() return ls.expand_or_jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<c-j>", function() return ls.jump(-1) end, { silent = true })

vim.cmd.colorscheme("tender")
