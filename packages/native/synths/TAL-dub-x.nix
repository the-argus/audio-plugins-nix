{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "TAL-Dub-X";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Dub-X_64_linux.zip";
    sha256 = "1w35jgkdgx6wcn8awpl806c212wf192xpimhiy4j1fsyxi866h5j";
  };
  
  passthru.demo = true;

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
