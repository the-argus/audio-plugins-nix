{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "fuzz-buddies";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/ct/j/fuzz_vst364_2021_11_26.zip";
    sha256 = "0q3n3g74xyk76im39ap63k0vmif4786jm9lszni1ybp08lipyx09";
  };

  nativeBuildInputs = [pkgs.unzip];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -r fuzzbuddies/* $out
    cp -r fuzz_manual $out
  '';
}
