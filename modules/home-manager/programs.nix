{
  pkgs,
  ...
}:
{

  # packages installed for the user
  home.packages = with pkgs; [
    grc
    nitch
    nixfmt-rfc-style
    nh
    nom
    nvd
  ];

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
