{
  wrapNeovimUnstable,
  neovim-unwrapped,
  neovimUtils,
  config_path,
  pkgs,
  lib,
  base16-theme ? "everforest-dark-hard",
  ...
}: let
  config = let
    extraPackages = with pkgs; [
      rust-analyzer
      ccls
      zls
      gopls
      nil
      typst
      tinymist
    ];

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-treesitter-context
      nvim-treesitter-context

      undotree
      tinted-vim
      telescope-nvim
      render-markdown-nvim
      vim-table-mode
      snacks-nvim
      mini-nvim
      nvim-bqf

      oil-nvim

      nvim-lspconfig
      fidget-nvim
      typst-preview-nvim

      luasnip
      friendly-snippets

      # from the GOD himself
      vim-rsi
      vim-fugitive
      vim-endwise
    ];
  in
    neovimUtils.makeNeovimConfig {
      inherit plugins;
      vimAlias = true;
      viAlias = true;

      customRC = ''
        set runtimepath^=${config_path}
        set runtimepath^=${config_path}/after
        source ${config_path + "/init.lua"}
        let g:color="${base16-theme}"
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
