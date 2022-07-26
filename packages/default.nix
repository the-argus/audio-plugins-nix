{ pkgs, ... }:
{
  synths = {
    ct0w0 = import ./synths/ct-0w0.nix { inherit pkgs; };
    ctws1 = import ./synths/ct-ws1.nix { inherit pkgs; };
  };

  effects = {
  };

  native = {
    synths = {
      dexed = import ./native/synths/dexed.nix { inherit pkgs; };
    };
  };
}
