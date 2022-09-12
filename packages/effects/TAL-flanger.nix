{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-flanger";
  src = pkgs.fetchurl {
    url = "https://tal-software.com//downloads/plugins/TAL-Flanger-x64.zip";
    sha256 = "1mwips75mvrgafm6zf2sw9w3kw6wp51pwjpbj21gcjh8nkz7myd3";
  };

  passthru.deprecated = true;

  sourceRoot = ".";

  nativeBuildInputs = [pkgs.unzip];

  installPhase = "cp -r . $out";
}
