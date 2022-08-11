{ pkgs, ... }:
{
  wrapPluginPath = package: path: (pkgs.runCommandLocal
    (package.name or package.pname)
    { }
    "ln -sf ${package}/${path} $out"
  );
}
