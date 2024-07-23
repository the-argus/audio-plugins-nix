{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-Sampler";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Sampler_64_linux.zip";
    sha256 = "sha256-+IT5sOQv4OE9iF0KEK+ptZ8kM6m1QcnJePVxG24GlBg=";
  };

  passthru.demo = true;

  nativeBuildInputs = [pkgs.unzip];

  installPhase = ''
    cp -r . $out
  '';

  sourceRoot = ".";
}
