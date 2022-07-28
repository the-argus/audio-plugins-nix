{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "TAL-Vocoder";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Vocoder-2_64_linux.zip";
    sha256 = "18laha2dy10iw0s751qb9xqv7lz1m0aylys603c0hhzrr267xxxc";
  };

  nativeBuildInputs = [ pkgs.unzip ];

  installPhase =
    let
      # basically just a fetchzip of the download for the presets for this plugin
      vstPresets = pkgs.stdenv.mkDerivation {
        name = "TAL-Vocoder_Vst_Presets";
        src = pkgs.fetchurl {
          url = "https://tal-software.com//downloads/presets/TAL-Vocoder-2%20vst3.zip";
          sha256 = "12ipnx1avmymbaiykn2x3bwl17alys2pr5d4xynppmffixldbvjv";
          name = "TAL-Vocoder_Vst_Presets_src.zip";
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
