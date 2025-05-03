{
  pkgs,
  lib,
  ...
}:
let
  emptyPackage = pkgs.runCommand "empty" { } "mkdir -p $out";
in
{
  # packages installed for the user
  home.packages = with pkgs; [
    nitch
    nixfmt-rfc-style
    nh
    nom
    nvd
  ];

  programs = {
    kitty = {
      # avoid installing through nixpkgs
      package = lib.mkForce emptyPackage;
    };
  };
}
