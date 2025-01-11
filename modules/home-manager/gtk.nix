{ pkgs, ... }:
{

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Capitaine-Cursors";
      package = pkgs.capitaine-cursors;
      # size = ?
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Arc-Dark";
      package = pkgs.arc-theme;
    };
  };
}
