{ inputs, self, ... }:

{
  flake.modules.nixos.theme = {
    imports = with self.modules.nixos; [
      theme-colours
      theme-cursor
    ];
  };

  flake.modules.nixos.theme-colours = { config, ... }: {
    imports = [ inputs.stylix.nixosModules.stylix ];
    stylix = {
      enable = true;
      image = self.wallpaper;
      autoEnable = false;
    };
    _module.args.colours = config.lib.stylix.colors; # Exports theme
  };

  flake.modules.nixos.theme-cursor = { pkgs, ... }: {
    home-manager.users.jasper = {
      home.pointerCursor = {
        enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 24;
        gtk.enable = true;
        x11.enable = true;
        sway.enable = true;
      };
    };
  };
}
