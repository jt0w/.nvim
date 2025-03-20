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
      zls
      gopls
      ccls
      nil
    ];
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      vim-nix
      telescope-nvim
      snacks-nvim
      neorg
      render-markdown-nvim
      neocord
      vim-fugitive
      direnv-vim
      nvim-ufo
      # lsp
      nvim-lspconfig
      fidget-nvim
      # cmp
      nvim-cmp
      cmp-path
      cmp-buffer
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      luasnip
      friendly-snippets

      # EVIL AI
      (pkgs.callPackage ./avante.nix {})

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
