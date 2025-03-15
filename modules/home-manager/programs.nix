{ ... }:
{
  programs = {
    tealdeer = {
      enable = true;
      settings = {
        updates = {
          auto_update = true;
        };
      };
    };

    zellij = {
      enable = false;
      settings = {
        theme = "one-half-dark";
      };
    };

    bat = {
      config = {
        pager = "less -FR";
        theme = "OneHalfDark";
      };
    };

    btop = {
      enable = true;
      settings = {
        color_theme = "onedark";
        theme_background = false;
        update_ms = 100;
      };
    };
  };
}
