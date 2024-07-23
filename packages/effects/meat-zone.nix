{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "meat-zone";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/ct/e/meat_vst364_2021_05_30.zip";
    sha256 = "0a7l6p4azqd5na2pbx37b94hdwvapkzwvm58qy96vci9c2k0frq2";
  };

  nativeBuildInputs = [pkgs.unzip];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -r meatzone/* $out
    cp -r meat_manual $out
  '';
}
