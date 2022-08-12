{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "TDR-Nova";
  src = pkgs.fetchurl {
    url = "https://www.tokyodawn.net/labs/Nova/2.1.5/TDR%20Nova%20(no%20installer).zip?x24775";
    name = "TDR-Nova.zip";
    sha256 = "11sd79f202r66nlr2s1ym4ln3iyz7c0189i5qvlrzh1lpsj2ma2c";
  };
  
  sourceRoot = ".";

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
