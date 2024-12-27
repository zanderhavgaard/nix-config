{ config, pkgs, ... }:
{
  # home.packages = with pkgs; [
  #   fish
  #   starship
  # ];

  # programs.starship = {
  #   enable = true;
  #   enableFishIntegration = true;
  # };

  # programs.fish.enable = true;

  # programs.fish = {
  #   enable = true;
  # these seem to be installed but not loaded ...
  # plugins = [
  #   {
  #     name = "autopair";
  #     src = pkgs.fishPlugins.autopair.src;
  # }
  #   {
  #     name = "done";
  #     src = pkgs.fishPlugins.done.src;
  #   }
  #   {
  #     name = "fish-you-should-use";
  #     src = pkgs.fishPlugins.fish-you-should-use.src;
  #   }
  #   {
  #     name = "colored-man-pages";
  #     src = pkgs.fishPlugins.colored-man-pages.src;
  #   }
  #   {
  #     name = "plugin-git";
  #     src = pkgs.fishPlugins.plugin-git.src;
  #   }
  #   {
  #     name = "grc";
  #     src = pkgs.fishPlugins.grc.src;
  #   }
  #   {
  #     name = "fish-bd";
  #     src = pkgs.fishPlugins.fish-bd.src;
  #   }
  #   ];
  # };
}
