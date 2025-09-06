{
  pkgs,
  ...
}:
{
  services = {
    desktopManager = {
      cosmic = {
        enable = true;
      };
    };

    displayManager = {
      cosmic-greeter = {
        enable = true;
      };
    };
  };

  # some variables needed for wayland to work with xdg-portal and some applications
  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    _JAVA_AWT_WM_NONREPARENTING = 1;
    SDL_VIDEODRIVER = "wayland";
    QT_QPA_PLATFORM = "wayland";
  };

  # try to make cosmic play nice with gnome-keyring
  # 1) Run the daemon + autostart entries
  services.gnome.gnome-keyring.enable = true;

  # 2) Ensure PAM unlocks the keyring for your active login path(s)
  # If you use greetd / cosmic-greeter:
  security.pam.services.greetd.enableGnomeKeyring = true;

  # If you ever log in via TTY:
  security.pam.services.login.enableGnomeKeyring = true;

  # 3) Ensure portals aren’t missing (some apps poke via portals)
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-cosmic ];
}
