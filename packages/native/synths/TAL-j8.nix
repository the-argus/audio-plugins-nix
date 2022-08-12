{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "TAL-J8";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-J-8_64_linux.zip";
    sha256 = "sha256-BQfDUAUe9Q44PYV8E0XXGYlVgD+4jW2aETgJjgD10lc=";
  };
  
  passthru.demo = true;

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
