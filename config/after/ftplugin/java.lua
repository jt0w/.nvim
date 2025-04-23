local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '~/.jdt-cache/' .. project_name
local config = {
    cmd = {
        vim.g.jdt,
        '-data' .. workspace_dir,
    },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
