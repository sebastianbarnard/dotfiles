{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = inputs.nixpkgs.legacyPackages.${system}.extend inputs.nix-vscode-extensions.overlays.default;

          myEnv = import ./env.nix {
            inherit pkgs;
          };
        in
        {
          packages.default = myEnv;
        }
      );
}
