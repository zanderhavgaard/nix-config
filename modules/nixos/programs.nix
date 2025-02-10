# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  pkgs,
  pkgs-unstable,
  ...
}:

let
  username = "zander";
in
{

  # TODO: think we might need this
  # https://nix.dev/guides/faq#how-to-run-non-nix-executables
  programs.nix-ld.enable = true;

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
  };

  programs = {
    zsh.enable = true;
    fish.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    vim.enable = true;

    git.enable = true;

    firefox.enable = true;
    chromium.enable = true;

    thunderbird.enable = true;
    foot.enable = true;
    yazi.enable = true;
    lazygit.enable = true;
    direnv.enable = true;
    htop.enable = true;
    _1password.enable = true; # cli
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ username ];
    };
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
    ## Example how to add package from unstable nixpkgs
    # pkgs-unstable.ghostty
    wezterm
    kitty
    alacritty
    ghostty
    bitwarden-desktop
    bitwarden-cli
    xfce.thunar
    signal-desktop
    discord
    slack
    qutebrowser
    mpv
    zathura
    sioyek
    nextcloud-client

    # cli programs
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
    htop
    unzip
    neo-cowsay
    go-task
    grc
    nitch
    btop
    iftop
    tcpdump
    bottom
    eza
    bat
    devbox
    devenv
    nix-output-monitor
    gh
    hub
    comma
    ncdu
    jq
    yq-go
    zip

    wl-clipboard
    libnotify
    wlr-randr
    pavucontrol
    pamixer
    playerctl
    brightnessctl
    wdisplays

    # container/k8s stuff
    lazydocker
    kubectl
    kubernetes-helm
    k9s
    kubectx
    # kubeswitch
  ];
}
