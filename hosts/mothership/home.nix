{ ... }:

let
  username = "zander";
  homePath = "/home/${username}";
in
{
  imports = [
    # common programs
    ../../modules/home-manager/programs.nix
    # config for specigic programs
    ../../modules/home-manager/fish.nix
    ../../modules/home-manager/yazi.nix
  ];

  # Configure the user
  home.username = username;
  home.homeDirectory = homePath;

  # define the nixpkgs version to use
  home.stateVersion = "25.05";

  # let home-manager install and mange itself
  programs.home-manager.enable = true;

  # packages installed for the user
  # home.packages = with pkgs; [
  # ];
}
