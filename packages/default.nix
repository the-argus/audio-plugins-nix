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
  tal-bassline = import ./synths/TAL-bassline.nix { inherit pkgs; };
  tal-uno62 = import ./synths/TAL-u-no-62.nix { inherit pkgs; };

  tal-dub = import ./effects/TAL-dub.nix { inherit pkgs; };
  tal-dub-2 = import ./effects/TAL-dub-2.nix { inherit pkgs; };
  tal-dub-3 = import ./effects/TAL-dub-3.nix { inherit pkgs; };
  tal-bitcrusher = import ./effects/TAL-bitcrusher.nix { inherit pkgs; };
  tal-use = import ./effects/TAL-use.nix { inherit pkgs; };
  tal-tube = import ./effects/TAL-tube.nix { inherit pkgs; };

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
    inherit tal-elek7ro-2 tal-bassline tal-uno62;
  };

  effects = {
    # HECKSCAPER
    inherit ambifx fuzz-buddies meat-zone deletr;
    # VOS
    inherit ferric-tds;
    # TAL
    inherit tal-dub tal-dub-2 tal-dub-3 tal-bitcrusher tal-tube tal-use;
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
    native = {
        TAL = [ tal-reverb-4 tal-filter-2 tal-vocoder tal-chorus tal-noisemaker ];
    };

    TAL = [ tal-dub tal-dub-2 tal-dub-3 tal-bitcrusher tal-tube tal-use tal-uno62 tal-elek7ro-2 tal-bassline ];
    # all heckscaper plugins
    heckscaper = [ ct0w0 ctws1 ambi-vac damascus great-wall ill-logic ktso nuxx ouch psykic real-animal sota virtua-dub ambifx fuzz-buddies meat-zone deletr ];
  };
}
