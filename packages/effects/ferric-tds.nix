{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "ferric-tds";
  src = pkgs.fetchurl {
    name = "ferric-tds.zip";
    url = "https://drive.google.com/uc?export=download&id=139uPVuPRQDXLd0qN99QpNKWZJVqlAj4n";
    sha256 = "sha256-v2AwUlt96Vdx81ExDxZZ7lfzpdTpgbKIT/H0rJPxDqA=";
  };

  nativeBuildInputs = [pkgs.unzip];

  installPhase = "cp -r . $out";
}
