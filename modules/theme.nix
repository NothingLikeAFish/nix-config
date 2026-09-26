{ inputs, self, ... }:

{
  flake.nixosModules.theme = { config, ... }: {
    imports = [ inputs.stylix.nixosModules.stylix ];

    stylix = {
      enable = true;
      image = self.wallpaper;
      autoEnable = false;
    };

    _module.args.theme = config.lib.stylix.colors; # Exports theme
  };
}
