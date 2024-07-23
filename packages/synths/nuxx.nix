{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "nuxx";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/ct/s/nuxx_vst364_2021_05_30b.zip";
    sha256 = "0rm8z5va8xx8mgxfj9ncmqs44kvczjwlhkq9g7zblcg1lp65grhn";
  };

  nativeBuildInputs = [pkgs.unzip];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -r nuxx/* $out
    cp -r nuxx_manual $out
  '';
}
