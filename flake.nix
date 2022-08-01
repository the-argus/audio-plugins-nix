{
  description = "A nix flake providing a home-manager module for VST emulation with yabridge, and a set of packaged audio plugins.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { self
    , nixpkgs
    , ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      homeManagerModule = import ./module.nix;
      mpkgs = import ./packages { inherit pkgs; };
    };
}
