{ ... }:
{
  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };

    font.name = "MartianMono Nerd Font";
    themeFile = "OneDark-Pro";
    # themeFile = "Dracula";
    # themeFile = "Doom_One";

    settings = {
      background_opacity = 0.9;
      enable_audio_bell = false;
    };
  };
}
