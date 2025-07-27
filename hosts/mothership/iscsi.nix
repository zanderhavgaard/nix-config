{
  pkgs,
  lib,
  ...
}:
{
  networking.firewall.allowedTCPPorts = [ 3260 ];

  environment.systemPackages = with pkgs; [
    targetcli
    lvm2
  ];

  # automatically load the target config on boot
  systemd.services.iscsi-restore = {
    description = "Restore iSCSI config via targetcli";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.targetcli}/bin/targetcli restoreconfig";
      Environment = "PATH=${
        lib.makeBinPath [
          pkgs.kmod
          pkgs.coreutils
        ]
      }";
    };
  };
}
