return {
  name = "chimera",
  builder = function()
    return {
      cmd = { "./make" },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "c" },
  },
}
