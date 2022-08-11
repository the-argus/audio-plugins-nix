{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  pname = "Fire-bin";
  version = "0.9.9";
  src = pkgs.fetchurl {
    url = "https://github.com/jerryuhoo/Fire/releases/download/v0.9.9/Fire-Linux.zip";
    sha256 = "0sx1kx660kzj4kqcrxk0bw3swwv5lblv9kqk7hmpy39pbb8sfirj";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    ''
      cp -r . $out
    '';

  sourceRoot = ".";
}
