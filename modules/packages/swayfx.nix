{ inputs, self, ... }:

{
  flake.modules.nixos.packages-swayfx = { pkgs, lib, colours, ... }: {
    programs.sway = {
      enable = true;
      package = pkgs.swayfx;
    };

    home-manager.sharedModules = {
      wayland.windowManager.sway = {
        enable = true;
        package = pkgs.swayfx;
        checkConfig = false;
        extraConfig = ''
          animation_duration_ms 250
          corner_radius 0
          shadows enable
        '';
        config = {
          startup = [ # Things to start
            { command = lib.getExe pkgs.autotiling; }
          ];

          output."*".bg = "${self.wallpaper} fill"; # Wallpaper

          bars = [ { command = "${lib.getExe pkgs.waybar} --log-level off"; } ]; # Waybar

          bindswitches = { # Clamshell logic
            "lid:on" = { reload = true; locked = true; action = "output eDP-1 diable"; };
            "lid:off" = { reload = true; locked = true; action = "output eDP-1 enable"; };
          };

          input = {
            "type:touchpad" = {
              natural_scroll = "enabled";
              dwtp = "enabled"; # Doesn't work
            };

            "type:trackpoint" = {
              dwt = "enabled";
            };
          };

          modifier = "Mod4";

          keybindings = let mod = config.wayland.windowManager.sway.config.modifier; in {
            "${mod}+q" = "kill";
            "${mod}+f" = "fullscreen";
            "${mod}+Left" = "focus left";
            "${mod}+Down" = "focus down";
            "${mod}+Up" = "focus up";
            "${mod}+Right" = "focus right";
            "${mod}+Shift+Left" = "move left";
            "${mod}+Shift+Down" = "move down";
            "${mod}+Shift+Up" = "move up";
            "${mod}+Shift+Right" = "move right";
            "${mod}+Shift+space" = "floating toggle";
            "${mod}+1" = "workspace number 1";
            "${mod}+2" = "workspace number 2";
            "${mod}+3" = "workspace number 3";
            "${mod}+4" = "workspace number 4";
            "${mod}+5" = "workspace number 5";
            "${mod}+6" = "workspace number 6";
            "${mod}+7" = "workspace number 7";
            "${mod}+8" = "workspace number 8";
            "${mod}+9" = "workspace number 9";
            "${mod}+0" = "workspace number 10";
            "${mod}+Shift+1" = "move container to workspace number 1";
            "${mod}+Shift+2" = "move container to workspace number 2";
            "${mod}+Shift+3" = "move container to workspace number 3";
            "${mod}+Shift+4" = "move container to workspace number 4";
            "${mod}+Shift+5" = "move container to workspace number 5";
            "${mod}+Shift+6" = "move container to workspace number 6";
            "${mod}+Shift+7" = "move container to workspace number 7";
            "${mod}+Shift+8" = "move container to workspace number 8";
            "${mod}+Shift+9" = "move container to workspace number 9";
            "${mod}+Shift+0" = "move container to workspace number 10";
            "${mod}+Return" = "exec ${lib.getExe pkgs.foot}";
            "${mod}+Space" = "exec ${lib.getExe pkgs.rofi} -show drun";
            "${mod}+Shift+e" = "exec swaynag -t warning -m 'Do you want to exit sway?' -B 'Exit sway' 'swaymsg exit'";
          };

          gaps.inner = 8;

          window = {
            titlebar = false;
            border = 2;
          };

          colors = {
            background = colours.withHashtag.base00;
            focused = {
              border = colours.withHashtag.base02;
              background = colours.withHashtag.base00;
              text = colours.withHashtag.base05;
              indicator = colours.withHashtag.base02;
              childBorder = colours.withHashtag.base02;
            };
            focusedInactive = {
              border = colours.withHashtag.base01;
              background = colours.withHashtag.base00;
              text = colours.withHashtag.base04;
              indicator = colours.withHashtag.base01;
              childBorder = colours.withHashtag.base01;
            };
            unfocused = {
              border = colours.withHashtag.base01;
              background = colours.withHashtag.base00;
              text = colours.withHashtag.base04;
              indicator = colours.withHashtag.base01;
              childBorder = colours.withHashtag.base01;
            };
            placeholder = {
              border = colours.withHashtag.base01;
              background = colours.withHashtag.base00;
              text = colours.withHashtag.base04;
              indicator = colours.withHashtag.base01;
              childBorder = colours.withHashtag.base01;
            };
            urgent = {
              border = colours.withHashtag.red;
              background = colours.withHashtag.base00;
              text = colours.withHashtag.red;
              indicator = colours.withHashtag.red;
              childBorder = colours.withHashtag.red;
            };
          };
        };
      };
    };
  };
}
