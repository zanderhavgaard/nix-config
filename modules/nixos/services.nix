{ ... }:
{
  networking = {
    networkmanager = {
      enable = true;
    };
    firewall = {
      enable = true;
    };
  };

  virtualisation = {
    # install and enable docker daemon
    docker.enable = true;

    # install waydroid
    waydroid.enable = false;
  };

  services = {
    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    # xserver.enable = false;

    # enable firmware udpate daemon
    fwupd.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;

    # ssh server
    openssh.enable = false;

    # power profile daemon
    # TODO: configure
    power-profiles-daemon.enable = false;

    # start keyring
    gnome.gnome-keyring.enable = true;
  };

}
