local jdtls = require('jdtls')
local config = {
    cmd = {'jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
jdtls.start_or_attach(config)

vim.keymap.set("n","<A-o>", function() jdtls.organize_imports() end)
vim.keymap.set("n","<leader>c", function() jdtls.compile() end)
