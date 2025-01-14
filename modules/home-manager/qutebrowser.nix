{ ... }:
{
  # import theme defined in separate file
  imports = [
    ./qutebrowser-theme.nix
  ];

  programs.qutebrowser = {
    enable = true;

    settings = {
      tabs = {
        position = "left";
      };

      colors = {
        webpage = {
          darkmode = {
            enabled = true;
            policy = {
              images = "smart";
            };
          };
        };
      };
    };
  };
}
