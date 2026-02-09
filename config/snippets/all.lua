---@diagnostic disable: undefined-global

return {
  s("date", t(os.date("%d/%m/%Y"))),
  s("time", t(os.date("%X"))),
  s("datetime", t(os.date("%d/%m/%Y %X"))),
  s("gh", t("github.com/jt0w")),
}
