{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "CT-0W0";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/plugins/dub/virtuadub_vst364_20220615.zip";
    sha256 = "1ndqr4pd5shfa453j5nwj66i6h4v9b22pk6n0s8jfwfwv05kqz41";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
