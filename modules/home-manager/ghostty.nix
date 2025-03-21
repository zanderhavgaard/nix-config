{ ... }:
{
  programs.ghostty = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;

    settings = {
      # TODO: this should be set to 'none', but doesn't seem to work ...
      window-decoration = "none";
      # should be redundant with the above ...
      gtk-titlebar = false;

      theme = "DoomOne";
      font-family = "Hack Nerd Font";
      background-opacity = 0.9;
      # non-blinking block cursor
      shell-integration-features = "no-cursor";
      cursor-style-blink = false;
    };
  };
}
