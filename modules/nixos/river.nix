# this modules has some components for running riverwm
# with waybar as the panel and ly as the display manager
# configuration is handled in their respective home-manager modules
{ ... }:
{
  # desktop portal wlroots-based window mangers, like river
  xdg.portal.wlr.enable = true;

  # enable riverwm
  programs.river.enable = true;

  # enable waybar
  programs.waybar.enable = true;

  # it's convenient to have a display manager as well
  services.displayManager.ly.enable = true;
}
