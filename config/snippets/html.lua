---@diagnostic disable: undefined-global

return {
  s({ trig = "tag" },
    fmt([[
  <{}>
  {}
  </{}>
  ]],
      {
        i(1),
        i(0),
        rep(1),
      })),
  s({ trig = "itag" },
    fmt([[<{}>{}</{}>{}]],
      {
        i(1),
        i(2),
        rep(1),
        i(0)
      })),
}
