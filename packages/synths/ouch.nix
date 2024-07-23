{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "ouch";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/ct/j/ouch_vst364_2021_05_30.zip";
    sha256 = "07cwrvjrsck9sdm0mbjqdmgy3v5hjbqszwqsv2bznkbl86cp83qy";
  };

  nativeBuildInputs = [pkgs.unzip];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -r ouch/* $out
    cp -r ouch_manual $out
  '';
}
