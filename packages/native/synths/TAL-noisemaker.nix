{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-Noisemaker";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-NoiseMaker_64_linux.zip";
    sha256 = "14ja3h4404kfznryf9ncaxy8xmqznzi5xw0im49sz1gk5k6cv591";
  };

  nativeBuildInputs = [pkgs.unzip];

  installPhase = let
    # basically just a fetchzip of the download for the presets for this plugin
    vstPresets = pkgs.stdenv.mkDerivation {
      name = "TAL-Filter-2_Vst_Presets";
      src = pkgs.fetchurl {
        url = "https://tal-software.com//downloads/presets/TAL-NoiseMaker%20vst3.zip";
        sha256 = "09l6zif79i5warizidi1ikgns17pnnvg707absk71qbk42wac2d3";
        name = "TAL-Noisemaker_Vst_Presets_src.zip";
      };
      nativeBuildInputs = [pkgs.unzip];

      installPhase = "cp -r . $out";

      sourceRoot = ".";
    };
  in ''
    cp -r . $out
    cp -r ${vstPresets} $out/presets
  '';

  sourceRoot = ".";
}
