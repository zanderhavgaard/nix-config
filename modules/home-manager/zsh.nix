{ ... }:
{

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.yazi = {
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;

    initExtra = ''
      # use 
      autoload -U edit-command-line

      # use pspg
      export PSQL_PAGER='pspg -X -b'

      # wrapper function to start yazi
      function yy() {
      	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
      	yazi "$@" --cwd-file="$tmp"
      	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      		cd -- "$cwd"
      	fi
      	rm -f -- "$tmp"
      }

      # generate password
      function random_password {
          for foo in $(seq 5) ; do
              date +%s | sha256sum | base64 | head -c 50 ; echo ; sleep 1
          done
      }
    '';

    shellAliases = {
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

    zplug = {
      enable = true;

      plugins = [

        # oh-my-zsh plugins
        #
        {
          name = "lib/*";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/git";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/ssh-agent";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/fzf";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/colored-man-pages";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/ripgrep";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/git";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/gitignore";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/gh";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/docker";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/docker-compose";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/kubernetes";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/kubectl";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/helm";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/aws";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/python";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/pip";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugins/golang";
          tags = [ "from:oh-my-zsh" ];
        }

        # generic plugins
        {
          name = "MichaelAquilina/zsh-autoswitch-virtualenv";
          tags = [
            "from:github"
            "as:plugin"
          ];
        }
        {
          name = "hlissner/zsh-autopair";
          tags = [
            "from:github"
            "as:plugin"
          ];
        }
        {
          name = "djui/alias-tips";
          tags = [
            "from:github"
            "as:plugin"
          ];
        }
        {
          name = "MichaelAquilina/zsh-auto-notify";
          tags = [
            "from:github"
            "as:plugin"
          ];
        }
        {
          name = "zsh-users/zsh-autosuggestions";
          tags = [
            "from:github"
            "as:plugin"
          ];
        }
        {
          name = "zsh-users/zsh-syntax-highlighting";
          tags = [
            "from:github"
            "as:plugin"
            "defer:2"
          ];
        }
      ];
    };
  };
}
