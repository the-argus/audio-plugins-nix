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
  tal-bassline-101 = import ./native/synths/TAL-bassline-101.nix { inherit pkgs; };
  tal-drum = import ./native/synths/TAL-drum.nix { inherit pkgs; };
  tal-j8 = import ./native/synths/TAL-j8.nix { inherit pkgs; };
  tal-sampler = import ./native/synths/TAL-sampler.nix { inherit pkgs; };
  tal-unolx = import ./native/synths/TAL-u-no-lx.nix { inherit pkgs; };
  tal-mod = import ./native/synths/TAL-mod.nix { inherit pkgs; };
  tal-dub-x = import ./native/synths/TAL-dub-x.nix { inherit pkgs; };
  tal-dac = import ./native/synths/TAL-DAC.nix { inherit pkgs; };

  tal-reverb-4 = import ./native/effects/TAL-reverb-4.nix { inherit pkgs; };
  tal-filter-2 = import ./native/effects/TAL-filter-2.nix { inherit pkgs; };
  tal-chorus = import ./native/effects/TAL-chorus.nix { inherit pkgs; };
  tal-vocoder = import ./native/effects/TAL-vocoder.nix { inherit pkgs; };

  # VARIETY OF SOUND ----------------------------------------------------------
  # found at https://varietyofsound.wordpress.com/downloads/
  ferric-tds = import ./effects/ferric-tds.nix { inherit pkgs; };

  # jerryuhoo
  fire-bin = import ./native/effects/fire-bin.nix { inherit pkgs; };
  fire = import ./native/effects/fire { inherit pkgs; };

  # asb2m10
  dexed = import ./native/synths/dexed.nix { inherit pkgs; };
  dexed-bin = import ./native/synths/dexed-bin.nix { inherit pkgs; };
in
{
  synths = {
    # HECKSCAPER
    inherit ct0w0 ctws1 ambi-vac damascus great-wall ill-logic ktso nuxx ouch
      psykic real-animal sota virtua-dub;
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
    # jerryuhoo
    inherit fire fire-bin;
  };

  native = {
    synths = {
      inherit dexed dexed-bin;
      # TAL
      inherit tal-noisemaker tal-bassline-101 tal-drum tal-j8 tal-sampler
        tal-unolx tal-mod tal-dac tal-dub-x;
    };
    effects = {
      # TAL
      inherit tal-reverb-4 tal-filter-2 tal-vocoder tal-chorus;

      # jerryuhoo 
      inherit fire fire-bin;
    };
  };

  # sets meant to be concatenated with your programs.yabridge.paths
  sets = {
    native = {
      TAL = [
        tal-reverb-4
        tal-filter-2
        tal-vocoder
        tal-chorus
        tal-noisemaker
        tal-dac
        tal-dub-x
        tal-mod
        tal-unolx
        tal-sampler
        tal-j8
        tal-drum
        tal-bassline-101
      ];
    };

    TAL = [
      tal-dub
      tal-dub-2
      tal-dub-3
      tal-bitcrusher
      tal-tube
      tal-use
      tal-uno62
      tal-elek7ro-2
      tal-bassline
    ];
    # all heckscaper plugins
    heckscaper = [
      ct0w0
      ctws1
      ambi-vac
      damascus
      great-wall
      ill-logic
      ktso
      nuxx
      ouch
      psykic
      real-animal
      sota
      virtua-dub
      ambifx
      fuzz-buddies
      meat-zone
      deletr
    ];
  };


  lib = import ../lib { inherit pkgs; };
}
