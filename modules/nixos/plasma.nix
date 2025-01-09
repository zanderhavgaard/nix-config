# sometimes its conveient to be able to fall back on plasma when things dont work
{ ... }:
{
  services = {
    desktopManager = {
      plasma6 = {
        enable = true;
      };
    };
  };
}
