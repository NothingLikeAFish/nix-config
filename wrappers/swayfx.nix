{ inputs, self, ... }:

{
  flake.wrappers.swayfx = { wlib, pkgs, lib, config, ... }: {
    imports = [ wlib.modules.default ];
    package = pkgs.swayfx;
    flags."-c" = config.constructFiles.config.path;
    constructFiles.config = {
      relPath = "config";
      content = ''
        exec ${lib.getExe pkgs.autotiling}

        output * bg ${self.wallpaper} fill

        # CLAMSHELL MODE
        bindswitch --reload --locked lid:on output eDP-1 disable
        bindswitch --reload --locked lid:off output eDP-1 enable

        animation_duration_ms 250
        gaps inner 8
        default_border pixel 2
        corner_radius 0
        shadows enable

        client.focused #${self.colours.base02} #${self.colours.base02} #${self.colours.base02} #${self.colours.base02}
        client.unfocused #${self.colours.base01} #${self.colours.base01} #${self.colours.base01} #${self.colours.base01}
        client.urgent #${self.colours.base0D} #${self.colours.base0D} #${self.colours.base0D} #${self.colours.base0D}


        seat seat0 xcursor_theme Bibata-Modern-Classic 24

        bar {
          swaybar_command ${lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.waybar}
        }

        # INPUTS
        input type:touchpad {
          natural_scroll enabled
          dwtp enabled
        }
        input type:trackpoint {
          dwt enabled
        }
        input type:touch {
          # figure out how to disable
        }

        # KEYBINDS
        set $mod Mod4
        floating_modifier $mod normal

        bindsym $mod+q kill
        bindsym $mod+f fullscreen

        bindsym $mod+Left focus left
        bindsym $mod+Down focus down
        bindsym $mod+Up focus up
        bindsym $mod+Right focus right
        bindsym $mod+Shift+Left move left
        bindsym $mod+Shift+Down move down
        bindsym $mod+Shift+Up move up
        bindsym $mod+Shift+Right move right

        bindsym $mod+Shift+space floating toggle

        bindsym $mod+1 workspace number 1
        bindsym $mod+2 workspace number 2
        bindsym $mod+3 workspace number 3
        bindsym $mod+4 workspace number 4
        bindsym $mod+5 workspace number 5
        bindsym $mod+6 workspace number 6
        bindsym $mod+7 workspace number 7
        bindsym $mod+8 workspace number 8
        bindsym $mod+9 workspace number 9
        bindsym $mod+0 workspace number 10
        bindsym $mod+Shift+1 move container to workspace number 1
        bindsym $mod+Shift+2 move container to workspace number 2
        bindsym $mod+Shift+3 move container to workspace number 3
        bindsym $mod+Shift+4 move container to workspace number 4
        bindsym $mod+Shift+5 move container to workspace number 5
        bindsym $mod+Shift+6 move container to workspace number 6
        bindsym $mod+Shift+7 move container to workspace number 7
        bindsym $mod+Shift+8 move container to workspace number 8
        bindsym $mod+Shift+9 move container to workspace number 9
        bindsym $mod+Shift+0 move container to workspace number 10

        bindsym $mod+Return exec ${lib.getExe pkgs.foot}
        bindsym $mod+Space exec ${lib.getExe pkgs.rofi} -show drun
        bindsym $mod+Shift+e exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'
      '';
    };
  };
}
