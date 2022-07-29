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

  dontPatch = false;
  patches = [ ./local-repositories.patch ];

  postPatch =
    let
      juce-src = pkgs.fetchgit {
        url = "https://github.com/juce-framework/JUCE.git";
        rev = "4c43bf429e90690cb1f05b7c8a044cc9f5a59e7d";
        sha256 = "07ncsgis18gnbpcya85ikgykldnaj5xmyfcrdjm2rzzg30f9n07h";
        fetchLFS = false;
        fetchSubmodules = false;
        deepClone = false;
        leaveDotGit = false;
      };

      rwq-src = pkgs.fetchgit {
        url = "https://github.com/cameron314/readerwriterqueue";
        rev = "8e7627d18c2108aca178888d88514179899a044f";
        sha256 = "15yqw51lfmib03rj81vnizpnyf2fi11qk4zfvsq6br158znmgcw3";
        fetchLFS = false;
        fetchSubmodules = false;
        deepClone = false;
        leaveDotGit = false;
      };
    in
    ''
      cp -r ${juce-src} ./JUCE
      cp -r ${rwq-src} ./readerwriterqueue
      chmod +w ./JUCE -R
      chmod +w ./readerwriterqueue -R
    '';

  buildPhase =
    '' 
      cmake -S . -B $src/build
    '';

  installPhase = ''
    mkdir $out
    cd ./build
    cp -r . $out
  '';
}
