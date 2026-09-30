{ inputs, self, ... }:

{
  flake.modules.nixos.packages-rofi = { lib, pkgs, ... }: {
    home-manager.users.jasper = {
      programs.rofi = {
        enable = true;
        settings = {
          terminal = lib.getExe pkgs.foot;
        };
        theme = {
          inputbar = {
            background-image = "${self.wallpaper}";
          };
        };
      };
    };
  };
}
