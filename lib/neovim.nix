{
  wrapNeovimUnstable,
  neovim-unwrapped,
  neovimUtils,
  config_path,
  pkgs,
  lib,
  base16-theme ? null,
  ...
}: let
  config = let
    plugins = with pkgs.vimPlugins; [
      undotree
      tinted-vim
    ];
    extraPackages = [];
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
