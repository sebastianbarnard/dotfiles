{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
    inputs.flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs { inherit system; };

          myEnv = import ./env.nix {
            inherit pkgs;
          };

          alacrittyConfig = pkgs.fetchurl
            {
              url = "https://raw.githubusercontent.com/MasterOfPoppets/dotfiles/main/alacritty.toml";
              sha256 = "sha256-nHl1SvAz+xPEZi69h21ziqA2L6pWnvXaOyaoDL+GA04=";

            };

          starshipConfig = pkgs.fetchurl
            {
              url = "https://raw.githubusercontent.com/MasterOfPoppets/dotfiles/main/starship.toml";
              sha256 = "sha256-oBaVVM/4SRfuQLV67JNDEqF5p4amihn5U+L2Z6zdhNM=";
            };

          applyConfig = pkgs.writeShellScriptBin "apply-config" ''
            echo "Applying configuration..."

            mkdir -p ~/.config

            mkdir -p ~/.config/alacritty
            cp ${alacrittyConfig} ~/.config/alacritty/alacritty.toml

            cp ${starshipConfig} ~/.config/starship.toml
          '';
        in
        {
          packages = {
            inherit myEnv applyConfig;
            default = myEnv;
          };
        }
      );
}
