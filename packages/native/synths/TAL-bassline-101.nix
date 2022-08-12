{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "TAL-Bassline-101";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-BassLine-101_64_linux.zip";
    sha256 = "sha256-x2d+UFc2NoQvvP+RCFdGQBtge3sR2PB+NgtQS80AYFw=";
  };
  
  passthru = {
    demo = true;
    deprecated = false;
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
