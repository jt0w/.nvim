{
  wrapNeovimUnstable,
  neovim-unwrapped,
  neovimUtils,
  buildFHSEnv,
  writeShellScript,
  config_path,
  ...
}: let
  nvim = let
    config = neovimUtils.makeNeovimConfig {
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
