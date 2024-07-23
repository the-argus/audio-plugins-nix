{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "Damascus";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/ct/j/dam_vst364_2021_05_30.zip";
    sha256 = "0d7l05zay51khn9nj3wv3w14ailkgyhcv9p36wzprwknygs480gh";
  };

  nativeBuildInputs = [pkgs.unzip];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -r damascus/* $out
    cp -r manual $out
  '';
}
