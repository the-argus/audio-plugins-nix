{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "TAL-Tube";
  src = pkgs.fetchurl {
    url = "https://tal-software.com//downloads/plugins/TAL-Tube.zip";
    sha256 = "0qldgqj9nay1vd7r2mifjay2mz0y459lvkj9w096zqwzr90kw978";
  };
  passthru.deprecated = true;

  sourceRoot = ".";

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
