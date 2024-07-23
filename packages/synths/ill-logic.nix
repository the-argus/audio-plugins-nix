{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "ill-logic";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/ct/s/ill_vst364_2021_05_30b.zip";
    sha256 = "1hkgl440rbrg5q6ljpzrk63qnl6zzyvyp29zpijnhn2mimfw197r";
  };

  nativeBuildInputs = [pkgs.unzip];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -r illlogicmaths/* $out
    cp -r manual $out
  '';
}
