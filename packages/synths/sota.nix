{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "sota";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/ct/s/sota_vst364_2021_06_29.zip";
    sha256 = "1r4gw8r7g1h779pwg58j3fn6sg0c4ivs2yx1v30r296pg7v3wr7n";
  };

  nativeBuildInputs = [pkgs.unzip];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -r sota/* $out
    cp -r sota_manual $out
  '';
}
