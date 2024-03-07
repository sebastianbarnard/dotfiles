{
  inputs = {
    nixpkgs.follows = "nix-vscode-extensions/nixpkgs";
    flake-utils.follows = "nix-vscode-extensions/flake-utils";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs = { self, nixpkgs, flake-utils, nix-vscode-extensions }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};

          myEnv = import ./env.nix { inherit pkgs; };
        in
        {
          packages.default = myEnv;
        });
}
