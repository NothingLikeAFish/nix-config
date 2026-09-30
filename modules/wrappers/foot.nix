{ inputs, self, ... }:

{
  flake.wrappers.foot = { wlib, ... }: {
    imports = [ wlib.wrapperModules.foot ];
    settings = {
      colors-dark = {
        alpha = 0.8;
        background = self.colours.base00;
        foreground = self.colours.base05;
        regular0 = self.colours.base00; # Black, could also be base01
        regular1 = self.colours.base08; # Red
        regular2 = self.colours.base0B; # Green
        regular3 = self.colours.base0A; # Yellow
        regular4 = self.colours.base0D; # Blue
        regular5 = self.colours.base0E; # Magenta
        regular6 = self.colours.base0C; # Cyan
        regular7 = self.colours.base05; # White
        bright0 = self.colours.base03;
        bright1 = self.colours.base09;
        bright2 = self.colours.base01;
        bright3 = self.colours.base02;
        bright4 = self.colours.base04;
        bright5 = self.colours.base06;
        bright6 = self.colours.base0F;
        bright7 = self.colours.base07;
      };
    };
  };
}
