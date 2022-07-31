{ pkgs, ... }:
let
  pname = "Fire";
  version = "1.0.0";
in
pkgs.stdenv.mkDerivation
{
  inherit pname version;

  src = pkgs.fetchgit {
    url = "https://github.com/jerryuhoo/Fire";
    rev = "971ea15e6caebe5881184239a299b51a10ecaccf";
    sha256 = "0wjps2b9g9482n8xqm7kcj19n30h6xfv4wwsp8srpazpn5ylqjl6";
    fetchSubmodules = true; # get JUCE
    deepClone = true;
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
      echo "Current directory:"
      ls
      echo "./JUCE:"
      ls JUCE
      echo "WD:"
      pwd
      rmdir JUCE
      cp -r ${juce-src} ./JUCE
      cp -r ${rwq-src} ./readerwriterqueue
      cp -r ${catch2-src} ./Catch2
      chmod +w ./JUCE -R
      chmod +w ./readerwriterqueue -R
      chmod +w ./Catch2 -R
      ls ./Catch2
    '';

  buildPhase =
    '' 
      cmake -S . -B ./build
    '';

  installPhase = ''
    mkdir $out
    cd ./build
    cp -r . $out
  '';
}
