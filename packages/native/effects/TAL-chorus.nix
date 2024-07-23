{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-Chorus";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/Tal-Chorus-LX_64_linux.zip";
    sha256 = "sha256-F2OWyDo/Q9PsCuCxSDwu97lICVJpnMmZ85OZP7p4ag4=";
  };

  nativeBuildInputs = [pkgs.unzip];

  installPhase = ''
    cp -r . $out
  '';

  sourceRoot = ".";
}
