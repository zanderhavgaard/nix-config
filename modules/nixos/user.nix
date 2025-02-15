{ pkgs, ... }:

let
  username = "zander";
  fullname = "Zander Hornung Havgaard";
in
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = fullname;
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
    # set default shell to bash, which launches fish
    # see: https://nixos.wiki/wiki/Fish
    shell = pkgs.bash;
  };

  # use bash to start fish shell when logging in interactively
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  # try to automatically unlock keyring when logging in as user
  security.pam.services.${username}.enableGnomeKeyring = true;
  security.polkit.enable = true;

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

    # see: https://nixos.org/manual/nixos/stable/#custom-xkb-layouts
    extraLayouts = {
      us-hhkb-esque = {
        # name = "English (US, HHKB-esque)";
        description = "US, HHKB-esque";
        languages = [ "eng" ];
        symbolsFile = ./symbols/us-hhkb-esque;
      };
    };
  };

  # use xkb options in tty
  console.useXkbConfig = true;
}
