{ config, pkgs, ... }:

{
  # Configure the user
  home.username = "zander";
  home.homeDirectory = "/home/zander";

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
