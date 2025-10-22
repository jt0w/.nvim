-- stolen from vimothee: https://github.com/SylvanFranklin/.config/blob/3410b44e90462f55cad7c1d58bc5cb1a3b3c8177/nvim/snippets/typst.lua
---@diagnostic disable: undefined-global

return {
  s({ trig = "mt", snippetType = "autosnippet" },
    fmta("$<>$ ", { i(1) })
  ),
  s({ trig = "mmt", snippetType = "autosnippet" },
    fmta("$ <> $ ", { i(1) })
  ),
}
