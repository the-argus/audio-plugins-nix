{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.programs.yabridge;
in {
  options.programs.yabridge = {
    enable = mkEnableOption "Yabridge VST Emulation";

    plugins = mkOption {
      type = types.listOf types.package;
      default = [];
      description = "Paths to folders (or packages) which contain .vst and \
        .vst3 plugins.";
    };

    nativePlugins = mkOption {
      type = types.listOf types.package;
      default = [];
      description = "Paths to folders which contain plugins which will run \
        natively on linux. They will be placed in the same folder as emulated \
        VSTs.";
    };

    lv2 = mkOption {
      type = types.listOf types.package;
      default = [];
      description = "Packages containing lv2 plugins.";
    };

    suppressUnmaintainedWarning = mkEnableOption "Stop the red warning/trace \
      messages when evaluating unmaintained packages.";
    suppressFreemiumWarning = mkEnableOption "Stop the red warning/trace \
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

    lv2Directory = mkOption {
      type = types.str;
      default = ".lv2";
      description = "Path relative to your home directory where lv2 plugins \
        will be installed.";
    };

    package = mkOption {
      type = types.package;
      default = pkgs.callPackage ./packages/yabridge {};
      description = "Nix package containing the yabridge binary.";
    };
    ctlPackage = mkOption {
      type = types.package;
      default = pkgs.yabridgectl;
      description = "Nix package containing the yabridgectl binary.";
    };
  };

  config = let
    # binary to use
    yabridgectl = "${cfg.ctlPackage}/bin/yabridgectl";

    # warn functions for certain licenses n stuff
    warnGeneral = package: cancel: tag: warningFunc: (
      if
        (builtins.hasAttr tag package
          && !cancel)
      then
        if (package.${tag})
        then
          (lib.trivial.warn
            (warningFunc package)
            package)
        else package
      else package
    );

    warnDeprecated = package: (warnGeneral package
      cfg.suppressUnmaintainedWarning "deprecated"
      (deprecated: "${package.name} is deprecated software and recieves no \
        updates or support."));
    warnDemo = package: (warnGeneral package
      cfg.suppressFreemiumWarning "demo"
      (demo: "${demo.name} is a paid product. You will only get the demo \
        functionality. Using the full version of ${demo.name} installed via \
        this flake is untested."));

    warnings = [warnDeprecated warnDemo];

    # nest all the warnings into one function
    warn = package: (lib.lists.foldr (func: folded: (func folded)) package warnings);

    # functions to create commands for a package (and warn)
    toCpCommand = package: "cp -r \"${warn package}\" \"$out/${package.name}\"";
    toLnCommand = package: let
      command = "ln -sf \"${warn package}\" \"$out/${package.name}\"";
    in "echo ${command} && ${command}";
    toYabridgeCommand = package: "${yabridgectl} add \"$out/${package.name}\"";

    # list of strings (commands) created from packages
    cpCommands = map toCpCommand cfg.plugins;
    yabridgeCommands = map toYabridgeCommand cfg.plugins;

    # edit yabridge config to explicitly include extraPath
    escapedExtraPath =
      lib.strings.escape [
        "/"
        " "
        "("
        ")"
        "["
        "]"
        "{"
        "}"
        "\""
        "\'"
      ]
      cfg.extraPath;
    patch =
      if cfg.extraPath != ""
      then ''
        # try to replace line three (if there are very few plugins, ] is on same line)
        # different versions use line 2 and 3 i think
        sed -i "3s/\]$/,'${escapedExtraPath}']/" $out/config/yabridgectl/config.toml
        sed -i "2s/\]$/,'${escapedExtraPath}']/" $out/config/yabridgectl/config.toml
        # replace line containing only "]" with a new entry for extraPath
        sed -i "s/^\]$/'${escapedExtraPath}']/" $out/config/yabridgectl/config.toml
      ''
      else "";

    # create script to setup directory and execute the copy commands and then
    # sync with the yabridge commands.
    scriptContents = ''
      mkdir $out

      # set all variables to have yabridge work in nix store
      export WINEPREFIX=$out/wine
      export XDG_CONFIG_HOME=$out/config
      export HOME=$out/home
      ${yabridgectl} set --path="${cfg.package}/lib"

      # copy all vst plugin folders to out directory
      ${builtins.concatStringsSep "\n" cpCommands}

      # add all the copied plugin folders to yabridge
      ${builtins.concatStringsSep "\n" yabridgeCommands}

      ${yabridgectl} sync

      # adds extraPath
      ${patch}
    '';

    userYabridge =
      pkgs.runCommandLocal
      "yabridge-configuration"
      {}
      scriptContents;

    # create a derivation which will copy all the native plugins into its
    # working directory
    nativePluginLnCommands = ''
      mkdir $out
      ${
        builtins.concatStringsSep "\n"
        (map toLnCommand cfg.nativePlugins)
      }
    '';

    nativePlugins =
      pkgs.runCommandLocal
      "native-plugins-combined"
      {}
      nativePluginLnCommands;

    # same thing but lv2 plugins
    lv2LnCommands = ''
      mkdir $out
      ${
        builtins.concatStringsSep "\n"
        (map toLnCommand cfg.lv2)
      }
    '';
    lv2Plugins =
      pkgs.runCommandLocal
      "lv2-plugins-combined"
      {}
      lv2LnCommands;
  in
    mkIf cfg.enable {
      home.packages = [cfg.ctlPackage];
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
          source = nativePlugins;
          recursive = true;
        };

        "${cfg.lv2Directory}" = {
          source = lv2Plugins;
          recursive = true;
        };

        ".config/yabridgectl" = {
          source = "${userYabridge}/config/yabridgectl";
          recursive = true;
        };
      };
    };
}
