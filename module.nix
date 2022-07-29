{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.programs.yabridge;
in
{
  options.programs.yabridge = {
    enable = mkEnableOption "Yabridge VST Emulation";

    paths = mkOption {
      type = types.listOf types.str;
      default = [ ];
      description = "Paths to folders which contain .vst and .vst3 plugins.";
    };

    nativePaths = mkOption {
      type = types.listOf types.str;
      default = [ ];
      description = "Paths to folders which contain plugins which will run natively on linux. They will be placed in the same folder as emulated VSTs.";
    };

    extraPath = mkOption {
      type = types.str;
      default = "";
      description = "An out-of-store path to append to yabridge configuration. Must be added to your DAW's VST search path.";
    };

    vstDirectory = mkOption {
        type = types.str;
        default = ".vst";
        description = "Path relative to your home directory where vst plugins will be installed.";
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
      yabridge = cfg.package;
      yabridgectl = cfg.ctlPackage;
      toCpCommand = path: "cp -r ${path} $out";
      toYabridgeCommand = path: "${cfg.ctlPackage}/bin/yabridgectl add $out/${(builtins.baseNameOf path)}";
      cpCommands = map toCpCommand cfg.paths;
      yabridgeCommands = map toYabridgeCommand cfg.paths;

      # edit yabridge config to explicitly include extraPath
      escapedExtraPath = lib.strings.escape [ "/" ] cfg.extraPath;
      patch =
        if cfg.extraPath != "" then
          ''sed -i "3s/\]$/,'${escapedExtraPath}']/" $out/config/yabridgectl/config.toml''
        else "";

      scriptContents =
        ''
          mkdir $out
          export WINEPREFIX=$out/wine
          export XDG_CONFIG_HOME=$out/config
          export HOME=$out/home
          ${cfg.ctlPackage}/bin/yabridgectl set --path=${cfg.package}/lib
          # copy all vst plugin folders to out directory
          ${builtins.concatStringsSep "\n" cpCommands}
          ${builtins.concatStringsSep "\n" yabridgeCommands}
          # add this folder and sync it
          ${cfg.ctlPackage}/bin/yabridgectl sync

          ${patch}
        '';
      
      # create a script which will copy all the native plugins into its working directory
      copyCommands = ''
        mkdir $out
        ${builtins.concatStringsSep "\n" (map toCpCommand cfg.nativePaths)}
      '';

      nativePlugins = pkgs.runCommandLocal "native-plugins-combined" { } copyCommands;
      
      # tracer = builtins.trace scriptContents scriptContents;
      # userYabridge = pkgs.runCommandLocal "yabridge-configuration" { } tracer;
      userYabridge = pkgs.runCommandLocal "yabridge-configuration" { } scriptContents;
    in
    mkIf cfg.enable {
      home.packages = [ userYabridge yabridge yabridgectl ];
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
