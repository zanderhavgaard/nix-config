{ pkgs, config, ... }:
{
  xdg.configFile."river/init".source =
    config.lib.file.mkOutOfStoreSymlink "/home/zander/nix-config/modules/river/init";

  # wayland.windowManager.river.settings = { };
}
