{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "CT-0W0";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/plugins/real/realanimal_vst364_2021_06_01.zip";
    sha256 = "1l09sdldi5ha3wp4x0pqfag6df0jr231x55m7ird3qm8313pr8gb";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
