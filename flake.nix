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

          alacrittyConfig = pkgs.writeText "alacritty.toml" (builtins.readFile ./alacritty.toml);
          starshipConfig = pkgs.writeText "starship.toml" (builtins.readFile ./starship.toml);
          nvimConfig = pkgs.runCommand "nvim-config" { } ''
            mkdir -p $out
            cp -r ${./nvim}/* $out
          '';

          applyConfig = pkgs.writeShellScriptBin "apply-config" ''
            echo "Applying configuration..."

            mkdir -pv ~/.config/alacritty
            ln -sf ${alacrittyConfig} ~/.config/alacritty/alacritty.toml

            ln -sf ${starshipConfig} ~/.config/starship.toml

            mkdir -pv ~/.config/nvim
            ln -sf ${nvimConfig}/* ~/.config/nvim/
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
