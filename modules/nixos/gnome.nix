{
  pkgs,
  ...
}:
{
  # Enable GNOME Desktop Environment and GDM display manager
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Include GNOME Settings Daemon's udev rules (needed for tray icon support)
  services.udev.packages = with pkgs; [
    gnome-settings-daemon
  ];

  # System packages: AppIndicator extension
  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-panel
  ];

  # some variables needed for wayland to work with xdg-portal and some applications
  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    _JAVA_AWT_WM_NONREPARENTING = 1;
    SDL_VIDEODRIVER = "wayland";
    QT_QPA_PLATFORM = "wayland";
  };
}
