# audio-plugins-nix
A nix flake providing a home-manager module for VST emulation with yabridge, and a set of packaged audio plugins.

# example usage
``flake.nix``:
```nix
{
  # add as an input
  inputs.audio-plugins.url = "github:the-argus/audio-plugins-nix";
  
  # add audio-plugins to flake inputs like so
  outputs = {self, nixpkgs, home-manager, audio-plugins, ... }@inputs:
  {
    # and finally add the module to home-manager imports, and mpkgs to extraSpecialArgs:
    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      configuration = {pkgs, ...}: {
        imports = [ audio-plugins.homeManagerModule ];
      };
      extraSpecialArgs = inputs // { mpkgs = audio-plugins.mpkgs; };
    };
  };
}
```
Home manager configuration:
```nix
{ pkgs, mpkgs, ...}:
{
  programs.yabridge = {
    enable = true;
    plugins = with mpkgs; [
      effects.ferric-tds
      synths.ct0w0
    ];

    nativePlugins = with mpkgs.native; [
      effects.fire-bin
      synths.dexed
    ];
    extraPath = "/home/user/.wine/drive_c/yabridge";
  };
}
```
**extraPath is an additional, optionally out-of-store path, and will only take effect if you run** ``yabridgectl sync`` **after building your HM configuration. It is intended to point to a folder in your users wine prefix where you install plugins that cannot be packaged with nix. Another example might be /home/user/.wine/drive_c/Program Files/Steinberg.**

# Bringing emulated VSTs into your DAW:
Add the path previously specified in ``extraPath`` to your DAWs VST plugin search path, as well as ~/.vst, or the directory you specified with programs.yabridge.vstDirectory.
