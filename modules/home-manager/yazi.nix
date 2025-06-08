{ ... }:
{
  programs.yazi = {
    enable = true;

    enableFishIntegration = true;
    # shellWrapperName = "yy"; # this doesn't seem to work

    # these don't seem to work either
    settings = {
      manager = {
        show_hidden = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
    };
  };
}
