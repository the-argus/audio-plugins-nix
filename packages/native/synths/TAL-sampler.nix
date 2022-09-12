{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-Sampler";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Sampler_64_linux.zip";
    sha256 = "01xqpjbqnkhk4sjxbrll4zffywgvxpi534779bd49ry2wwqcwyal";
  };

  passthru.demo = true;

  nativeBuildInputs = [pkgs.unzip];

  installPhase = ''
    cp -r . $out
  '';

  sourceRoot = ".";
}
