# see
# https://nixos.wiki/wiki/Steam
# https://journix.dev/posts/gaming-on-nixos/
# https://github.com/fufexan/nix-gaming
#
{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;

      gamescopeSession = {
        enable = true;
      };
    };

    gamemode = {
      enable = true;
    };

    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  environment.systemPackages = with pkgs; [
    mangohud
    zenity # Steam’s dialogs under Wayland
    protonup
  ];
}
