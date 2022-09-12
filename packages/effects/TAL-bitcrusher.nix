{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-bitcrusher";
  src = pkgs.fetchurl {
    url = "https://tal-software.com//downloads/plugins/TAL-Bitcrusher-x64.zip";
    sha256 = "07ynksrnwwfbq8jvydmcj5mqr8cjvj9wsq0i4m3h974sm6hf6k6g";
  };

  passthru.deprecated = true;

  sourceRoot = ".";

  nativeBuildInputs = [pkgs.unzip];

  installPhase = "cp -r . $out";
}
