{ lib, ... }:
{
  # create bootable configruration for using machine as roon-bridge
  specialisation = {
    roon-bridge.configuration = {

      # roon bridge
      services.roon-bridge = {
        enable = true;
        openFirewall = true;
      };

      # the above seetting should open the right ports in the firewall,
      # but it doesn't seem to work in practice, we disable it while running the bridge
      networking = {
        firewall.enable = lib.mkForce false;
      };

    };
  };
}
