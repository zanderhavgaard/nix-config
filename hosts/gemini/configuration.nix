# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  pkgs,
  pkgs-unstable,
  config,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # use latest kernel version
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "gemini"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

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

  # enable firmware udpate daemon
  services.fwupd.enable = true;

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = false;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # services.displayManager.ly.enable = true;

  # enable hyprland
  # programs.hyprland.enable = true;
  # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # desktop portal wlroots-based window mangers, like river
  # xdg.portal.wlr.enable = true;
  # programs.river.enable = true;
  # programs.waybar.enable = true;

  programs.zsh.enable = true;
  programs.fish.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

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

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
  };

  programs.vim.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # install and enable docker daemon
  virtualisation.docker.enable = true;

  # TODO: think we might need this
  # https://nix.dev/guides/faq#how-to-run-non-nix-executables
  programs.nix-ld.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    pkgs-unstable.ghostty
    coreutils
    killall
    busybox

    lxappearance
    pavucontrol
    power-profiles-daemon
    networkmanagerapplet
    pamixer
    playerctl
    brightnessctl

    arc-theme
    papirus-icon-theme
    capitaine-cursors

    wofi
    hyprlauncher
    wideriver
    mako
    swayidle
    swaybg
    swaylock
    wayshot
    slurp

    wget
    wezterm
    foot
    zellij
    bitwarden-desktop
    bitwarden-cli
    dolphin
    git
    tealdeer
    fastfetch
    pfetch-rs
    yazi
    wl-clipboard
    lemonade
    nixfmt-rfc-style
    fzf
    ripgrep
    fd
    lazygit
    gcc
    lua5_1
    luajit
    luarocks
    stylua
    viu
    chafa
    unzip
    python3
    neo-cowsay
    go-task
    nodejs_latest
    rustc
    cargo
    grc
    nitch
    btop
    eza
    libnotify
    bat
    devbox
    devenv
    direnv
    gh
    hub

    glib

    signal-desktop
    discord
    slack
    _1password-gui
    _1password-cli

    lolcat
    nix-output-monitor
  ];

  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-lgc-plus
    noto-fonts-emoji
    noto-fonts-extra
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
