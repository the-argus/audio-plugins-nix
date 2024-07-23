{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "ambi-vac";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/ct/j/ambi_vst364_2022_06_11.zip";
    sha256 = "1n2w43ikj9l377iacwl7mxb9m00hhavwf8ykiymk76nmxhcxiqg5";
  };

  nativeBuildInputs = [pkgs.unzip];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -r ambiVAC/* $out
    cp -r manual $out
  '';
}
