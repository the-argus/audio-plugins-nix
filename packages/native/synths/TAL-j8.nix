{ pkgs, ... }:
pkgs.lib.trivial.warn ''TAL J8 is a paid product. You will only get the demo functionality.
Using the full version of TAL J8 installed via this flake is untested.''
pkgs.stdenv.mkDerivation {
  name = "TAL-J8";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-J-8_64_linux.zip";
    sha256 = "sha256-BQfDUAUe9Q44PYV8E0XXGYlVgD+4jW2aETgJjgD10lc=";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
