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
      enable = true;
      settings = {
        theme = "one-half-dark";
      };
    };
  };

  programs.bat = {
    config = {
      pager = "less -FR";
      theme = "OneHalfDark";
    };
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "onedark";
      theme_background = false;
      update_ms = 100;
    };
  };
}
