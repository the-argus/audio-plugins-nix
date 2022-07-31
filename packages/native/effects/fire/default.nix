{ pkgs, ... }:
let
  pname = "Fire";
  version = "0.9.9";
in
pkgs.stdenv.mkDerivation
{
  inherit pname version;

  src = pkgs.fetchgit {
    url = "https://github.com/jerryuhoo/Fire";
    rev = "7bd2f52ffa8c85e3e2c38e15f4d434089f7d616a";
    sha256 = "1ygsmmd0m20ak3qmjmw4mssljkippkjcw73m8g9a9d4dygjqsw4w";
    fetchSubmodules = false;
    deepClone = false;
  };

  nativeBuildInputs = with pkgs; [
    cmake
    pkgconfig
    git
    xorg.libX11
    xorg.libXrandr
    xorg.libXinerama
    xorg.libXext
    xorg.libXcursor
    freetype

    # extra modules
    alsaLib
    gtk3-x11
    webkitgtk

    # pkgconfig
    pcre
  ];

  dontPatch = false;
  patches = [ ./local-repositories.patch ];

  postPatch =
    let
      juce-src = pkgs.fetchgit {
        url = "https://github.com/juce-framework/JUCE.git";
        rev = "4c43bf429e90690cb1f05b7c8a044cc9f5a59e7d";
        sha256 = "07ncsgis18gnbpcya85ikgykldnaj5xmyfcrdjm2rzzg30f9n07h";
        fetchLFS = false;
        fetchSubmodules = false;
        deepClone = false;
        leaveDotGit = false;
      };

      rwq-src = pkgs.fetchgit {
        url = "https://github.com/cameron314/readerwriterqueue";
        rev = "8e7627d18c2108aca178888d88514179899a044f";
        sha256 = "15yqw51lfmib03rj81vnizpnyf2fi11qk4zfvsq6br158znmgcw3";
        fetchLFS = false;
        fetchSubmodules = false;
        deepClone = false;
        leaveDotGit = false;
      };

      catch2-src = pkgs.fetchgit {
        url = "https://github.com/catchorg/Catch2.git";
        rev = "997a7d4165b3939347f1a95f9311a3e3c066ee0b";
        sha256 = "0jslynkl6c1q3lpzv2wirdncwdz0qm80w4wdhw1bh49azbhz6zc8";
        fetchLFS = false;
        fetchSubmodules = false;
        deepClone = false;
        leaveDotGit = false;
      };
    in
    ''
      rmdir JUCE
      cp -r ${juce-src} ./JUCE
      cp -r ${rwq-src} ./readerwriterqueue
      cp -r ${catch2-src} ./Catch2
      chmod +w ./JUCE -R
      chmod +w ./readerwriterqueue -R
      chmod +w ./Catch2 -R
    '';

  # buildPhase =
  #   '' 
  #     cmake -S .. -B .
  #     make
  #   '';

  installPhase = ''
    mkdir $out
    cp -r . $out
  '';
}
