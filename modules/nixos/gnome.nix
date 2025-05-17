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
    zenity # Steam’s dialogs under Wayland
  ];
}
