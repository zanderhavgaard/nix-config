{ config, pkgs, ... }:

let
  username = "zander";
  homePath = "/home/${username}";
  configPath = "${homePath}/nix-config/config";
in
{
  imports = [
    # window manager and bar
    ../../modules/home-manager/waybar.nix
    ../../modules/home-manager/river.nix
    # common programs
    ../../modules/home-manager/programs.nix
    # config for specigic programs
    ../../modules/home-manager/fuzzel.nix
    ../../modules/home-manager/wezterm.nix
    ../../modules/home-manager/fish.nix
    ../../modules/home-manager/zsh.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/gtk.nix
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
}
