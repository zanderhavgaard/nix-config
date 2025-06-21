{ pkgs, config, ... }:

let
  wallpaper_path = "/home/zander/wallpapers";
  wallpaper_script_name = "wallpaper.sh";
  # create executable shell (bash?) script in nix store, the path is returned
  wallpaper_script_path = pkgs.writeScriptBin "${wallpaper_script_name}" ''
    wallpaper=$(ls ${wallpaper_path} | shuf -n 1)
    swww img --transition-type random "${wallpaper_path}/$wallpaper"
  '';
in
{
  wayland.windowManager.river = {
    enable = true;

    systemd = {
      enable = true;
    };

    settings = {
      # thin wrapper aound riverctl shell commands, the rendered shell script is located in ~/.config/river/init
      # ie, foo = 'bar'; becomes: 'riverctl foo bar'
      # foo = {
      #   foo1 = "bar1";
      #   foo2 = "bar2";
      # };
      # translates to:
      # riverctl foo foo1 bar1
      # riverctl foo foo2 bar2

      # See the river(1), riverctl(1), and rivertile(1) man pages for complete documentation.

      # Set the default layout generator to be rivertile and start it.
      # River will send the process group of the init executable SIGTERM on exit.
      # riverctl default-layout rivertile
      default-layout = "wideriver";

      # new windows go to the top of the stack
      attach-mode = "top";

      # focus should follow the mouse
      focus-follows-cursor = "normal";

      # move mouse cursor when focus changes
      set-cursor-warp = "on-output-change";

      # hide the mouse cursor when typing, show again on movement
      hide-cursor = "when-typing enabled";

      # set server-side decorations to all windows
      rule-add = "ssd";

      # set keyboard repeat rate
      set-repeat = "50 300";

      # set background and border color
      background-color = "0x282c34";
      border-color-focused = "0x61afef";
      border-color-unfocused = "0x5c6370";
      border-color-urgent = "0xe06c75";

      # create keybindings
      map = {
        # normal mode
        normal = {

          # super + '...'
          Super = {
            # spawn terminal
            Return = "spawn kitty";

            # spawn firefox
            W = "spawn firefox";

            # application launcher
            D = "spawn fuzzel";

            # Super+J and Super+K to focus the next/previous view in the layout stack
            J = "focus-view next";
            K = "focus-view previous";

            # Super+Period and Super+Comma to focus the next/previous output
            # output == monitor
            Period = "focus-output next";
            Comma = "focus-output previous";

            # toggle window floating/tiling
            S = "toggle-float";

            # Super+F to toggle fullscreen
            F = "toggle-fullscreen";

            # wideriver
            up = "send-layout-cmd wideriver \"--layout monocle\"";
            down = "send-layout-cmd wideriver \"--layout wide --stack diminish --count 1 --ratio 0.4\"";
            left = "send-layout-cmd wideriver \"--layout left --stack diminish --count 1 --ratio 0.5\"";
            right = "send-layout-cmd wideriver \"--layout right --stack diminish --count 1 --ratio 0.5\"";

            Space = "send-layout-cmd wideriver \"--layout-toggle\"";

            plus = "send-layout-cmd wideriver \"--ratio +0.025\"";
            equal = "send-layout-cmd wideriver \"--ratio 0.50\"";
            minus = "send-layout-cmd wideriver \"--ratio -0.025\"";
          };

          "Super+Shift" = {
            # Super+Q to close the focused window
            Q = "close";
            # move window up and down in the stack
            J = "swap next";
            K = "swap previous";
            # Super+Shift+{Period,Comma} to send the focused view to the next/previous output
            Period = "send-to-output -current-tags next";
            Comma = "send-to-output -current-tags previous";
          };

          "Super+Shift+Control" = {
            plus = "send-layout-cmd wideriver \"--count +1\"";
            minus = "send-layout-cmd wideriver \"--count -1\"";

            # cycle wallpaper with swww
            space = "spawn \"${wallpaper_script_path}/bin/${wallpaper_script_name}\"";

            # lock the screen with swaylock
            L = "spawn \"swaylock --color 000000\"";
          };

          # Super+Shift+E to exit river
          "Super+Shift+Control+Alt Q" = "exit";

          # keybinds without modifiers
          None = {
            # Control pulse audio volume with pamixer (https://github.com/cdemoulins/pamixer)
            XF86AudioRaiseVolume = "spawn 'pamixer -i 5'";
            XF86AudioLowerVolume = "spawn 'pamixer -d 5'";
            XF86AudioMute = "spawn 'pamixer --toggle-mute'";
            XF86AudioMicMute = "spawn 'pamixer --default-source --toggle-mute'";

            # Control MPRIS aware media players with playerctl (https://github.com/altdesktop/playerctl)
            XF86AudioMedia = "spawn 'playerctl play-pause'";
            XF86AudioPlay = "spawn 'playerctl play-pause'";
            XF86AudioPrev = "spawn 'playerctl previous'";
            XF86AudioNext = "spawn 'playerctl next'";

            # Control screen backlight brightness with light (https://github.com/haikarainen/light)
            XF86MonBrightnessUp = "spawn 'brightnessctl set +5%'";
            XF86MonBrightnessDown = "spawn 'brightnessctl set 5%-'";
          };
        };
      };

      # mouse bindings
      map-pointer = {
        normal = {
          Super = {
            # Super + Left Mouse Button to move views
            BTN_LEFT = "move-view";

            # Super + Right Mouse Button to resize views
            BTN_RIGHT = "resize-view";

            # Super + Middle Mouse Button to toggle float
            BTN_MIDDLE = "toggle-float";
          };
        };
      };

      # start background processes
      spawn = [
        "\"swayidle -w timeout 600 'swaylock -f -c 000000' before-sleep 'swaylock -f -c 000000'\"" # lock screen
        "nm-applet" # network manager applet
        "mako" # notification daemon
        "\"swww-daemon --format xrgb\"" # walpaper daemon
        # propagate environment variables to user session
        "\"systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE XDG_SESSION_DESKTOP\""
        "\"dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE XDG_SESSION_DESKTOP\""
      ];
    };

    # extraConfig is appended to the end of the river config file verbatim
    extraConfig = ''

      # ===== start-up commands =====

      # start different programs depending on which system
      if [ "$(hostname)" = 'nostromo' ]; then
        bash /home/zander/dotfiles/wlr-randr/home.sh
        riverctl spawn nextcloud

      elif [ "$(hostname)" = 'orion' ]; then
        bash /home/zander/dotfiles/wlr-randr/orion.sh
        riverctl spawn nextcloud

      elif [ "$(hostname)" = 'phobos' ]; then
        bash /home/zander/dotfiles/wlr-randr/phobos.sh
        riverctl spawn nextcloud

      elif [ "$(hostname)" = 'venera' ]; then
        riverctl spawn nextcloud
        
      elif [ "$(hostname)" = 'gemini' ]; then
        echo ""

      elif [ "$(hostname)" = 'prometheus' ]; then
        bash /home/zander/dotfiles/wlr-randr/home.sh

      fi

      # ===== cycle tags =====
      # relies on extra riverwm-utils, see:
      # https://github.com/NickHastings/riverwm-utils
      # You might need to generate wayland protocol files,
      # call 'sudo cycle-focused-tags' to do so

      riverctl map normal Super Tab spawn "cycle-focused-tags +1 9"
      riverctl map normal Super+Shift Tab spawn "cycle-focused-tags -1 9"

      # ===== keymaps =====

      # take a screenshot with grim, use slurp to select the geometry
      # riverctl map normal Super+Shift+Control S spawn "wayshot --slurp \"\$(slurp)\" --stdout | wl-copy"
      riverctl map normal Super+Shift+Control S spawn "flameshot gui"
      # flameshot should always float
      riverctl rule-add -app-id "flameshot" float

      # switch keyboard layouts
      riverctl map normal Super+Shift+Control U spawn "riverctl keyboard-layout us"
      riverctl map normal Super+Shift+Control D spawn "riverctl keyboard-layout dk"
      # for laptop, rebind some keys to be more HHKB-esque
      riverctl map normal Super+Shift+Control Y spawn "riverctl keyboard-layout -options \"altwin:swap_lalt_lwin\" us-hhkb-esque"
      # riverctl map normal Super+Shift+Control Y spawn "riverctl keyboard-layout -options \"altwin:swap_lalt_lwin\" -variant laptop us"

      # Super+0 to focus all tags
      # Super+Shift+0 to tag focused view with all tags
      all_tags=$(((1 << 32) - 1))
      riverctl map normal Super 0 set-focused-tags $all_tags
      riverctl map normal Super+Shift 0 set-view-tags $all_tags


      # TODO: figure out how to do this in nix
      for i in $(seq 1 9); do
        tags=$((1 << (i - 1)))

        # Super+[1-9] to focus tag [0-8]
        riverctl map normal Super "$i" set-focused-tags $tags

        # Super+Shift+[1-9] to tag focused view with tag [0-8]
        riverctl map normal Super+Shift "$i" set-view-tags $tags

        # Super+Control+[1-9] to toggle focus of tag [0-8]
        riverctl map normal Super+Control "$i" toggle-focused-tags $tags

        # Super+Shift+Control+[1-9] to toggle tag [0-8] of focused view
        riverctl map normal Super+Shift+Control "$i" toggle-view-tags $tags
      done

      # ===== start rivertile =====

      # start wideriver
      wideriver \
        --layout left \
        --layout-alt monocle \
        --stack even \
        --count-master 1 \
        --ratio-master 0.50 \
        --count-wide-left 0 \
        --ratio-wide 0.50 \
        --smart-gaps \
        --inner-gaps 0 \
        --outer-gaps 0 \
        --border-width 1 \
        --border-width-monocle 1 \
        --border-width-smart-gaps 1 \
        --border-color-focused "0x61afef" \
        --border-color-focused-monocle "0x5c6370" \
        --border-color-unfocused "0x5c6370" \
        --log-threshold info \
        >"/tmp/wideriver.log" 2>&1 &
    '';
  };
}
