{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-Sampler";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Sampler_64_linux.zip";
    sha256 = "sha256-mPWQuX+nuSIPWUAw/3lyBFFwpK+78LgS30hzgYS8/x4=";
  };

  passthru.demo = true;

  nativeBuildInputs = [pkgs.unzip];

  installPhase = ''
    cp -r . $out
  '';

  sourceRoot = ".";
}
