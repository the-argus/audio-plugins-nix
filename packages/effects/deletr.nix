{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "deletr";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/ct/e/del_vst364_2021_11_22.zip";
    sha256 = "1nfj7hhjvci3g4xf7ds5k20syvsl0sn9zyl0ialnkq5mykli93p8";
  };

  nativeBuildInputs = [pkgs.unzip];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -r deletr/* $out
    cp -r del_manual $out
  '';
}
