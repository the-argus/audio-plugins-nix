{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-Bassline-101";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-BassLine-101_64_linux.zip";
    sha256 = "sha256-QLucUkKPNw3hkWS359pzstYLClzH+hrvS9a/uIoDWyI=";
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
