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


  xdg.configFile."river/init".source =
    config.lib.file.mkOutOfStoreSymlink "${configPath}/river/init";

  xdg.configFile."waybar/config.json".source =
    config.lib.file.mkOutOfStoreSymlink "${configPath}/waybar/config.json";
  xdg.configFile."waybar/style.css".source =
    config.lib.file.mkOutOfStoreSymlink "${configPath}/style.css";

  # packages installed for the user
  home.packages = with pkgs; [
    lolcat
    nix-output-monitor
  ];

  # define the nixpkgs version to use
  home.stateVersion = "24.11";

  # let home-manager install and mange itself
  programs.home-manager.enable = true;
}
