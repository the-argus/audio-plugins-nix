{ pkgs, ... }:
pkgs.lib.trivial.warn ''TAL Dub 2 is deprecated software and recieves no updates or support.''
pkgs.stdenv.mkDerivation {
  name = "TAL-dub-2";
  src = pkgs.fetchurl {
    url = "https://tal-software.com//downloads/plugins/TAL-Dub-2-x64.zip";
    sha256 = "1x21lgzaxakhn9zjpxi0j8z2djzwps9mzir0zigzrl59smys9szn";
  };
  
  sourceRoot = ".";

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
