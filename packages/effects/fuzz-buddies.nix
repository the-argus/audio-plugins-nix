{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "fuzz-buddies";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/plugins/fb/fuzzbuddies_vst364_2021_11_26.zip";
    sha256 = "12mbhhfb2mnzx163n1zms8zgsw1idn6shid9gbspsyz67phjqhnw";
  };

  nativeBuildInputs = [pkgs.unzip];

  installPhase = "cp -r . $out";
}
