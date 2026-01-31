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
      elan
    ];

    plugins = with pkgs.vimPlugins; [
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
      lean-nvim

      luasnip

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
