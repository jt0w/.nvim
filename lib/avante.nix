{
pkgs,
  lib,
  fetchFromGitHub,
  nix-update-script,
  openssl,
  pkg-config,
  rustPlatform,
  stdenv,
  vimPlugins,
  vimUtils,
}:
let
  version = "0.0.23";
  src = fetchFromGitHub {
    owner = "yetone";
    repo = "avante.nvim";
    rev = "078649971254baf086a71de75b85ffac672864f2";
    hash = "sha256-i0GxoHf9PJBfJwBoDG8OI1TNlOJGmhc8dAvt4gSdAyA=";
  };

  avante-nvim-lib = rustPlatform.buildRustPackage {
    pname = "avante-nvim-lib";
    inherit version src;


    cargoLock = {
      lockFile = ./Cargo.lock;
      outputHashes = {
        "hf-hub-0.4.1" = "sha256-8IkbFytOolQGyEhGzjqVCguSLYaN6E8BUgekf1auZUk=";
      };
    };
    nativeBuildInputs = with pkgs; [
      pkg-config
      perl
    ];

    buildInputs = [
      openssl
    ];

    buildFeatures = [ "luajit" ];

    checkFlags = [
      # Disabled because they access the network.
      "--skip=test_fetch_md"
      "--skip=test_hf"
      "--skip=test_public_url"
      "--skip=test_roundtrip"
    ];
  };
in
vimUtils.buildVimPlugin {
  pname = "avante.nvim";
  inherit version src;

  dependencies = with vimPlugins; [
    dressing-nvim
    nui-nvim
    nvim-treesitter
    plenary-nvim
  ];

  postInstall =
    let
      ext = stdenv.hostPlatform.extensions.sharedLibrary;
    in
    ''
      mkdir -p $out/build
      ln -s ${avante-nvim-lib}/lib/libavante_repo_map${ext} $out/build/avante_repo_map${ext}
      ln -s ${avante-nvim-lib}/lib/libavante_templates${ext} $out/build/avante_templates${ext}
      ln -s ${avante-nvim-lib}/lib/libavante_tokenizers${ext} $out/build/avante_tokenizers${ext}
    '';

  passthru = {
    updateScript = nix-update-script {
      attrPath = "vimPlugins.avante-nvim.avante-nvim-lib";
    };

    # needed for the update script
    inherit avante-nvim-lib;
  };

  nvimSkipModule = [
      # Requires setup with corresponding provider
      "avante.providers.azure"
      "avante.providers.copilot"
      "avante.providers.ollama"
      "avante.providers.vertex_claude"
    ];

  meta = {
    description = "Neovim plugin designed to emulate the behaviour of the Cursor AI IDE";
    homepage = "https://github.com/yetone/avante.nvim";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [
      ttrei
      aarnphm
    ];
  };
}
