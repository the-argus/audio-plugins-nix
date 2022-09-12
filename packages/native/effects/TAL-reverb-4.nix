{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "TAL-Reverb-4";
  src = pkgs.fetchurl {
    url = "https://tal-software.com/downloads/plugins/TAL-Reverb-4_64_linux.zip";
    sha256 = "02hgr7i9xghjw5zwh9496hrxdsngwhm0c71qn2raiqdm861iqhr5";
  };

  nativeBuildInputs = [pkgs.unzip];

  installPhase = let
    # basically just a fetchzip of the download for the presets for this plugin
    vstPresets = pkgs.stdenv.mkDerivation {
      name = "TAL-Reverb-4_Vst_Presets";
      src = pkgs.fetchurl {
        url = "https://tal-software.com//downloads/presets/TAL-Reverb-4%20vst3.zip";
        sha256 = "1x7d73hc5hbbs7z541ra4yvpfp7066ilscgw1jwb6d08xpzcbi6z";
        name = "TAL-Reverb-4_Vst_Presets_src.zip";
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
