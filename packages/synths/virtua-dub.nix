{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "virtua-dub";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/plugins/dub/virtuadub_vst364_20220906.zip";
    sha256 = "0mw5xi2zm999ckjnbjc632zcx02fw06qbfzamyhmh44rg6jpmam5";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
