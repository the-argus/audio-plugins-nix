{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  pname = "Fire";
  version = "1.0.0";

  src = pkgs.fetchurl {
    url = "https://github.com/jerryuhoo/Fire/archive/refs/tags/v1.0.0.tar.gz";
    sha256 = "1bm11fpwf4iknyjpjvxdmxw8gcmmlvyqpn40mgly31j8x3lq2x5b";
    name = "Fire-1.0.0-src.tar.gz";
  };

  nativeBuildInputs = with pkgs; [
    cmake
    pkgconfig
    xorg.libX11
    xorg.libXrandr
    xorg.libXinerama
    xorg.libXext
    xorg.libXcursor
    freetype

    # extra modules
    alsaLib
    gtk3-x11
    webkitgtk

    # pkgconfig
    pcre
  ];

  buildPhase = ''
    cmake -S . -B ./build
  '';

  installPhase = ''
    mkdir $out
    cd build
    cp -r . $out
  '';
}