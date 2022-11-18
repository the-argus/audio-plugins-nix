{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-Drum";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Drum_64_linux.zip";
    sha256 = "sha256-KxMHeGpwnhyGk0PigxeLH+5G51HkyghPqw+Wd0FiuL4=";
  };

  passthru.demo = true;

  nativeBuildInputs = [pkgs.unzip];

  installPhase = ''
    cp -r . $out
  '';

  sourceRoot = ".";
}
