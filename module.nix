{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.programs.yabridge;
in
{
  options.programs.yabridge = {
    enable = mkEnableOption "Yabridge VST Emulation";

    plugins = mkOption {
      type = types.listOf (types.oneOf [ types.package types.str ]);
      default = [ ];
      description = "Paths to folders (or packages) which contain .vst and .vst3 plugins.";
    };

    nativePlugins = mkOption {
      type = types.listOf (types.oneOf [ types.package types.str ]);
      default = [ ];
      description = "Paths to folders which contain plugins which will run natively on linux. They will be placed in the same folder as emulated VSTs.";
    };

    supressUnmaintainedWarning = mkEnableOption "Stop the red warning/trace \
      messages when evaluating unmaintained packages.";
    supressFreemiumWarning = mkEnableOption "Stop the red warning/trace \
      messages when evaluating packages which require a paid account to \
      unlock full features.";

    extraPath = mkOption {
      type = types.str;
      default = "";
      description = "An out-of-store path to append to yabridge configuration.\
        Must be added to your DAW's VST search path.";
    };

    vstDirectory = mkOption {
      type = types.str;
      default = ".vst";
      description = "Path relative to your home directory where vst plugins \
        will be installed.";
    };

    package = mkOption {
      type = types.package;
      default = pkgs.yabridge;
      description = "Nix package containing the yabridge binary.";
    };
    ctlPackage = mkOption {
      type = types.package;
      default = pkgs.yabridgectl;
      description = "Nix package containing the yabridgectl binary.";
    };
  };

  config =
    let
      # binary to use
      yabridgectl = "${cfg.ctlPackage}/bin/yabridgectl";

      # functions to create commands for a package
      toCpCommand = package: "cp -r ${package} $out";
      toYabridgeCommand = package:
        "${yabridgectl} add $out/${
        (builtins.baseNameOf (toString package))}";

      # list of strings (commands) created from packages
      cpCommands = map toCpCommand cfg.plugins;
      yabridgeCommands = map toYabridgeCommand cfg.plugins;

      # edit yabridge config to explicitly include extraPath
      escapedExtraPath = lib.strings.escape [ "/" ] cfg.extraPath;
      patch =
        if cfg.extraPath != "" then
          ''sed -i "3s/\]$/,'${escapedExtraPath}']/" $out/config/yabridgectl/config.toml''
        else "";

      # create script to setup directory and execute the copy commands and then
      # sync with the yabridge commands.
      scriptContents =
        ''
          mkdir $out

          # set all variables to have yabridge work in nix store
          export WINEPREFIX=$out/wine
          export XDG_CONFIG_HOME=$out/config
          export HOME=$out/home
          ${yabridgectl} set --path=${cfg.package}/lib

          # copy all vst plugin folders to out directory
          ${builtins.concatStringsSep "\n" cpCommands}

          # add all the copied plugin folders to yabridge
          ${builtins.concatStringsSep "\n" yabridgeCommands}

          ${yabridgectl} sync
          
          # adds extraPath
          ${patch}
        '';

      userYabridge = pkgs.runCommandLocal
        "yabridge-configuration"
        { }
        scriptContents;

      # create a derivation which will copy all the native plugins into its
      # working directory
      nativePluginCpCommands = ''
        mkdir $out
        ${
        builtins.concatStringsSep "\n" 
          (map toCpCommand cfg.nativePlugins)
        }
      '';

      nativePlugins = pkgs.runCommandLocal
        "native-plugins-combined"
        { }
        nativePluginCpCommands;
    in
    mkIf cfg.enable {
      home.packages = [ userYabridge cfg.package cfg.ctlPackage ];
      home.file = {
        "${cfg.vstDirectory}/yabridge" = {
          source = "${userYabridge}/home/.vst3/yabridge";
          recursive = true;
        };
        "${cfg.vstDirectory}/yabridge-vst2" = {
          source = "${userYabridge}/home/.vst/yabridge";
          recursive = true;
        };
        "${cfg.vstDirectory}/native" = {
          source = "${nativePlugins}";
        };

        ".config/yabridgectl" = {
          source = "${userYabridge}/config/yabridgectl";
          recursive = true;
        };
      };
    };
}
