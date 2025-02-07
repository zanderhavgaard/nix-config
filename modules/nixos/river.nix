# this modules has some components for running riverwm
# with waybar as the panel and ly as the display manager
# configuration is handled in their respective home-manager modules
{ pkgs, ... }:
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
  ];
}
