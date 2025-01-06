{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-lgc-plus
    noto-fonts-emoji
    noto-fonts-extra
  ];
}
