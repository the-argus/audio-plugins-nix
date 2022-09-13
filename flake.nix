{
  description = "A nix flake providing a home-manager module for VST emulation with yabridge, and a set of packaged audio plugins.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    genSystems = nixpkgs.lib.genAttrs supportedSystems;
    pkgs = genSystems (system: import nixpkgs {inherit system;});

    defaultSystem = "x86_64-linux";
  in {
    homeManagerModule = import ./module.nix;
    mpkgs = pkgs.${defaultSystem}.callPackage ./packages {};
    mpkgSets = genSystems (system: pkgs.${system}.callPackage ./packages {});
  };
}
