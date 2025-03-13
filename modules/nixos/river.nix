# this modules has some components for running riverwm
# with waybar as the panel and ly as the display manager
# configuration is handled in their respective home-manager modules
{
  pkgs,
  lib,
  fetchFromGitHub,
  ...
}:
let
  pythonPackages = pkgs.python3Packages;
  riverwm-utils = pythonPackages.buildPythonPackage rec {
    pname = "riverwm-utils";
    version = "0.0.10";
    pyproject = true;

    src = pkgs.fetchFromGitHub {
      owner = "NickHastings";
      repo = "riverwm-utils";
      rev = version;
      hash = "sha256-1T6rDhkBDmlpc0RmK2fiFTy2v+Ab40Em9REBCr98180=";
    };

    build-system = [
      pythonPackages.setuptools
    ];

    dependencies = with pythonPackages; [
      pywayland
    ];

    pythonImportsCheck = [
      "riverwm_utils"
    ];

    meta = {
      description = "";
      homepage = "https://github.com/NickHastings/riverwm-utils";
      license = lib.licenses.gpl3Only;
      maintainers = with lib.maintainers; [ ];
      mainProgram = "riverwm-utils";
    };
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
