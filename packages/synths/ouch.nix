{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "CT-0W0";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/plugins/ouch/ouch_vst364_2021_05_30.zip";
    sha256 = "1vzqc77775fdwjl2a8zrl7wfbcna1aa3aafbgf32nfgnnjr67wyx";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
