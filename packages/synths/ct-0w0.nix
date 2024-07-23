{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "CT-0W0";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/ct/s/ct0w0_vst364_2022_06_10.zip";
    sha256 = "0misb99fzm6vf1avi59lrvh2czvh02sqi7q2hh244g6qf2a13xf6";
  };

  nativeBuildInputs = [pkgs.unzip];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -r CT-0W0/* $out
    cp -r manual $out
  '';
}
