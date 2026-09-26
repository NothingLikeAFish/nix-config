{ inputs, self, ... }:

{
  flake.modules.nixos.services = {
    imports = with self.modules.nixos; [
      services-system
      services-user
    ];
  };

  flake.modules.nixos.services-system = {
    services.printing.enable = true; # Printing support
  };

  flake.modules.nixos.services-user = {

  };
}
