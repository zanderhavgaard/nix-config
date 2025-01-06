{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zander = {
    isNormalUser = true;
    description = "Zander Hornung Havgaard";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "audio"
      "video"
      "optical"
      "storage"
      "docker"
    ];
    shell = pkgs.zsh;
  };

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_DK.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
