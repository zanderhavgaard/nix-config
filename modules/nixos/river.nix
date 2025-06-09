# this modules has some components for running riverwm
# with waybar as the panel and ly as the display manager
# configuration is handled in their respective home-manager modules
{
  pkgs,
  ...
}:
{
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
      ];
      config.common.default = [ "wlr" ];
    };
  };

  # some variables needed for riverwm/wayland to work xdg-portal and some applications
  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    _JAVA_AWT_WM_NONREPARENTING = 1;
    SDL_VIDEODRIVER = "wayland";
    QT_QPA_PLATFORM = "wayland";
    XDG_SESSION_TYPE = "wayland";
    # NOTE: we set these to 'sway' instead of 'river'
    # as some applications unintuitively only support sway
    # and not wl-roots, for example flameshot ...
    XDG_CURRENT_DESKTOP = "sway";
    XDG_SESSION_DESKTOP = "sway";

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
    xdg-desktop-portal-wlr
    wideriver
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
    pwvucontrol
    pamixer
    playerctl
    brightnessctl
    networkmanagerapplet
    wdisplays
    # riverwm-utils
  ];
}
