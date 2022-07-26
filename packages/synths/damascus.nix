{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "Damascus";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/plugins/damascus/damascus_vst364_2021_05_30.zip";
    sha256 = "19xyyk0afxq01ns9wl4z5am1j8vvz02hl2cmi6gw953kfi3j6bp6";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
