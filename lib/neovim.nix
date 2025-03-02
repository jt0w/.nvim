{
  wrapNeovimUnstable,
  neovim-unwrapped,
  neovimUtils,
  buildEnv,
  writeShellScript,
  config_path,
  pkgs,
  lib,
  ...
}: let
  nvim = let
    config = let
      extraPackags = with pkgs; [
        rust-analyzer-unwrapped
        zls
        gopls
        ccls
        lua-language-server
        nil
        luarocks
      ];
    in
      neovimUtils.makeNeovimConfig {
        inherit extraPackags;

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
          "${lib.makeBinPath extraPackags}"
        ];
      };
  in
    wrapNeovimUnstable neovim-unwrapped config;
in
  buildEnv {
    name = "nvim";
    paths = [
      nvim
    ];
  }
