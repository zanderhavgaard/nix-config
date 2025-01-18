# see
# https://nixos.wiki/wiki/Steam
# https://journix.dev/posts/gaming-on-nixos/
# https://github.com/fufexan/nix-gaming
{ pkgs, ... }:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia.modesetting.enable = true;
  };

  # These should be set through nixos hardware flake
  # even though it says xserver, should enable for both x and wayland
  # services.xserver.videoDrivers = [“nvidia”];
  # services.xserver.videoDrivers = [“amdgpu”];

  programs = {
    steam = {
      enable = true;

      remotePlay.openFirewall = false; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = false; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = false; # Open ports in the firewall for Steam Local Network Game Transfers

      gamescopeSession = {
        enable = true;
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
