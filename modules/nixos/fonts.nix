{ pkgs, lib, ... }:
{
  fonts.packages =
    (with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-lgc-plus
      noto-fonts-emoji
      noto-fonts-extra
    ])
    ++ (with pkgs; [
      nerd-fonts.hack
      nerd-fonts.mononoki
      nerd-fonts.martian-mono
      nerd-fonts._0xproto
      nerd-fonts.blex-mono
      nerd-fonts.ubuntu
      nerd-fonts.ubuntu-mono
    ]);
  # install all nerd fonts available
  # ++ (builtins.attrValues (lib.filterAttrs (_: v: lib.isDerivation v) pkgs.nerd-fonts));
}
