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
        i(0),
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
  s({ trig = "ifndef" },
    fmta([[
    #ifndef <>
    #define <> <>
    #endif
    ]],
      {
        i(1),
        rep(1),
        i(2)
      })
  ),
  s({ trig = "for" },
    fmta([[
    for (<> <> = <>; <> <> <>; ++<>) {
      <>
    }
    ]],
      {
        i(1, "size_t"),
        i(2, "i"),
        i(3, "0"),
        rep(2),
        i(4, "<"),
        i(5),
        rep(2),
        i(0),
      })
  ),
  s({ trig = "inc" },
    fmta([[
    #include <>
    ]],
      {
        i(0),
      })
  ),
  s({ trig = "struct" },
    fmta([[
    typedef struct {
      <>
    } <>;
    ]],
      {
        i(1);
        i(0);
      })
  ),
  s({ trig = "enum" },
    fmta([[
    typedef enum {
      <>
    } <>;
    ]],
      {
        i(1);
        i(0);
      })
  ),
  s({ trig = "dastruct" },
    fmta([[
    typedef struct {
      <> *items;
      size_t count;
      size_t cap;
    } <>;
    ]],
      {
        i(1);
        i(0);
      })
  ),
}
