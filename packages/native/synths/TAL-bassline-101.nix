{ pkgs, ... }:
pkgs.lib.trivial.warn ''TAL Bassline 101 is a paid product. You will only get the demo functionality.
Using the full version of TAL Bassline 101 installed via this flake is untested.''
pkgs.stdenv.mkDerivation {
  name = "TAL-Bassline-101";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-BassLine-101_64_linux.zip";
    sha256 = "sha256-x2d+UFc2NoQvvP+RCFdGQBtge3sR2PB+NgtQS80AYFw=";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
