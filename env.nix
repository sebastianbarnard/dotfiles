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
    jetbrains-toolbox
    kubernetes-helm
    nixpkgs-fmt
    fnm
    python3
    terraform
    warp-terminal
    mesa.drivers
    vulkan-tools
    libGL
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
  ];
}
