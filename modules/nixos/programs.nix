# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  pkgs,
  pkgs-unstable,
  ...
}:

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
    neovim = {
      enable = true;
      defaultEditor = true;
    };

    git.enable = true;

    firefox.enable = true;
    foot.enable = true;
    yazi.enable = true;
    lazygit.enable = true;
    direnv.enable = true;
    htop.enable = true;
    _1password.enable = true; # cli
    _1password-gui.enable = true;
  };

  # TODO: organize this list ...
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    pkgs-unstable.ghostty
    coreutils
    killall
    busybox

    lxappearance
    pavucontrol
    pamixer
    playerctl
    brightnessctl
    networkmanagerapplet

    arc-theme
    papirus-icon-theme
    capitaine-cursors

    wideriver
    mako
    swayidle
    swaybg
    swaylock
    wayshot
    slurp
    fuzzel

    wget
    wezterm
    kitty
    alacritty
    zellij
    bitwarden-desktop
    bitwarden-cli
    dolphin
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
    sad
    gcc
    lua5_1
    lua51Packages.tiktoken_core
    luajit
    luarocks
    stylua
    lynx
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
    gh
    hub
    wlr-randr
    lazydocker
    kubectl
    kubernetes-helm
    k9s
    kubectx
    # kubeswitch

    glib

    signal-desktop
    discord
    slack

    lolcat
    nix-output-monitor
    htop
  ];
}
