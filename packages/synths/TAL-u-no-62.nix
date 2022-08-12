{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "TAL-U-NO-62";
  src = pkgs.fetchurl {
    url = "https://tal-software.com//downloads/plugins/TAL-U-No-62-x64.zip";
    sha256 = "09lqdxh8gya9kvs2b8w7h9lrrrajbmj3pzgc3xm8vb9g94ax7hvj";
  };
  
  passthru.deprecated = true;
  
  sourceRoot = ".";

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
