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
      emmet-language-server
      vscode-langservers-extracted
      python3Packages.python-lsp-server
      typst
      tinymist
      imagemagick
    ];

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars

      undotree
      vim-table-mode
      marks-nvim

      vim-obsession
      vim-rsi

      neogit
      snacks-nvim

      telescope-nvim
      mini-nvim
      actions-preview-nvim
      oil-nvim
      typst-preview-nvim

      luasnip
      nvim-lspconfig
      nvim-jdtls

      zen-mode-nvim

      tender-vim
    ];
  in
    neovimUtils.makeNeovimConfig {
      inherit plugins;
      inherit extraPackages;
      vimAlias = true;
      viAlias = true;

      customRC = ''
        set runtimepath^=${config_path}
        set runtimepath^=${config_path}/after
        let g:snippets ="${config_path}/snippets"
        let g:jdt="${lib.getExe pkgs.jdt-language-server}"
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
