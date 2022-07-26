{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "ferric-tds";
  src = pkgs.fetchurl {
    name = "ferric-tds-src";
    url = "https://drive.google.com/uc?export=download&id=139uPVuPRQDXLd0qN99QpNKWZJVqlAj4n";
    sha256 = "0mrfd7lm9wz4p2rq13m8d2279fdx5s9ai182flfy01ynmbm1w28w";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
