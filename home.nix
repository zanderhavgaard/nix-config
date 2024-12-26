{ config, pkgs, ... }:

let
  username = "zander";
  homePath = "/home/${username}";
  configPath = "${homePath}/nix-config/config";
in
{
  # Configure the user
  home.username = username;
  home.homeDirectory = homePath;

  # define the nixpkgs version to use
  home.stateVersion = "24.11";

  # let home-manager install and mange itself
  programs.home-manager.enable = true;

  xdg.configFile."river/init".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/river/init";

  xdg.configFile."waybar/config.json".source =
    config.lib.file.mkOutOfStoreSymlink "${configPath}/waybar/config.json";
  xdg.configFile."waybar/style.css".source =
    config.lib.file.mkOutOfStoreSymlink "${configPath}/style.css";

  # programs.fish = {
  #   # enable = true;
  #   # these seem to be installed but not loaded ...
  #   plugins = [
  #     {
  #       name = "done";
  #       src = pkgs.fishPlugins.done.src;
  #     }
  #     {
  #       name = "autopair";
  #       src = pkgs.fishPlugins.autopair.src;
  #     }
  #     {
  #       name = "fish-you-should-use";
  #       src = pkgs.fishPlugins.fish-you-should-use.src;
  #     }
  #     {
  #       name = "colored-man-pages";
  #       src = pkgs.fishPlugins.colored-man-pages.src;
  #     }
  #     {
  #       name = "plugin-git";
  #       src = pkgs.fishPlugins.plugin-git.src;
  #     }
  #     {
  #       name = "grc";
  #       src = pkgs.fishPlugins.grc.src;
  #     }
  #     {
  #       name = "fish-bd";
  #       src = pkgs.fishPlugins.fish-bd.src;
  #     }
  #   ];
  # };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  # packages installed for the user
  home.packages = with pkgs; [
    lolcat
    nix-output-monitor
  ];
}
