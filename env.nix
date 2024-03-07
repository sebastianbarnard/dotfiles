{ pkgs ? import <nixpkgs> {} }:

pkgs.buildEnv {
  name = "My dev environment";
  paths = with pkgs; [
    colima
    direnv
    git
    k9s
    nixpkgs-fmt
    starship
  ];
}
