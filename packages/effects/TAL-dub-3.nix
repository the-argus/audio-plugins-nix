{ pkgs, ... }:
pkgs.lib.trivial.warn ''WARNING: TAL Dub 3 is deprecated software and recieves no updates or support.''
pkgs.stdenv.mkDerivation {
  name = "TAL-dub-3";
  src = pkgs.fetchurl {
    url = "https://tal-software.com//downloads/plugins/TAL-Dub-3-x64.zip";
    sha256 = "1wfkkpx3cm2qwdh74qz06sv8902259wgs7v04dc7jswqidsiqs8w";
  };

  sourceRoot = ".";
  
  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
