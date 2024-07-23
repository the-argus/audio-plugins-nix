{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "Ambifx";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/ct/j/ambifx_vst364_2021_05_29.zip";
    sha256 = "02qx2cmv83ppq8ap0yk8fd8j2mk9yn8yn0da0137nvv1apjvn9nw";
  };

  nativeBuildInputs = [pkgs.unzip];

  installPhase = "cp -r . $out";
}
