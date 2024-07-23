{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "virtua-dub";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/ct/s/virtuad_vst364_2022_09_06.zip";
    sha256 = "0mw5xi2zm999ckjnbjc632zcx02fw06qbfzamyhmh44rg6jpmam5";
  };

  nativeBuildInputs = [pkgs.unzip];

  installPhase = "cp -r . $out";
}
