{ config, pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    # throws error?
    # enableFishIntegration = true;
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.yazi = {
    enableFishIntegration = true;
    # shellWrapperName = "yy"; # this doesn't seem to work

    # these don't seem to work either
    settings = {
      manager = {
        show_hidden = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fish = {
    enable = true;
    generateCompletions = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting

      # add wrapper function for launching yazi
      function yy
      	set tmp (mktemp -t "yazi-cwd.XXXXXX")
      	yazi $argv --cwd-file="$tmp"
      	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
      		builtin cd -- "$cwd"
      	end
      	rm -f -- "$tmp"
      end

      # setup ssh-agent and add keys, supress output
      eval (ssh-agent -c) &> /dev/null
      ssh-add &> /dev/null

      nitch
    '';

    shellAbbrs = {
      g = "git";
      ls = "eza --icons";
      l = "eza --icons --git -alh";
      # t = "task";
      k = "kubectl";
      knr = "kubectl describe nodes |grep '^  Resource' -A3";
      n = "nvim";
      gs = "git status";
      lg = "lazygit";
      ncdu = "ncdu --color dark -rr";
      ping = "prettyping --nolegend";
      cat = "bat";
      # docker
      docker_status = "echo -e \"\nContainers:\n\" && docker ps -a && echo -e \"\nImages:\n\" && docker image ls && echo -e \"\nVolumes:\n\" && docker volume ls";
      docker_clean = "docker volume prune -f && docker system prune -f";
      # python dev
      rl = "run_linters";
      pt = "pytest";
      rlt = "figlet 'run_linters' ; run_linters ; figlet 'pytest' ; pytest";
      ruff_fix = "ruff check . --config linting/.ruff.toml --fix";
      b = "black .";
      # github cli
      ghre = "gh repo view --web";
      ghpr = "gh pr view --web";
      firmware_update = "sudo fwupdmgr refresh --force && sudo fwupdmgr get-updates && sudo fwupdmgr update";
    };

    plugins = [
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "fish-you-should-use";
        src = pkgs.fishPlugins.fish-you-should-use.src;
      }
      {
        name = "colored-man-pages";
        src = pkgs.fishPlugins.colored-man-pages.src;
      }
      {
        name = "plugin-git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      {
        name = "fish-bd";
        src = pkgs.fishPlugins.fish-bd.src;
      }
    ];
  };
}
