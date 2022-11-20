{
  description = "A nix flake providing a home-manager module for VST emulation with yabridge, and a set of packaged audio plugins.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    genSystems = nixpkgs.lib.genAttrs supportedSystems;
    pkgs = genSystems (system: import nixpkgs {inherit system;});

    defaultSystem = "x86_64-linux";
  in {
    homeManagerModule = (import ./module.nix) pkgs.${defaultSystem};
    homeManagerModules = genSystems (system: (import ./module.nix) pkgs.${system});
    mpkgs = pkgs.${defaultSystem}.callPackage ./packages {};
    mpkgSets = genSystems (system: pkgs.${system}.callPackage ./packages {});
  };
}
