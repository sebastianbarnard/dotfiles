{ pkgs ? import <nixpkgs> {} }:

pkgs.buildEnv {
  name = "My dev environment";
  paths = with pkgs; [
    colima
    direnv
    docker
    git
    k9s
    kubectl
    nixpkgs-fmt
    starship
  ];
}
