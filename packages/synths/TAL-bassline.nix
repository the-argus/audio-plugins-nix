{ pkgs, ... }:
builtins.trace ''WARNING: TAL Bassline is deprecated software and recieves no updates or support.''
pkgs.stdenv.mkDerivation {
  name = "TAL-bassline";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-BassLine-x64.zip";
    sha256 = "1pkxjjxb9d7wp8sz82781m7az1qkqmdnldizdcka9jzh6z86indc";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
