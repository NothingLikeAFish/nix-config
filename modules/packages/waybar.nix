{ inputs, self, ... }:

{
  flake.modules.homeManager.waybar = { pkgs, lib, colours, ... }: {
    programs.waybar = {
      enable = true;
      settings = {
        bar = {
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
      };

      style = ''
        * {
          font-family: JetBrainsMono Nerd Font;
          font-size: 12pt;
        }
        window#waybar {
          background: alpha(${colours.withHashtag.base00}, 0.8);
          color: ${colours.withHashtag.base05};
          border-bottom: 2px solid ${colours.withHashtag.base01};
          border-left: 2px solid ${colours.withHashtag.base01};
          border-right: 2px solid ${colours.withHashtag.base01};
        }
        .modules-center {
          padding-left: 8px;
          padding-right: 8px;
        }
      '';
    };
  };
}
