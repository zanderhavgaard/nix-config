# sometimes its conveient to be able to fall back on plasma when things dont work
{
  ...
}:
{
  services = {

    xserver = {
      enable = true;
    };

    displayManager = {
      # sddm seems to be bugged currently ...
      sddm = {
        enable = false;
        wayland.enable = false;
      };
    };

    desktopManager = {
      plasma6 = {
        enable = true;
      };
    };

  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

}
