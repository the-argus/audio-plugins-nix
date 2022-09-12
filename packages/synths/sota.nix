{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "sota";
  src = pkgs.fetchurl {
    url = "https://heckscaper.com/plugins/sota/sota_vst364_2021_06_29.zip";
    sha256 = "094r3c0kixrfxn7f4vqgah814qa5c8y66y1n7vlwwk58yl3r6aid";
  };

  nativeBuildInputs = [pkgs.unzip];

  installPhase = "cp -r . $out";
}
