{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "CT-WS1";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/plugins/ws1/ctws1_vst364_20220610.zip";
    sha256 = "1s0y4vq7n00xclkrm9cahk948j3fvzjx0vdvd7r2xp435pd3yv6x";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
