{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "GreatWall";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/ct/s/great_vst364_2022_06_10.zip";
    sha256 = "11drsfcv8cb8i9acc9wa5zgsf9vakgz76gpnvhailx1vrfs566d2";
  };

  nativeBuildInputs = [pkgs.unzip];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -r greatwall/* $out
    cp -r manual.png $out
  '';
}
