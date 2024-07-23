{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-Noisemaker";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-NoiseMaker_64_linux.zip";
    sha256 = "sha256-MoVl5kb5jxTdkxoz+kOKTJ7dxFHnWbktEAX0M2+j/SA=";
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
