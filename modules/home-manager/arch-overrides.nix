{
  pkgs,
  lib,
  ...
}:
let
  emptyPackage = pkgs.runCommand "empty" { } "mkdir -p $out";
in
{
  programs = {
    kitty = {
      # avoid installing through nixpkgs
      package = lib.mkForce emptyPackage;
    };
  };
}
