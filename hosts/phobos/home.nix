{ config, pkgs, ... }:

let
  username = "zander";
  homePath = "/home/${username}";
  configPath = "${homePath}/nix-config/config";
in
{
  imports = [
    ../../modules/home-manager/waybar.nix
    ../../modules/home-manager/river.nix
    ../../modules/home-manager/fuzzel.nix
    ../../modules/home-manager/wezterm.nix
    ../../modules/home-manager/fish.nix
    ../../modules/home-manager/zsh.nix
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

  programs.zellij = {
    enable = true;
    settings = {
      theme = "one-half-dark";
    };
    # enableZshIntegration = true;
  };
}
