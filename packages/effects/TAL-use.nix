{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "TAL-USE";
  src = pkgs.fetchurl {
    url = "https://tal-software.com//downloads/plugins/TAL-USE.zip";
    sha256 = "1g7spid005nc4z2kz81v3xhjwqf5s1qx71b1vfwnc2b6wnqmi7rx";
  };
  
  passthru.deprecated = true;
  
  sourceRoot = ".";

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
