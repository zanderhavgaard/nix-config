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
    neovim = {
      enable = true;
      defaultEditor = true;
    };

    git.enable = true;

    firefox.enable = true;
    chromium.enable = true;

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

    # graphical applications
    pkgs-unstable.ghostty
    wezterm
    kitty
    alacritty
    bitwarden-desktop
    bitwarden-cli
    xfce.thunar
    signal-desktop
    discord
    slack

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
    bottom
    eza
    bat
    devbox
    devenv
    gh
    hub

    # neovim dependencies
    gcc
    lua5_1
    lua51Packages.tiktoken_core
    luajit
    luarocks
    stylua
    lynx
    viu
    chafa
    python3
    nodejs_22
    rustc
    cargo

    # container/k8s stuff
    lazydocker
    kubectl
    kubernetes-helm
    k9s
    kubectx
    # kubeswitch
  ];
}
