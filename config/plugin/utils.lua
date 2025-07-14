function create_floating_window(f)
  local buf = vim.api.nvim_create_buf(false, true)


  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local opts = {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    border = "rounded",  -- other options: "single", "double", "solid", "none"
  }

  local win = vim.api.nvim_open_win(buf, true, opts)
  if (f) then
    f()
  end

  vim.keymap.set("n", "q", vim.cmd.quit, {buffer =  buf})
  vim.keymap.set("n", "<esc>", vim.cmd.quit, {buffer =  buf})
  vim.api.nvim_win_set_option(win, 'winblend', 20)
end

vim.keymap.set("n", "<leader>c", function()
  vim.ui.input ({completion="shellcmdline"}, function(c) 
    if c and c~="" then 
      create_floating_window(function()
        vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.systemlist(c))
      end)
    end 
  end) 
end)

vim.keymap.set("n", "<leader>s", function() create_floating_window() end) 
vim.keymap.set("n", "<leader>t", function() 
  create_floating_window(vim.cmd.term)
end) 

vim.keymap.set("n", "<leader>af", function(opts)
  vim.ui.input ({completion = "filetype"}, function(c) 
    if c and c~="" then
      vim.bo[vim.api.nvim_get_current_buf()].ft = c
    end 
  end) 
end)
