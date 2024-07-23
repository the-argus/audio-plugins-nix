{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "real-animal";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/ct/s/real_vst364_2021_05_30.zip";
    sha256 = "11jm534q48kgjwiqahfxnp66x1ad4n5s86ag0df0mwn78kryb6d6";
  };

  nativeBuildInputs = [pkgs.unzip];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out
    cp -r realanimal/* $out
    cp -r real_manual $out
  '';
}
