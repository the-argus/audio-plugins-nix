{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "TAL-Drum";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Drum_64_linux.zip";
    sha256 = "1i54ch5fgarvmdwxpnam8sbncq355hhxllyaad0cjqqhp1m50fya";
  };

  passthru.demo = true;

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
