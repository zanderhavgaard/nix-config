# this modules has some components for running riverwm
# with waybar as the panel and ly as the display manager
# configuration is handled in their respective home-manager modules
{ pkgs, ... }:
let
  # try to add riverwm-utils pypi package as nix package
  # TODO: fix, fails when running 'cycle-focused-tags'
  pythonPackages = pkgs.python3Packages;
  riverwm-utils = pythonPackages.buildPythonPackage rec {
    pname = "riverwm-utils";
    version = "0.0.10";
    src = pkgs.fetchPypi {
      inherit pname version;
      sha256 = "sha256-Vypeb4ffMtDrljZltm+o3ycg8+OeAvaem6xCYD6QFSo=";
    };
    doCheck = false;
  };
in
{
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };

  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "river";
  };

  # it's convenient to have a display manager as well
  services.displayManager.ly.enable = true;

  programs = {
    # enable riverwm
    river.enable = true;

    # enable waybar
    waybar.enable = true;
  };

  # some packages needed for a functional desktop with river
  environment.systemPackages = with pkgs; [
    wideriver
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
    brightnessctl
    mako
    swayidle
    swaybg
    swww
    swaylock
    wayshot
    slurp
    fuzzel
    wl-clipboard
    libnotify
    wlr-randr
    pavucontrol
    pamixer
    playerctl
    brightnessctl
    networkmanagerapplet
    wdisplays
    riverwm-utils
  ];
}
