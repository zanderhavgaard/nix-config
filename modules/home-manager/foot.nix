{ ... }:
{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "Hack Nerd Font";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      colors = {
        alpha = 0.9;

        foreground = "979eab";
        background = "282c34";
        regular0 = "282c34"; # black
        regular1 = "e06c75"; # red
        regular2 = "98c379"; # green
        regular3 = "e5c07b"; # yellow
        regular4 = "61afef"; # blue
        regular5 = "be5046"; # magenta
        regular6 = "56b6c2"; # cyan
        regular7 = "979eab"; # white
        bright0 = "393e48"; # bright black
        bright1 = "d19a66"; # bright red
        bright2 = "56b6c2"; # bright green
        bright3 = "e5c07b"; # bright yellow
        bright4 = "61afef"; # bright blue
        bright5 = "be5046"; # bright magenta
        bright6 = "56b6c2"; # bright cyan
        bright7 = "abb2bf"; # bright white
      };
    };
  };
}
