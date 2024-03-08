{ pkgs ? import <nixpkgs> { } }:
let
  inherit (pkgs) vscode-with-extensions vscodium;

  vscodiumWithExtensions = vscode-with-extensions.override {
    vscode = vscodium;
    vscodeExtensions = with pkgs.vscode-marketplace; [
      dracula-theme.theme-dracula
      jnoortheen.nix-ide
      mkhl.direnv
    ];
  };
in

pkgs.buildEnv {
  name = "my dev environment";
  paths = with pkgs; [
    colima
    direnv
    docker
    git
    k9s
    kubectl
    nixpkgs-fmt
    starship
    vscodiumWithExtensions
  ];
}
