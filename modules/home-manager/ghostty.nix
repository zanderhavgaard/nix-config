{ ... }:
{
  programs.ghostty = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;

    settings = {
      # TODO: this should be set to 'none', but doesn't seem to work ...
      window-decoration = false;

      theme = "OneHalfDark";
      font-family = "Hack Nerd Font";
      background-opacity = 0.9;
      # non-blinking block cursor
      shell-integration-features = "no-cursor";
      cursor-style-blink = false;
    };
  };
}
