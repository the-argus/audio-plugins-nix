{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "psykic";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/ct/s/psy_vst364_2021_05_29.zip";
    sha256 = "1648dmnh8h6piccl4k0j0hfjnc4x3ilw2pc19s5y89mvl1w978hh";
  };

  nativeBuildInputs = [pkgs.unzip];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -r psykic/* $out
    cp -r psy_manual $out
  '';
}
