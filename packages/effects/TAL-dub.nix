{ pkgs, ... }:
builtins.trace ''WARNING: TAL Dub is deprecated software and recieves no updates or support.''
pkgs.stdenv.mkDerivation {
  name = "TAL-dub";
  src = pkgs.fetchurl {
    url = "https://tal-software.com//downloads/plugins/TAL-Dub-x64.zip";
    sha256 = "0ryl38x8n9z1g0n52wiza90syz41vl9wdrkgykgb1bzf6fc3zb7j";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
