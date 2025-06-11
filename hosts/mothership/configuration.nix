# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  pkgs,
  lib,
  ...
}:

{
  networking.hostName = "mothership";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
  };

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/user.nix
    ../../modules/nixos/neovim.nix
  ];

  # overrride default to use latest kernel, and use standard/lts
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages;

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
    docker.enable = false;
  };

  services = {
    # enable firmware udpate daemon
    fwupd.enable = true;

    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        ChallengeResponseAuthentication = false;
        AllowUsers = [ "zander" ];
        # this fails to build
        # UseDNS = false; # speeds up login
        LoginGraceTime = "30s";
        MaxAuthTries = 3;
        MaxSessions = 2;
      };
    };
  };

  programs = {
    gnupg.agent = {
      enable = true;
    };
    ssh = {
      startAgent = true;
    };
    fish.enable = true;
    vim.enable = true;
    git.enable = true;
    yazi.enable = true;
    lazygit.enable = true;
    htop.enable = true;
    nh = {
      enable = true;
      clean = {
        enable = true;
      };
    };
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # system stuff
    coreutils
    killall
    busybox
    lemonade
    glib
    libnotify
    pciutils

    # graphical applications
    kitty

    # cli programs
    helix
    wget
    tealdeer
    zellij
    fastfetch
    pfetch-rs
    yazi
    nixfmt-rfc-style
    fzf
    ripgrep
    fd
    sad
    lolcat
    unzip
    unar
    neo-cowsay
    go-task
    grc
    nitch
    openssl
    btop
    iftop
    tcpdump
    prettyping
    gping
    nmap
    hping
    traceroute
    ipcalc
    dnsutils
    dnstop
    eza
    bat
    ncdu
    jq
    yq-go
    zip
    magic-wormhole
    figlet
    fast-cli
    gum
    yt-dlp
    termscp
    ueberzugpp
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
