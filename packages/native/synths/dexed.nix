{pkgs, ...}:
pkgs.stdenv.mkDerivation rec {
  pname = "dexed-synth";
  version = "0.9.6";
  src = pkgs.fetchgit {
    url = "https://github.com/asb2m10/dexed";
    rev = "2c036316bcd512818aa9cc8129767ad9e0ec7132";
    sha256 = "sha256-ZLKPZPAjnqtZC8QD2FUxNLEMi2dYHLwVamERPU18Q/s=";
    fetchSubmodules = true;
    deepClone = true;
  };

  enableParallelBuilding = true;

  configurePhase = ''
    mkdir build
    pushd build
    cmake $src
    popd
  '';
  buildPhase = ''
    pushd build
    cmake --build . ${
      if enableParallelBuilding
      then "-j$NIX_BUILD_CORES"
      else ""
    }
    popd
  '';

  installPhase = ''
    mkdir $out
    cp ./build/Source/Dexed_artefacts/VST3/Dexed.vst3/Contents/x86_64-linux/Dexed.so $out/
  '';

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
