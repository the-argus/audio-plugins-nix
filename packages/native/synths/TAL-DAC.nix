{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-DAC";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-DAC_64_linux.zip";
    sha256 = "sha256-/7JDVxEfOQRqiCGPkejmPkbtnk3HqS/QgTskKz7Zfpc=";
  };

  nativeBuildInputs = [pkgs.unzip];

  passthru = {
    demo = true;
    deprecated = false;
  };

  installPhase = ''
    cp -r . $out
  '';

  sourceRoot = ".";
}
