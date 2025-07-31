local s = vim.keymap.set


s("n", "<esc>", "<cmd>noh<cr>")

s("t", "<esc>",  [[<C-\><C-n>]], {noremap = true, silent = true})
s("n", "<leader>,", "<C-^>")

-- Brilliant keymaps i stole from https://github.com/ThePrimeagen/init.lua
s("v", "K", ":m '<-2<CR>gv=gv")
s("v", "J", ":m '>+1<CR>gv=gv")

s("n", "<leader>u", vim.cmd.UndotreeToggle)

s("n", "<leader>o", "<cmd>copen<cr>")
s("n", "<leader>q", "<cmd>cclose<cr>")
s("n", "<leader>j", "<cmd>cnext<cr>")
s("n", "<leader>k", "<cmd>cprev<cr>")
