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
}
