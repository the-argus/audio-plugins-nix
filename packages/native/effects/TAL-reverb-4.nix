{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "TAL-Reverb-4";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Reverb-4_64_linux.zip";
    sha256 = "02hgr7i9xghjw5zwh9496hrxdsngwhm0c71qn2raiqdm861iqhr5";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
