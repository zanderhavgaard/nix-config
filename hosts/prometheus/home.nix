{ config, pkgs, ... }:

let
  username = "zander";
  homePath = "/home/${username}";
  configPath = "${homePath}/nix-config/config";
in
{
  imports = [
    # ../../modules/waybar/waybar.nix
    # ../../modules/river.nix
    ../../modules/wezterm.nix
    ../../modules/fish.nix
    ../../modules/home-manager/git.nix
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
  ];

  programs.tealdeer = {
    enable = true;
    settings = {
      auto_update = true;
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  programs.fzf.enable = true;
}
