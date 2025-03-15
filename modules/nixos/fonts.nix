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
    # install all nerd fonts available
    ++ (builtins.attrValues (lib.filterAttrs (_: v: lib.isDerivation v) pkgs.nerd-fonts));
}
