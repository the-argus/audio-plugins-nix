{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-Drum";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Drum_64_linux.zip";
    sha256 = "sha256-dpJCH4Ok0vTq0VgZA0bGuwMQb1SVvsNIhM9BqksgFgo=";
  };

  passthru.demo = true;

  nativeBuildInputs = [pkgs.unzip];

  installPhase = ''
    cp -r . $out
  '';

  sourceRoot = ".";
}
