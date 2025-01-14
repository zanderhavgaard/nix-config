{ ... }:
{
  programs.qutebrowser = {
    enable = true;
    settings = {
      colors.webpage.darkmode.enabled = true;
      colors.webpage.darkmode.policy.images = "smart";
      colors.webpage.bg = "black";
    };
  };
}
