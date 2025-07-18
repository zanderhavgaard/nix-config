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
      enableSSHSupport = false;
    };

    ssh = {
      startAgent = true;
    };

    vim.enable = true;

    git.enable = true;

    firefox.enable = true;
    chromium.enable = true;
    # ladybird.enable = true;

    gnome-disks.enable = true;
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
    ## Example how to add package from stable nixpkgs
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
    chromium
    mpv
    sioyek
    nextcloud-client
    ispell
    drawio
    filezilla
    zed-editor

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
    amdgpu_top
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
    bottom
    eza
    bat
    devbox
    nix-output-monitor
    gh
    hub
    comma
    ncdu
    jq
    yq-go
    zip
    magic-wormhole
    figlet
    libxml2 # xmllint
    fast-cli
    gum
    yt-dlp
    termscp
    termusic
    fooyin
    ueberzugpp
    pipe-viewer
    ytfzf
    flameshot
    parted
    imv

    postgresql_17
    openvpn

    wl-clipboard
    libnotify
    wlr-randr
    pwvucontrol
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
    talosctl
    cilium-cli
    kubeseal
  ];
}
