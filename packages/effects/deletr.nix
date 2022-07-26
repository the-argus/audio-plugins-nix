{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "deletr";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/plugins/del/deletr_vst364_2021_11_22.zip";
    sha256 = "1gd5xh4dqlr8qr1wbxb9765nrra16zfgz39h0m28q12ndv5q3lxh";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
