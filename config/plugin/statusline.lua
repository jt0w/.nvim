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
  local status = vim.lsp.status()
  if status ~= "" then
    str = str .. ": " .. status
  end

  str = str .. "]"
  return str
end

local statusline = {
  " ",
  "[%{&filetype} %l:%c %p%%]",
  " %{FugitiveStatusline()}",
  "%r",
  "%=",
  "[%f]%m",
  "%=",
  "%{%v:lua.Diagnostics()%}",
  "%{%v:lua.LspStatus()%}",
  " ",
}

vim.o.statusline = table.concat(statusline, "")
