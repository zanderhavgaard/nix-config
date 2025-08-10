{
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
}
