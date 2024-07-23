{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-u-no-lx";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-U-NO-LX-V2_64_linux.zip";
    sha256 = "sha256-iM5j4sXec8QvnDitXefkA8rOazp8FQftegsuFFpqaxs=";
  };

  passthru.demo = true;

  nativeBuildInputs = [pkgs.unzip];

  installPhase = ''
    cp -r . $out
  '';

  sourceRoot = ".";
}
