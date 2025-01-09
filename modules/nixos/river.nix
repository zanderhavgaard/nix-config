# this modules has some components for running riverwm
# with waybar as the panel and ly as the display manager
# configuration is handled in their respective home-manager modules
{ pkgs, ... }:
{
  # desktop portal wlroots-based window mangers, like river
  # xdg.portal.wlr.enable = true;

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };

  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "river";
  };

  programs = {
    # enable riverwm
    river.enable = true;

    # enable waybar
    waybar.enable = true;
  };

  # it's convenient to have a display manager as well
  # services.displayManager.ly.enable = true;
}
