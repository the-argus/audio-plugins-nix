{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "psykic";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/plugins/psy/psykic_vst364_2021_05_29.zip";
    sha256 = "0mkmq3yhfipir52x1bbhs895hsihawyaxps3cj9wsmpzagy2dwz3";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
