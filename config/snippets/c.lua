---@diagnostic disable: undefined-global

return {
  s({ trig = "main" },
    fmta([[
    int main(int argc, char **argv) {
      <>
      return 0;
    }
    ]],
    {
      i(1),
    })
  ),
  s({ trig = "once" },
    fmta([[
    #ifndef <>_H
    #define <>_H
    <>
    #endif // endif <>_H
    ]],
    {
      i(1),
      rep(1),
      i(2),
      rep(1),
    })
  ),
}
