{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-Mod";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Mod_64_linux.zip";
    sha256 = "sha256-sq0A0Hme8v759Q/4GTMt/dQ5z5fIiYuKYjRz54aRDic=";
  };

  passthru.demo = true;

  nativeBuildInputs = [pkgs.unzip];

  installPhase = ''
    cp -r . $out
  '';

  sourceRoot = ".";
}
