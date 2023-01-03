{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "ferric-tds";
  src = pkgs.fetchurl {
    name = "ferric-tds.zip";
    url = "https://drive.google.com/uc?export=download&id=139uPVuPRQDXLd0qN99QpNKWZJVqlAj4n";
    sha256 = "sha256-PCDp5SQs5IPp3lYBPL5bZYHsIA/hGZjbvEfTMog0Erg=";
  };

  nativeBuildInputs = [pkgs.unzip];

  installPhase = "cp -r . $out";
}
