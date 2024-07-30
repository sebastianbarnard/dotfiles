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

          starshipConfig = pkgs.writeText "starship.toml" (builtins.readFile ./starship.toml);
          nvimConfig = pkgs.runCommand "nvim-config" { } ''
            mkdir -p $out
            cp -r ${./nvim}/* $out
          '';

          applyConfig = pkgs.writeShellScriptBin "apply-config" ''
            echo "Applying configuration..."

            ln -sf ${starshipConfig} ~/.config/starship.toml

            mkdir -pv ~/.config/nvim/lua/plugins
            ln -sf ${nvimConfig}/init.lua ~/.config/nvim/init.lua
            ln -sf ${nvimConfig}/lua/vim-options.lua ~/.config/nvim/lua/vim-options.lua
            for file in ${nvimConfig}/lua/plugins/*; do
              ln -sf "$file" ~/.config/nvim/lua/plugins/
            done
          '';
        in
        {
          packages = {
            inherit myEnv nvimConfig applyConfig;
            default = myEnv;
          };

          devShells.default = pkgs.mkShell {
            name = "dotfiles";

            packages = with pkgs; [
              nixpkgs-fmt
              stylua
            ];
          };
        }
      );
}
