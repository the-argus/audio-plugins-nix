{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "GreatWall";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/plugins/gw/greatwall_vst364_20220610.zip";
    sha256 = "18qgbyq0d6aclnyldjhfklz54az4b6pmdwkp5xkh98rk6ri2pmr5";
  };

  nativeBuildInputs = [pkgs.unzip];

  installPhase = "cp -r . $out";
}
