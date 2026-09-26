{ inputs, self, ... }:

{
  flake.modules.nixos.packages-swayfx = { pkgs, lib, ... }:
    let
      config = pkgs.writeText "config" ''
        output * bg ${self.wallpaper} fill

        bindsym Mod4+Return exec ${lib.getExe pkgs.foot}
      '';
    in {
    programs.sway = {
      enable = true;
      package = pkgs.swayfx;
      extraOptions = [ "-c" "${config}" ];
      extraPackages = with pkgs; [
        swaybg
      ];
    };
  };
}
