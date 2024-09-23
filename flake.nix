{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
    inputs.flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs { 
            inherit system;
            config.allowUnfree = true;
          };

          myEnv = import ./env.nix {
            inherit pkgs;
          };
        in
        {
          packages = {
            inherit myEnv;
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
