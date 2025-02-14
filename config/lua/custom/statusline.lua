local builtin = require "el.builtin"
local extensions = require "el.extensions"
local subscribe = require "el.subscribe"
local sections = require "el.sections"

vim.opt.laststatus = 3

require("el").setup {
    generator = function()
        local s = {}
        table.insert(s, extensions.mode);

        table.insert(s, sections.split)
        table.insert(s, "%m")
        table.insert(s, " %f ")
        table.insert(s, "%m")
        table.insert(s, sections.split)

        table.insert(s, "[")
        table.insert(s, builtin.line_number)
        table.insert(s, " : ")
        table.insert(s, builtin.column_number)
        table.insert(s, "]")

        table.insert(s, builtin.filetype)

        return s
    end,
}
