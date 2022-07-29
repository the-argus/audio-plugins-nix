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
    git
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

  patchPhase =
    let
      juce-src = pkgs.fetchgit {
        url = "https://github.com/juce-framework/JUCE.git";
        rev = "4c43bf429e90690cb1f05b7c8a044cc9f5a59e7d";
        # date = "2022-07-13T22:59:27+01:00";
        # path = "/nix/store/p3zsd1j0wxbwfbi6q5gs2fsjjyb4357s-JUCE";
        sha256 = "07ncsgis18gnbpcya85ikgykldnaj5xmyfcrdjm2rzzg30f9n07h";
        fetchLFS = false;
        fetchSubmodules = false;
        deepClone = false;
        leaveDotGit = false;
      };
    in
    ''
      mkdir -p ./build/_deps/
      cp -r ${juce-src} ./build/_deps/juce-src
    '';

  buildPhase =
    '' 
      cmake -S . -B ./build
    '';

  installPhase = ''
    mkdir $out
    cd build
    cp -r . $out
  '';
}
