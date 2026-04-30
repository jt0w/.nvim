function Diagnostics()
  local s = vim.diagnostic.status()
  if s == "" then
    return "[No Diagnostics]"
  end
  return "[" .. s .. "]"
end

function LspStatus()
  local lss = vim.lsp.get_clients({bufnr = 0})
  local str = "["

  if next(lss) == nil then
    str = str .. "No lsp"
  else
    for _, s in ipairs(lss) do
      str = str .. s.name
    end
  end
  str = str .. "]"
  return str
end

function Path()
  return vim.fn.pathshorten(vim.fn.expand("%:f"))
end

local statusline = {
  " ",
  "[%{&filetype} %l:%c %p%%]",
  " %{FugitiveStatusline()}",
  "%r",
  "%=",
  "[%{%v:lua.Path()%}]%m",
  "%=",
  "%{%v:lua.Diagnostics()%}",
  "%{%v:lua.LspStatus()%}",
  " ",
}

vim.o.statusline = table.concat(statusline, "")
