{ pkgs ? import <nixpkgs> {} }:

pkgs.buildEnv {
  name = "My dev environment";
  paths = with pkgs; [
    direnv
    git
    nixpkgs-fmt
    starship
  ];
}
