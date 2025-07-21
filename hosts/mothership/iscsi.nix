{
  pkgs,
  ...
}:
{
  networking.firewall.allowedTCPPorts = [ 3260 ];

  environment.systemPackages = with pkgs; [
    targetcli
    lvm2
  ];
}
