{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-DAC";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-DAC_64_linux.zip";
    sha256 = "0cv1cr21s45w6frrpxdiih5bcpy7x9zcnr0np6hns9qbwhaawx28";
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
