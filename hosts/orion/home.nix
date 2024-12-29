{ config, pkgs, ... }:

let
  username = "zander";
  homePath = "/home/${username}";
  configPath = "${homePath}/nix-config/config";
in
{
  imports = [
    ../../modules/waybar/waybar.nix
    ../../modules/wezterm.nix
    ../../modules/fish.nix
    ../../modules/river/river.nix
  ];

  # Configure the user
  home.username = username;
  home.homeDirectory = homePath;

  # define the nixpkgs version to use
  home.stateVersion = "24.11";

  # let home-manager install and mange itself
  programs.home-manager.enable = true;

  # packages installed for the user
  home.packages = with pkgs; [
    lolcat
    nix-output-monitor
  ];
}
