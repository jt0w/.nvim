local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '~/.jdt-cache/' .. project_name
local config = {
  cmd = {
    vim.g.jdt,
    '-data' .. workspace_dir,
  },
  settings = {
    java = {
      configuration = {
        updateBuildConfiguration = "automatic", -- <- crucial for Gradle auto-import
      },
    },
  },
}

require('jdtls').start_or_attach(config)
