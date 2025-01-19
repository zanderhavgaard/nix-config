# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  ...
}:

{
  networking.hostName = "venera";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/user.nix
    ../../modules/nixos/programs.nix
    ../../modules/nixos/services.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/fonts.nix
    # ../../modules/nixos/river.nix
    # ../../modules/nixos/plasma.nix
    ../../modules/nixos/gnome.nix
    ../../modules/nixos/neovim.nix
    ../../modules/nixos/bottles.nix
    ../../modules/nixos/steam.nix
  ];

  # boot.kernelParams = [
  #   "nvidia-drm.fbdev=1"
  # ];

  # hardware = {
  #   graphics = {
  #     enable = true;
  #   };
  #
  #   nvidia = {
  #     open = true; # Set to false for proprietary drivers
  #     modesetting.enable = true;
  #
  #     prime = {
  #       # sync = {
  #       #   enable = false;
  #       # };
  #
  #       offload = {
  #         enable = true;
  #         enableOffloadCmd = true;
  #       };
  #
  #       # integrated
  #       intelBusId = "PCI:0:2:0";
  #       # dedicated
  #       nvidiaBusId = "PCI:1:0:0";
  #     };
  #   };
  # };

  # specialisation = {
  #   gaming-time.configuration = {
  #
  #     hardware.nvidia = {
  #       prime.sync.enable = lib.mkForce true;
  #       prime.offload = {
  #         enable = lib.mkForce false;
  #         enableOffloadCmd = lib.mkForce false;
  #       };
  #     };
  #
  #   };
  # };

  # These should be set through nixos hardware flake
  # even though it says xserver, should enable for both x and wayland
  # services = {
  #   xserver = {
  #     videoDrivers = [ "nvidia" ];
  #   };
  # };
  # services.xserver.videoDrivers = [“amdgpu”];

  #
  # --------------------------------------------------
  #

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
