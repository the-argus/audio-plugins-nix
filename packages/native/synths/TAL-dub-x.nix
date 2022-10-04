{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-Dub-X";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Dub-X_64_linux.zip";
    sha256 = "sha256-jT3GCZGWnJbmlrPRr0/pqDuMSNjyzkXmJGAPfPowpDE=";
  };

  passthru.demo = true;

  nativeBuildInputs = [pkgs.unzip];

  installPhase = ''
    cp -r . $out
  '';

  sourceRoot = ".";
}
