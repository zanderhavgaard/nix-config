# sometimes its conveient to be able to fall back on plasma when things dont work
{ ... }:
{
  services = {
    displayManager = {
      enable = true;

      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };

    desktopManager = {
      plasma6 = {
        enable = true;
      };
    };
  };
}
