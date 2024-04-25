{ pkgs ? import <nixpkgs> { }
}:

pkgs.buildEnv {
  name = "my dev environment";
  paths = with pkgs; [
    alacritty
    colima
    direnv
    docker
    git
    httpie
    iosevka
    k9s
    kubectl
    kubernetes-helm
    neovim
    nixpkgs-fmt
    qemu
    starship
  ];
}
