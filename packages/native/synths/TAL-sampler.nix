{ pkgs, ... }:
pkgs.lib.trivial.warn ''
TAL Sampler is a paid product. You will only get the demo functionality.
Using the full version of TAL Bassline 101 installed via this flake is untested.
''
pkgs.stdenv.mkDerivation {
  name = "TAL-Sampler";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Sampler_64_linux.zip";
    sha256 = "01xqpjbqnkhk4sjxbrll4zffywgvxpi534779bd49ry2wwqcwyal";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
