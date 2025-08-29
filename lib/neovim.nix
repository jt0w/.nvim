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
      typst
      tinymist
    ];

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars

      undotree
      render-markdown-nvim
      vim-table-mode

      typst-preview-nvim

      vim-obsession
      vim-fugitive

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
