{ pkgs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # use latest kernel version
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
