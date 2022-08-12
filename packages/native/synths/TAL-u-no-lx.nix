{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "TAL-u-no-lx";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-U-NO-LX-V2_64_linux.zip";
    sha256 = "sha256-FR8d9lGxrf2fmvOSEVsI8t+IzFpWZmbhWP1cTlC5r8U=";
  };
  
  passthru.demo = true;

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
