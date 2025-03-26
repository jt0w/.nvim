{
  wrapNeovimUnstable,
  neovim-unwrapped,
  neovimUtils,
  config_path,
  pkgs,
  lib,
  ...
}: let
  config = let
    extraPackages = with pkgs; [
      rust-analyzer
      ccls
      gdb
      zls
      gopls
      nil
    ];
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      vim-nix
      telescope-nvim
      snacks-nvim
      neorg
      render-markdown-nvim
      vim-table-mode
      neocord
      mini-nvim

      vim-fugitive
      gitsigns-nvim
      octo-nvim

      direnv-vim
      nvim-ufo

      oil-nvim

      # lsp
      nvim-lspconfig
      fidget-nvim

      # debugging / dap
      nvim-dap
      nvim-dap-ui
      nvim-nio
      nvim-dap-virtual-text

      luasnip
      friendly-snippets

      catppuccin-nvim
    ];
  in
    neovimUtils.makeNeovimConfig {
      inherit extraPackages;
      inherit plugins;
      vimAlias = true;
      viAlias = true;

      customRC = ''
        set runtimepath^=${config_path}
        set runtimepath^=${config_path}/after
        source ${config_path + "/init.lua"}
      '';
    }
    // {
      wrapperArgs = [
        "--prefix"
        "PATH"
        ":"
        "${lib.makeBinPath extraPackages}"
      ];
    };
in
  wrapNeovimUnstable neovim-unwrapped config
