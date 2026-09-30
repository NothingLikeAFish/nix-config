{ inputs, self, ... }:

{
  flake.modules.nixos.packages-foot = { colours, ... }: {
    home-manager.users.jasper = {
      programs.foot = {
        enable = true;
        settings = {

          colors-dark = {
            alpha = 0.95;
            foreground = colours.base05;
            background = colours.base00;
            regular0 = colours.base00; # black
            regular1 = colours.base08; # red
            regular2 = colours.base0B; # green
            regular3 = colours.base0A; # yellow
            regular4 = colours.base0D; # blue
            regular5 = colours.base0E; # magenta
            regular6 = colours.base0C; # cyan
            regular7 = colours.base05; # white
            bright0 = colours.base02; # bright black
            bright1 = colours.base08; # bright red
            bright2 = colours.base0B; # bright green
            bright3 = colours.base0A; # bright yellow
            bright4 = colours.base0D; # bright blue
            bright5 = colours.base0E; # bright magenta
            bright6 = colours.base0C; # bright cyan
            bright7 = colours.base07; # bright white
            "16" = colours.base09;
            "17" = colours.base0F;
            "18" = colours.base01;
            "19" = colours.base02;
            "20" = colours.base04;
            "21" = colours.base06;
          };
        };
      };
    };
  };
}
