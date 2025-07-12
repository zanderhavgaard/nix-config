{
  pkgs,
  ...
}:
{
  boot.supportedFilesystems = [ "zfs" ];

  # auto mount zfs pool
  boot.zfs.extraPools = [ "tank" ];

  networking = {
    # required for zfs
    # created by running ‘head -c 8 /etc/machine-id’
    hostId = "31d7e2a7";
  };

  services = {
    zfs = {
      autoScrub.enable = true;
      autoSnapshot.enable = true; # Optional: ZFS autosnapshots
    };
  };

  environment.systemPackages = with pkgs; [
    zfs
  ];
}
