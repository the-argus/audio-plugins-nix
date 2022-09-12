{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "ferric-tds";
  src = pkgs.fetchurl {
    name = "ferric-tds.zip";
    url = "https://drive.google.com/uc?export=download&id=139uPVuPRQDXLd0qN99QpNKWZJVqlAj4n";
    sha256 = "sha256-3/Jv7uMigD/jyCgznWu/IyEmJ7cTB2RlU9CoJBwTGmA=";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
