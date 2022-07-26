{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "meat-zone";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/plugins/meat/meatzone_vst364_2022_02_10.zip";
    sha256 = "00s98yps8sxgpnkmp0ijz5qlrqcf4z2igfmg1di9vmiw2j5k4dz1";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase = "cp -r . $out";
}
