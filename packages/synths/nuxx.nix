{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "CT-0W0";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/plugins/nuxx/nuxx_vst364_2021_05_30b.zip";
    sha256 = "1jglrsab35hy4yqpcbbrk4ydkm6awp9w7qnvalhryh281544zp3f";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
