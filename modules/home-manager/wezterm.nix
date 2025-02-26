{ pkgs, ... }:
{
  # programs.wezterm.enable = true;
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    # currenly there is no fish shell integration
    extraConfig = ''
      -- Pull in the wezterm API
      local wezterm = require("wezterm")

      -- This table will hold the configuration.
      local config = {}

      -- In newer versions of wezterm, use the config_builder which will
      -- help provide clearer error messages
      if wezterm.config_builder then
      	config = wezterm.config_builder()
      end

      -- This is where you actually apply your config choices

      config.color_scheme = "OneDark (base16)"
      config.font = wezterm.font("Hack Nerd Font")

      -- enable transparency
      config.window_background_opacity = 0.9

      -- setup toggle of top bar
      config.enable_tab_bar = false

      -- and finally, return the configuration to wezterm
      return config
    '';
  };
}
