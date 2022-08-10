{ pkgs, ... }:
pkgs.stdenv.mkDerivation rec {
    pname = "dexed-synth";
    version = "0.9.6";
    src = pkgs.fetchgit {
        url = "https://github.com/asb2m10/dexed";
        rev = "2c036316bcd512818aa9cc8129767ad9e0ec7132";
        sha256 = "0px7qr91mzinz2979zkpbv17ds82hc1bkzn3jzx3xpkvxdpfnw8c";
        fetchSubmodules = true;
        deepClone = true;
    };

  cmakeFlags = [ "-DJUCE_COPY_PLUGIN_AFTER_BUILD=TRUE" ];

  nativeBuildInputs = with pkgs; [
    cmake
    pkgconfig

    # juceaide
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

    # final build deps
    libjack2
  ];

}
