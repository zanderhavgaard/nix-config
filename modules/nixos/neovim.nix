{
  inputs,
  pkgs,
  ...
}:
{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;

      # enable providers for plugins in other languages than lua
      withPython3 = true;
      withNodeJs = true;
    };
  };

  # neovim dependencies
  environment.systemPackages = with pkgs; [
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
    lazygit
    ripgrep
    fd
  ];
}