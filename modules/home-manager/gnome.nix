# home.nix (Home Manager configuration for the user)
{
  pkgs,
  ...
}:

{
  # Enable Nextcloud client tray autostart (user systemd service)
  services.nextcloud-client.enable = true;

  # Enable the AppIndicator support extension via dconf (GNOME Shell)
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        # Allow user extensions (ensure custom extensions can run)
        disable-user-extensions = false;
        # Enable AppIndicator/KStatusNotifierItem extension by its UUID
        enabled-extensions = [
          "appindicatorsupport@rgcjonas.gmail.com"
        ];
      };
    };
  };
}
