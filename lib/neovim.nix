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
      render-markdown-nvim
      vim-table-mode
      marks-nvim

      vim-obsession
      vim-fugitive
      vim-rsi

      telescope-nvim
      mini-nvim
      actions-preview-nvim
      oil-nvim
      typst-preview-nvim

      luasnip

      nvim-lspconfig
      nvim-jdtls

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
          let g:jdt="${lib.getExe pkgs.jdt-language-server}"
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
