{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "ktso";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/ct/s/ktso_vst364_2021_07_06.zip";
    sha256 = "056bkb94kr0apm1cj5az7wc0p2x6mx7yi477yrz9m8yvw0xwkrsr";
  };

  nativeBuildInputs = [pkgs.unzip];

  installPhase = "cp -r . $out";
}
