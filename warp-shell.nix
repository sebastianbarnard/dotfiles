with import <nixpkgs> {};

mkShell {
  buildInputs = [
    warp-terminal
    mesa.drivers
    vulkan-tools
    libGL
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
  ];

  shellHook = ''
    export LD_LIBRARY_PATH=${lib.makeLibraryPath buildInputs}:$LD_LIBRARY_PATH
  '';
}
