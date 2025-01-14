{ pkgs, ... }:
{
  # see: https://wiki.nixos.org/wiki/Flatpak

  # enable the flatpak daemon
  services.flatpak.enable = true;

  # enable flathub repository and install bottles
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      flatpak install --or-update --assumeyes com.usebottles.bottles
    '';
  };
}
