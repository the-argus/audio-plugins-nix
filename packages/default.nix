{ pkgs, ... }:
let
  # HECKSCAPER --------------------------------------------------------------
  ct0w0 = import ./synths/ct-0w0.nix { inherit pkgs; };
  ctws1 = import ./synths/ct-ws1.nix { inherit pkgs; };
  ambi-vac = import ./synths/ambi-vac.nix { inherit pkgs; };
  damascus = import ./synths/damascus.nix { inherit pkgs; };
  great-wall = import ./synths/great-wall.nix { inherit pkgs; };
  ill-logic = import ./synths/ill-logic.nix { inherit pkgs; };
  ktso = import ./synths/ktso.nix { inherit pkgs; };
  nuxx = import ./synths/nuxx.nix { inherit pkgs; };
  ouch = import ./synths/ouch.nix { inherit pkgs; };
  psykic = import ./synths/psykic.nix { inherit pkgs; };
  real-animal = import ./synths/real-animal.nix { inherit pkgs; };
  sota = import ./synths/sota.nix { inherit pkgs; };
  virtua-dub = import ./synths/virtua-dub.nix { inherit pkgs; };

  ambifx = import ./effects/ambifx.nix { inherit pkgs; };
  fuzz-buddies = import ./effects/fuzz-buddies.nix { inherit pkgs; };
  meat-zone = import ./effects/meat-zone.nix { inherit pkgs; };
  deletr = import ./effects/deletr.nix { inherit pkgs; };

  # TAL -----------------------------------------------------------------------
  tal-elek7ro-2 = import ./synths/TAL-elek7ro-2.nix { inherit pkgs; };

  # native TAL
  tal-noisemaker = import ./native/synths/TAL-noisemaker.nix { inherit pkgs; };

  tal-reverb-4 = import ./native/effects/TAL-reverb-4.nix { inherit pkgs; };
  tal-filter-2 = import ./native/effects/TAL-filter-2.nix { inherit pkgs; };
  tal-chorus = import ./native/effects/TAL-chorus.nix { inherit pkgs; };
  tal-vocoder = import ./native/effects/TAL-vocoder.nix { inherit pkgs; };

  # VARIETY OF SOUND ----------------------------------------------------------
  # found at https://varietyofsound.wordpress.com/downloads/
  ferric-tds = import ./effects/ferric-tds.nix { inherit pkgs; };
in
{
  synths = {
    # HECKSCAPER
    inherit ct0w0 ctws1 ambi-vac damascus great-wall ill-logic ktso nuxx ouch psykic real-animal sota virtua-dub;
    #TAL
    inherit tal-elek7ro-2;
  };

  effects = {
    # HECKSCAPER
    inherit ambifx fuzz-buddies meat-zone deletr;
    # VOS
    inherit ferric-tds;
  };

  native = {
    synths = {
      dexed = import ./native/synths/dexed.nix { inherit pkgs; };
      # TAL
      inherit tal-noisemaker;
    };
    effects = {
      inherit tal-reverb-4 tal-filter-2 tal-vocoder tal-chorus;
    };
  };

  # sets meant to be concatenated with your programs.yabridge.paths
  sets = {
    # all heckscaper plugins
    heckscaper = [ ct0w0 ctws1 ambi-vac damascus great-wall ill-logic ktso nuxx ouch psykic real-animal sota virtua-dub ambifx fuzz-buddies meat-zone deletr ];
  };
}
