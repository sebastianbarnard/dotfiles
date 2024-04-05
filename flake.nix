{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {nixpkgs, ...} @ inputs:
    inputs.flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs { inherit system; };
          
          myEnv = import ./env.nix {
            inherit pkgs;
          };
        in
        {
          packages = {
            inherit myEnv;
            default = myEnv;
          };
        }
      );
}
