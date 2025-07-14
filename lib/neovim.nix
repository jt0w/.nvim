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
    ];
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      undotree
      tinted-vim
      telescope-nvim
      render-markdown-nvim
      vim-table-mode
      snacks-nvim
      mini-nvim

      nvim-lspconfig
      fidget-nvim

      # from the GOD himself
      vim-rsi
      vim-fugitive
      vim-endwise
      vim-vinegar
    ];
    extraRC = lib.optionalString (base16-theme != null) ''
      let tinted_background_transparent=1
      color base16-${base16-theme}
    '';
  in
    neovimUtils.makeNeovimConfig {
      inherit plugins;
      vimAlias = true;
      viAlias = true;

      customRC =
        ''
          set runtimepath^=${config_path}
          set runtimepath^=${config_path}/after
          source ${config_path + "/init.lua"}
        '' + extraRC;
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
