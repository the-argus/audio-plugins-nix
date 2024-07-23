{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-Bassline-101";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-BassLine-101_64_linux.zip";
    sha256 = "sha256-GkrI+tzqzhA6lg1V+9F99yzHUsJWq0V7tVmLS5LHoGM=";
  };

  passthru = {
    demo = true;
    deprecated = false;
  };

  nativeBuildInputs = [pkgs.unzip];

  installPhase = ''
    cp -r . $out
  '';

  sourceRoot = ".";
}
