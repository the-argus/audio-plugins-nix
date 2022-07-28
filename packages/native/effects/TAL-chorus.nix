{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "TAL-Chorus";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/Tal-Chorus-LX_64_linux.zip";
    sha256 = "1hgvy0nb9813znjf8hih10gjirzmhv6gjxyv68crs3wvspibyjha";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
