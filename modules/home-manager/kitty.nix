{ ... }:
{
  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };

    font.name = "Hack Nerd Font";
    themeFile = "OneDark-Pro";

    settings = {
      background_opacity = 0.9;
    };
  };
}
