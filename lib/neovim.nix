{
  wrapNeovimUnstable,
  neovim-unwrapped,
  neovimUtils,
  buildFHSEnv,
  writeShellScript,
  config_path,
  pkgs,
  lib,
  ...
}: let
  nvim = let
    config = let
      extraPackags = with pkgs; [
        cargo
        opam
        ocaml
        ocamlPackages.ocamlformat
        go
      ];
    in
      neovimUtils.makeNeovimConfig {
        inherit extraPackags;

        customRC = ''
          set runtimepath^=${config_path}
          source ${config_path + "/init.lua"}
        '';
      }
      // {
        wrapperArgs = [
                "--prefix"
                "PATH"
                ":"
                "${lib.makeBinPath extraPackags}"
            ];
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
