{ ... }:
{
  programs = {
    tealdeer = {
      enable = true;
      settings = {
        auto_update = true;
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
