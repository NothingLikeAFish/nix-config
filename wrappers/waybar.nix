{ inputs, self, ... }:

{
  flake.wrappers.waybar = { wlib, colours, pkgs, lib, ... }: {
    imports = [ wlib.wrapperModules.waybar ];
    settings = {
      height = 30;
      width = 2; # jank for centered dynamic size
      spacing = 8;
      modules-center = [
        "sway/workspaces"
        "sway/window"

        "cpu"
        "memory"

        "network"
        "battery"
      ];

      "sway/window" = {
        min-length = 50;
      };

      "network" = {
        format = "{essid}";
        on-click = "${lib.getExe pkgs.foot} nmtui";
      };
    };
    "style.css".content = ''
      * {
        font-family: JetBrainsMono Nerd Font; /* fix so wrapper has font as dependancy */
        font-size: 12pt;
      }
      window#waybar {
        background: alpha(#${self.colours.base00}, 0.8);
        color: #${self.colours.base05};
        border-bottom: 2px solid #${self.colours.base01};
        border-left: 2px solid #${self.colours.base01};
        border-right: 2px solid #${self.colours.base01};
      }
      .modules-center {
        padding-left: 8px;
        padding-right: 8px;
      }
    '';
  };
}
