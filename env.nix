{ pkgs ? import <nixpkgs> { }
}:

pkgs.buildEnv {
  name = "my dev environment";
  paths = with pkgs; [
    awscli2
    direnv
    docker
    git
    k3d
    k9s
    kubectl
    kubernetes-helm
    nixpkgs-fmt
    fnm
    python3
    terraform
  ];
}
