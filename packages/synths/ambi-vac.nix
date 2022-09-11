{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "ambi-vac";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/plugins/ambi/ambiVAC_vst364_20220611.zip";
    sha256 = "1l4sf480szg0lm2hv8wvc78jhyk3a8cjvnwx3v2p1y3j03rly3r9";
  };

  nativeBuildInputs = [pkgs.unzip];

  installPhase = "cp -r . $out";
}
