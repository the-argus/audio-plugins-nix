{ pkgs, ... }:
pkgs.lib.trivial.warn ''WARNING: TAL Bitcrusher is deprecated software and recieves no updates or support.''
pkgs.stdenv.mkDerivation {
  name = "TAL-bitcrusher";
  src = pkgs.fetchurl {
    url = "https://tal-software.com//downloads/plugins/TAL-Bitcrusher-x64.zip";
    sha256 = "07ynksrnwwfbq8jvydmcj5mqr8cjvj9wsq0i4m3h974sm6hf6k6g";
  };
  
  sourceRoot = ".";

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
