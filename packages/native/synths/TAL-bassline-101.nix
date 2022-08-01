{ pkgs, ... }:
pkgs.lib.trivial.warn ''TAL Bassline 101 is a paid product. You will only get the demo functionality.
Using the full version of TAL Bassline 101 installed via this flake is untested.''
pkgs.stdenv.mkDerivation {
  name = "TAL-Bassline-101";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-BassLine-101_64_linux.zip";
    sha256 = "0h7lzj0wpri0scwx1b8l3020rmnafhrdv79h1rsw05ykzyrj8x33";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
