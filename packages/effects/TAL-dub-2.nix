{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-dub-2";
  src = pkgs.fetchurl {
    url = "https://tal-software.com//downloads/plugins/TAL-Dub-2-x64.zip";
    sha256 = "1x21lgzaxakhn9zjpxi0j8z2djzwps9mzir0zigzrl59smys9szn";
  };

  passthru.deprecated = true;

  sourceRoot = ".";

  nativeBuildInputs = [pkgs.unzip];

  installPhase = "cp -r . $out";
}
