# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  lib,
  ...
}:

{
  networking.hostName = "nostromo";

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
    ../../modules/nixos/neovim.nix
    ../../modules/nixos/bottles.nix
    ../../modules/nixos/cosmic.nix
    ../../modules/nixos/steam.nix
  ];

  # mount extra disk to /data
  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/26ffd841-3e75-45bc-a7c5-7d353b6d2b19";
    fsType = "ext4";
  };

  # Nostromo is currently on nixos-unstable
  # this seems to conflict with services.gnome.gcr-ssh-agent.enable in unstable
  # TODO: figure which ssh-agent to use ...
  programs.ssh.startAgent = lib.mkForce false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
