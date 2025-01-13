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

      nitch
    '';

    shellAbbrs = {
      g = "git";
      ls = "eza --icons";
      l = "eza --icons --git -alh";
      t = "go-task";
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
