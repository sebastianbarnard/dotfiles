{ pkgs ? import <nixpkgs> { }
}:

pkgs.buildEnv {
  name = "my dev environment";
  paths = with pkgs; [
    awscli2
    colima
    direnv
    docker
    fd
    gcc
    git
    httpie
    k9s
    kitty
    kubectl
    kubernetes-helm
    lazygit
    neovim
    nixpkgs-fmt
    nodejs_20 
    python3
    qemu
    ripgrep
    starship
    terraform
  ];
}
