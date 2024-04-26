{ pkgs ? import <nixpkgs> { }
}:

pkgs.buildEnv {
  name = "my dev environment";
  paths = with pkgs; [
    alacritty
    colima
    direnv
    docker
    fd
    gcc
    git
    httpie
    iosevka
    k9s
    kubectl
    kubernetes-helm
    neovim
    nixpkgs-fmt
    qemu
    ripgrep
    starship
  ];
}
