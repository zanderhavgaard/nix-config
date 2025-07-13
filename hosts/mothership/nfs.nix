{
  ...
}:
{
  services.nfs.server = {
    enable = true;

    exports = ''
      /srv/kubernetes-nfs-data \
        192.168.1.101(rw,sync,no_subtree_check,fsid=0,all_squash,anonuid=1000,anongid=1000) \
        192.168.1.102(rw,sync,no_subtree_check,fsid=0,all_squash,anonuid=1000,anongid=1000) \
        192.168.1.103(rw,sync,no_subtree_check,fsid=0,all_squash,anonuid=1000,anongid=1000)
    '';
  };

  networking.firewall = {
    allowedTCPPorts = [
      2049
    ];
  };
}
