{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    sioyek
  ];

  programs.sioyek = {
    enable = true;
    config = {
      "default_dark_mode" = "1";

      # higher contrast dark theme
      "dark_mode_background_color" = "0.1 0.1 0.1";
      "dark_mode_contrast" = "0.9";
    };
  };
}
