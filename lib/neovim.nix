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
      zls
      gopls
      nil
      jdt-language-server
      lua-language-server
      python3Packages.python-lsp-server
      typst
      tinymist
    ];

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars

      undotree
      vim-table-mode
      marks-nvim

      vim-obsession
      vim-rsi

      neogit

      telescope-nvim
      mini-nvim
      actions-preview-nvim
      oil-nvim
      typst-preview-nvim

      luasnip
      nvim-lspconfig

      tender-vim
    ];
  in
    neovimUtils.makeNeovimConfig {
      inherit plugins;
      vimAlias = true;
      viAlias = true;

      customRC = ''
          set runtimepath^=${config_path}
        set runtimepath^=${config_path}/after
          let g:snippets ="${config_path}/snippets"
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
