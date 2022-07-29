{ pkgs, ... }:
pkgs.lib.trivial.warn ''
TAL J8 is a paid product. You will only get the demo functionality.
Using the full version of TAL J8 installed via this flake is untested.
''
pkgs.stdenv.mkDerivation {
  name = "TAL-J8";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-J-8_64_linux.zip";
    sha256 = "1xyliqsady3qfvplnjfzqmnh33n4whdiqq8jm7vv2isqv09rm5vm";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
