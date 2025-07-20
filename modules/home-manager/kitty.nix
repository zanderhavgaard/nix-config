{
  ...
}:
{
  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };

    font = {
      name = "MartianMono Nerd Font";
      size = 10;
    };
    themeFile = "OneHalfDark";

    settings = {
      background_opacity = 0.9;
      enable_audio_bell = false;
    };
  };
}
