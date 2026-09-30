{ inputs, self, ... }:

{
  flake.modules.nixos.packages-waybar = { pkgs, lib, colours, ... }: {
    home-manager.users.jasper = {
      programs.waybar = {
        enable = true;
        settings = {
          bar = {
            height = 30;
            width = 2; # jank for centered dynamic size
            spacing = 16;
            modules-center = [
              "sway/workspaces"
              "backlight"
              "wireplumber"
              "network"
              "battery"
              "clock"
            ];

            "backlight" = {
              format = "{icon} {percent}%";
              format-icons = [ "󰃝" "󰃞" "󰃟" "󰃠" ];
            };
            "wireplumber" = {
              format = "{icon} {volume}%";
              format-icons = [ "󰕿" "󰖀" "󰕾" ];
              format-muted = "󰝟 ";
            };
            "network" = {
              format = "󰖩 {essid}";
              on-click = "${lib.getExe pkgs.foot} nmtui";
            };
            "battery" = {
             	format = "{icon} {capacity}%";
              format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
            };
            "clock" = {
              format = "󰥔 {:%H:%M}";
            };
          };
        };

        style = ''
          * {
            font-family: JetBrainsMono Nerd Font;
            font-size: 12pt;
            text-shadow: none;
            border: none;
            border-radius: 0;
          }
          window#waybar {
            background: alpha(${colours.withHashtag.base00}, 0.95);
            color: ${colours.withHashtag.base05};
            font-weight: bold;
          }
          tooltip {
            background: alpha(${colours.withHashtag.base00}, 0.95);
          }
          tooltip box {
            padding: 0px;
            margin: 0px;
          }
          tooltip label {
            color: ${colours.withHashtag.base04};
            padding: 0px;
            margin: 0px;
          }
          .modules-center {
            padding-left: 8px;
            padding-right: 8px;
          }
          #workspaces button {
            color: ${colours.withHashtag.base01};
            padding: 0px;
          }
          #workspaces button.focused {
            color: ${colours.withHashtag.base05};
          }
        '';
      };
    };
  };
}
