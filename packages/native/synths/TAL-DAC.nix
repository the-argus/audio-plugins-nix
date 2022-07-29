{ pkgs, ... }:
pkgs.lib.trivial.warn ''
TAL DAC is a paid product. You will only get the demo functionality.
Using the full version of TAL DAC installed via this flake is untested.
''
pkgs.stdenv.mkDerivation {
  name = "TAL-DAC";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-DAC_64_linux.zip";
    sha256 = "0cv1cr21s45w6frrpxdiih5bcpy7x9zcnr0np6hns9qbwhaawx28";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
