local jdtls = require('jdtls')
local root_dir = require('jdtls.setup').find_root(root_markers)
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local config = {
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    settings = {
        eclipse = {
            downloadSources = true,
        },
        maven = {
            downloadSources = true,
        },
        signatureHelp = { enabled = true },
        contentProvider = { preferred = 'fernflower' },  -- Use fernflower to decompile library code
    },
    cmd = {
        'jdtls',
        '-Xmx4g',
        '--add-modules=ALL-SYSTEM',
        '-data' .. workspace_folder,
    },
}
jdtls.start_or_attach(config)

vim.keymap.set("n","<A-o>", function() jdtls.organize_imports() end)
vim.keymap.set("n","<leader>c", function() jdtls.compile() end)
