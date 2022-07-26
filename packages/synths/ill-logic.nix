{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "CT-0W0";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/plugins/ill/illlogicmaths_vst364_2021_05_30b.zip";
    sha256 = "0mcihcrg98ngkb75v5c8vaqkpqkm57qw5wwbs8nwbfpsx8s7mv8a";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
