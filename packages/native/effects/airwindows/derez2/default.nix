{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "DeRez2";
  src = pkgs.fetchurl {
    url = "https://www.airwindows.com/wp-content/uploads/2019/06/DeRez2.zip";
    sha256 = "0hr565yxyd9wamw9llldxl6s244c7qfyh69kmrrv1q4xbb55b52h";
  };

  nativeBuildInputs = [pkgs.unzip];

  installPhase = ''
    mkdir -p $out
    cp -r DeRez2* $out
  '';

  sourceRoot = ".";
}

