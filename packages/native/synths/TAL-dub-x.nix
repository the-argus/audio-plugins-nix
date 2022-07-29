{ pkgs, ... }:
pkgs.lib.trivial.warn ''
TAL Dub X is a paid product. You will only get the demo functionality.
Using the full version of TAL Dub X installed via this flake is untested.
''
pkgs.stdenv.mkDerivation {
  name = "TAL-Dub-X";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Dub-X_64_linux.zip";
    sha256 = "1w35jgkdgx6wcn8awpl806c212wf192xpimhiy4j1fsyxi866h5j";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
