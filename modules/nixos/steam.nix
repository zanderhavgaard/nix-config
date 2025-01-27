# see
# https://nixos.wiki/wiki/Steam
# https://journix.dev/posts/gaming-on-nixos/
# https://github.com/fufexan/nix-gaming
#
{ pkgs, ... }:
{

  programs = {
    steam = {
      enable = true;

      gamescopeSession = {
        enable = true;
      };

      remotePlay = {
        openFirewall = false; # Open ports in the firewall for Steam Remote Play
      };
      dedicatedServer = {
        openFirewall = false; # Open ports in the firewall for Source Dedicated Server
      };
      localNetworkGameTransfers = {
        openFirewall = false; # Open ports in the firewall for Steam Local Network Game Transfers
      };

    };

    gamemode = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    mangohud
  ];
}
