{
  wrapNeovimUnstable,
  neovim-unwrapped,
  neovimUtils,
  buildFHSEnv,
  writeShellScript,
  config_path,
  pkgs,
  ...
}: let
  nvim = let
    config = let
      extraPackags = with pkgs; [
        cargo
        opam
        go
      ];
    in
      neovimUtils.makeNeovimConfig {
        customRC = ''
          set runtimepath^=${config_path}
          source ${config_path + "/init.lua"}
        '';
      };
  in
    wrapNeovimUnstable neovim-unwrapped config;
in
  buildFHSEnv {
    name = "nvim";
    targetPkgs = pkgs: [
      nvim
    ];
    runScript = writeShellScript "run-nvim.sh" ''
      exec ${nvim}/bin/nvim "$@"
    '';
  }
