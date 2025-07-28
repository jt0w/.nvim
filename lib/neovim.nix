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
      typst
      tinymist
    ];

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-treesitter-context
      nvim-treesitter-context

      undotree
      render-markdown-nvim
      vim-table-mode
      snacks-nvim
      mini-nvim
      nvim-bqf

      oil-nvim

      nvim-lspconfig
      fidget-nvim
      typst-preview-nvim
      nvim-jdtls

      luasnip
      friendly-snippets

      # from the GOD himself
      vim-rsi
      vim-fugitive
      vim-endwise

      catppuccin-nvim
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
