{ pkgs, ... }:
pkgs.lib.trivial.warn ''WARNING: TAL Elek7ro is deprecated software and recieves no updates or support.''
pkgs.stdenv.mkDerivation {
  name = "TAL-elek7ro";
  src = pkgs.fetchurl {
    url = "https://tal-software.com//downloads/plugins/TAL-Elek7ro-II-x64.zip";
    sha256 = "0w46gnilxn9nc4c6yf1cs3iilf8nad2vkyz092b8azs73ghfysvk";
  };
  
  sourceRoot = ".";

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
