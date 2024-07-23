{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "Ambifx";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/ct/j/ambifx_vst364_2021_05_29.zip";
    sha256 = "1xjm4rpqxq31aq8q95kjn4hr50s8j0v8r5blg56imnjpi2rq4r3s";
  };

  nativeBuildInputs = [pkgs.unzip];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -r ambiFX/* $out
    cp -r ambifx_manual $out
  '';

}
