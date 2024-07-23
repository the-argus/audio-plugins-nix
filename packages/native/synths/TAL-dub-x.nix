{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-Dub-X";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Dub-X_64_linux.zip";
    sha256 = "sha256-HkeSYuFS8ApVqUFZwuA2HUJgi1rQP7y0qeXldDpZ7tw=";
  };

  passthru.demo = true;

  nativeBuildInputs = [pkgs.unzip];

  installPhase = ''
    cp -r . $out
  '';

  sourceRoot = ".";
}
