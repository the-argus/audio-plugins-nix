{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "TAL-Filter-2";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Filter-2_64_linux.zip";
    sha256 = "18bzz3265gfk733psvwyhfdx3m3gyx7fq4217h3mhv5h2ngmdgxa";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    let
      # basically just a fetchzip of the download for the presets for this plugin
      vstPresets = pkgs.stdenv.mkDerivation {
        name = "TAL-Filter-2_Vst_Presets";
        src = pkgs.fetchurl {
          url = "https://tal-software.com//downloads/presets/TAL-Filter-2%20vst3.zip";
          sha256 = "0pxmcdgv7d7ppi22dc7irffr2bnx3k81bpgh0prg6vq1akwv9kjb";
          name = "TAL-Filter-2_Vst_Presets_src.zip";
        };
        nativeBuildInputs = [ pkgs.unzip ];

        installPhase = "cp -r . $out";

        sourceRoot = ".";
      };
    in
    ''
      cp -r . $out
      cp -r ${vstPresets} $out/presets
    '';

  sourceRoot = ".";
}
