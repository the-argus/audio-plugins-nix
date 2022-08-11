{ pkgs, ... }:
pkgs.lib.trivial.warn ''TAL U-No-LX is a paid product. You will only get the demo functionality.
Using the full version of TAL U-No-LX installed via this flake is untested.''
pkgs.stdenv.mkDerivation {
  name = "TAL-u-no-lx";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-U-NO-LX-V2_64_linux.zip";
    sha256 = "sha256-FR8d9lGxrf2fmvOSEVsI8t+IzFpWZmbhWP1cTlC5r8U=";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
