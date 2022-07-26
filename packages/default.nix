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

  ambifx = import ./synths/ambifx.nix { inherit pkgs; };
  fuzz-buddies = import ./synths/fuzz-buddies.nix { inherit pkgs; };
  meat-zone = import ./synths/meat-zone.nix { inherit pkgs; };
in
{
  synths = {
    # HECKSCAPER
    inherit ct0w0 ctws1 ambi-vac damascus great-wall ill-logic ktso nuxx ouch psykic real-animal sota virtua-dub;
  };

  effects = {
    # HECKSCAPER
    inherit ambifx fuzz-buddies meat-zone;
  };

  native = {
    synths = {
      dexed = import ./native/synths/dexed.nix { inherit pkgs; };
    };
  };

  # sets meant to be concatenated with your programs.yabridge.paths
  sets = {
    # all heckscaper plugins
    heckscaper = [ ct0w0 ctws1 ambi-vac damascus great-wall ill-logic ktso nuxx ouch psykic real-animal sota virtua-dub ambifx fuzz-buddies meat-zone ];
  };
}
