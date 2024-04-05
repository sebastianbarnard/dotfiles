{ pkgs ? import <nixpkgs> { }
}:

pkgs.buildEnv {
  name = "my dev environment";
  paths = with pkgs; [
    colima
    direnv
    docker
    git
    k9s
    kubectl
    kubernetes-helm
    nixpkgs-fmt
    starship
  ];
}
