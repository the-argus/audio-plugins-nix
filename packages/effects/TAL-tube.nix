{ pkgs, ... }:
pkgs.lib.trivial.warn ''WARNING: TAL Tube is deprecated, 32bit software and recieves no updates or support.''
pkgs.stdenv.mkDerivation {
  name = "TAL-Tube";
  src = pkgs.fetchurl {
    url = "https://tal-software.com//downloads/plugins/TAL-Tube.zip";
    sha256 = "0qldgqj9nay1vd7r2mifjay2mz0y459lvkj9w096zqwzr90kw978";
  };

  sourceRoot = ".";

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
