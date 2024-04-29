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
    k9s
    kubectl
    kubernetes-helm
    lazygit
    neovim
    nixpkgs-fmt
    nodejs_20
    qemu
    ripgrep
    starship
  ];
}
