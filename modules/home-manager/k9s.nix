{ ... }:
{
  programs.k9s = {
    enable = true;

    # settings and skins was generated using:
    # https://github.com/euank/yaml2nix

    settings = {
      k9s = {
        ui = {
          skin = "one-dark";
          enableMouse = true;
          headless = true;
          logoless = false;
          crumbsless = false;
          reactive = false;
          noIcons = false;
        };
      };
    };

    skins = {
      one-dark = {
        k9s = {
          body = {
            fgColor = "#abb2bf";
            bgColor = "#282c34";
            logoColor = "#98c379";
          };
          prompt = {
            fgColor = "#abb2bf";
            bgColor = "#282c34";
            suggestColor = "#ffb86c";
          };
          info = {
            fgColor = "#abb2bf";
            sectionColor = "#98c379";
          };
          help = {
            fgColor = "#abb2bf";
            bgColor = "#282c34";
            keyColor = "#e5c07b";
            numKeyColor = "#61afef";
            sectionColor = "#c678dd";
          };
          dialog = {
            fgColor = "#080808";
            bgColor = "#282c34";
            buttonFgColor = "#abb2bf";
            buttonBgColor = "#98c379";
            buttonFocusFgColor = "#080808";
            buttonFocusBgColor = "#61afef";
            labelFgColor = "#ffb86c";
            fieldFgColor = "#61afef";
          };
          frame = {
            border = {
              fgColor = "#98c379";
              focusColor = "#98c379";
            };
            menu = {
              fgColor = "#abb2bf";
              keyColor = "#e5c07b";
              numKeyColor = "#e5c07b";
            };
            crumbs = {
              fgColor = "#080808";
              bgColor = "#98c379";
              activeColor = "#e5c07b";
            };
            status = {
              newColor = "#61afef";
              modifyColor = "#98c379";
              addColor = "#abb2bf";
              pendingColor = "#ffb86c";
              errorColor = "#e06370";
              highlightColor = "#e5c07b";
              killColor = "#c678dd";
              completedColor = "#abb2bf";
            };
            title = {
              fgColor = "#61afef";
              bgColor = "#282c34";
              highlightColor = "#c678dd";
              counterColor = "#abb2bf";
              filterColor = "#61afef";
            };
          };
          views = {
            charts = {
              bgColor = "#282c34";
              defaultDialColors = [
                "#98c379"
                "#e06370"
              ];
              defaultChartColors = [
                "#98c379"
                "#e06370"
              ];
            };
            table = {
              fgColor = "#e5c07b";
              bgColor = "#282c34";
              cursorFgColor = "#080808";
              cursorBgColor = "#61afef";
              markColor = "#d19a66";
              header = {
                fgColor = "#abb2bf";
                bgColor = "#282c34";
                sorterColor = "#ffb86c";
              };
            };
            xray = {
              fgColor = "#61afef";
              bgColor = "#282c34";
              cursorColor = "#abb2bf";
              graphicColor = "#d19a66";
              showIcons = false;
            };
            yaml = {
              keyColor = "#e06370";
              colonColor = "#abb2bf";
              valueColor = "#abb2bf";
            };
            logs = {
              fgColor = "#abb2bf";
              bgColor = "#282c34";
              indicator = {
                fgColor = "#61afef";
                bgColor = "#282c34";
                toggleOnColor = "#e06370";
                toggleOffColor = "#abb2bf";
              };
            };
            help = {
              fgColor = "#abb2bf";
              bgColor = "#282c34";
              indicator = {
                fgColor = "#61afef";
              };
            };
          };
        };
      };
    };
  };
}
