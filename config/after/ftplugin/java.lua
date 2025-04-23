local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.expand('~/.jdt-cache/' .. project_name)
local config = {
    cmd = {
        vim.g.jdt,
        '-data' .. workspace_dir,
    },
    init_options = {
        bundles = {}, -- Add any debugger/test support jars here if needed
    },
    settings = {
        java = {
            configuration = {
                updateBuildConfiguration = "interactive", -- <- crucial for Gradle auto-import
            },
        },
    },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
