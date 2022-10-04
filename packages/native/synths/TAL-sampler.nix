{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-Sampler";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Sampler_64_linux.zip";
    sha256 = "sha256-OSj/8mldOLKJRNRNpH5y1tUoqVcHGIQtFcTX6lsktV0=";
  };

  passthru.demo = true;

  nativeBuildInputs = [pkgs.unzip];

  installPhase = ''
    cp -r . $out
  '';

  sourceRoot = ".";
}
