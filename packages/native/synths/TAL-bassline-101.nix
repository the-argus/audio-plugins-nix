{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "TAL-Bassline-101";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-BassLine-101_64_linux.zip";
    sha256 = "sha256-64YYfT7cz4rkS9ZvGvJpVcFf8PeG/UK3ES0WO7xgYYo=";
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
