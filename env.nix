{ pkgs ? import <nixpkgs> {} }:

pkgs.buildEnv {
  name = "My dev environment";
  paths = [
    pkgs.git
  ];
}
