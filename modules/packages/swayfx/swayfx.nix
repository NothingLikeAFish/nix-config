{
  flake.modules.nixos.packages.swayfx = { pkgs, ... }: {
    programs.sway = {
      enable = true;
      package = pkgs.swayfx;
    };
  };
}
