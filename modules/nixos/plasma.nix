# sometimes its conveient to be able to fall back on plasma when things dont work
{ ... }:
{
  # services = {
  #
  #   xserver = {
  #     enable = true;
  #   };
  #
  #   displayManager = {
  #     sddm = {
  #       enable = true;
  #       wayland.enable = true;
  #     };
  #   };
  #
  #   desktopManager = {
  #     plasma6 = {
  #       enable = true;
  #     };
  #   };
  #
  # };

  # FIXME: for some reason plasma crashes instantly when starting under wayland
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";

  services.displayManager.sddm.wayland.enable = true;

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

}
