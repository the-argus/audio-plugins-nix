{ pkgs, ... }:
pkgs.lib.trivial.warn ''TAL U-No-LX is a paid product. You will only get the demo functionality.
Using the full version of TAL U-No-LX installed via this flake is untested.''
pkgs.stdenv.mkDerivation {
  name = "TAL-u-no-lx";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-U-NO-LX-V2_64_linux.zip";
    sha256 = "0ppa22z6glaqhvq4zn798f1l73hx2d464jcgm3crk9jfm7afzmj0";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
