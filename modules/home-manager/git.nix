{ ... }:
{
  programs.git = {
    enable = true;

    userName = "zanderhavgaard";
    userEmail = "zander@havgaard.dk";

    signing = {
      # enabling this will sign both commits and tags,
      # which will have the side effect of creating 'annotated' tags
      # by default, which can be problematic for references on github
      # instead I explicitly enable commit signing below
      signByDefault = false;
      key = "9FB78AB62EDDC533";
    };

    extraConfig = {
      commit = {
        gpgSign = true;
      };

      pull = {
        rebase = true;
      };

      push = {
        autoSetupRemote = true;
      };

      color = {
        ui = true;
      };

      core = {
        editor = "nvim";
      };
    };

    delta = {
      enable = true;
      options = {
        side-by-side = true;
        navigate = true;
        light = false;
        line-numbers = true;
        syntax-theme = "OneHalfDark";
        zero-style = "syntax dim";
        minus-style = "syntax bold auto";
      };
    };

    aliases = {
      # list aliases
      aliases = "!git config --list | grep 'alias\\.' | sed 's/alias\\.\\([^=]*\\)=\\(.*\\)/\\1\\ \t => \\2/' | sort";
      # Unstage changes from the index
      unstage = "reset HEAD --";
      # show git log history
      g = "!git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %C(bold blue)<%an>%Creset %Cgreen(%cr)%Creset %s' --abbrev-commit --date=relative --all";
      # small log output
      l = "!git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %C(bold blue)<%an>%Creset %Cgreen(%cr)%Creset %s' --abbrev-commit --date=relative -n 10";
      la = "!git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %C(bold blue)<%an>%Creset %Cgreen(%cr)%Creset %s' --abbrev-commit --date=relative -n 10 --all";
      lag = "!git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %C(bold blue)<%an>%Creset %Cgreen(%cr)%Creset %s' --abbrev-commit --date=relative -n 10 --all --graph";
      # make new branch and check it out
      nb = "checkout -b";
      # add all files to staging
      a = "add -u .";
      # commit with a message
      cm = "commit -m";
      # checout branch
      c = "checkout";
      # list branches
      b = "branch -av";
      # remove branch
      rmb = "branch --delete --force";
      s = "status";
      p = "push";
      fp = "push --force-with-lease";
      # push tags
      pt = "push --tags";
      # clean interactively
      ci = "clean -i";
      # get sha of last commit on current branch
      sha = "rev-parse HEAD";
    };
  };
}
