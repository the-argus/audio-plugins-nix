{ pkgs, ... }:
pkgs.lib.trivial.warn ''
TAL Drum is a paid product. You will only get the demo functionality.
Using the full version of TAL Drum installed via this flake is untested.
''
pkgs.stdenv.mkDerivation {
  name = "TAL-Drum";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Drum_64_linux.zip";
    sha256 = "1i54ch5fgarvmdwxpnam8sbncq355hhxllyaad0cjqqhp1m50fya";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
