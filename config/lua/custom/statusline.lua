local builtin = require "el.builtin"
local extensions = require "el.extensions"
local subscribe = require "el.subscribe"
local sections = require "el.sections"

vim.opt.laststatus = 3

require("el").setup {
    generator = function()
        local s = {}
        table.insert(s, extensions.mode);
        table.insert(s, " ")

        table.insert(
            s,
            subscribe.buf_autocmd("el-git-branch", "BufEnter", function(win, buf)
                local branch = extensions.git_branch(win, buf)
                if branch then
                    return branch
                end
            end)
        )

        table.insert(s, " ")

        table.insert(
            s,
            subscribe.buf_autocmd("el-git-changes", "BufWritePost", function(win, buf)
                local changes = extensions.git_changes(win, buf)
                if changes then
                    return changes
                end
            end)
        )

        table.insert(s, sections.split)
        table.insert(s,
            subscribe.buf_autocmd(
                "el_file_icon",
                "BufRead",
                function(_, buffer)
                    return extensions.file_icon(_, buffer)
                end
            ))
        table.insert(s, " ")
        table.insert(s, builtin.shortened_file)
        table.insert(s, " %m")
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
