{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "TAL-Mod";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Mod_64_linux.zip";
    sha256 = "1wmp6xi3s7g8l6rg6c2a556ghbgrb0wcalx157vvbx8vbayjrwsv";
  };
  
  passthru.demo = true;

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
