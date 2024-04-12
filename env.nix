{ pkgs ? import <nixpkgs> { }
}:

pkgs.buildEnv {
  name = "my dev environment";
  paths = with pkgs; [
    direnv
    git
    iosevka
    k9s
    kubectl
    kubernetes-helm
    nixpkgs-fmt
    podman
    qemu
    starship
  ];
}
