{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "Fire-bin";
  src = pkgs.fetchurl {
    url = "https://github.com/jerryuhoo/Fire/releases/download/v1.0.0/Fire-Linux.zip";
    sha256 = "0hya8sp61p61pzqv5b7pgvf950d5ib0bxc1l718q9cvwl9hwzam8";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
