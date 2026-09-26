{
  flake.modules.nixos.packages-swayfx = { pkgs, lib, ... }:
    let
      config = pkgs.writeText "config" ''
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
